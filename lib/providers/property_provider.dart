import 'dart:io';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../models/property.dart';

class PropertyProvider extends ChangeNotifier {
  List<Property> _properties = [];
  String? _selectedState;
  Set<String> _favourites = {};
  Set<String> get favourites => _favourites;

  List<Property> get filteredProperties => _selectedState == null
      ? _properties
      : _properties.where((p) => p.state == _selectedState).toList();
  String? get selectedState => _selectedState;
  List<Property> get myProperties {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) return [];
    return _properties.where((p) => p.ownerId == uid).toList();
  }

  List<Property> get favouriteProperties =>
      _properties.where((p) => _favourites.contains(p.id)).toList();

  PropertyProvider() {
    fetchProperties();
    loadFavourites();
  }

  Future<void> fetchProperties() async {
    final snapshot = await FirebaseFirestore.instance.collection('properties').get();
    _properties = snapshot.docs
        .map((doc) => Property.fromMap(doc.data(), doc.id))
        .toList();
    notifyListeners();
  }

  void filterByState(String? state) {
    _selectedState = state;
    notifyListeners();
  }

  Future<void> addProperty({
    required String name,
    required String address,
    required String contact,
    required String state,
    required String description,
    XFile? image,
  }) async {
    try {
      String? imageUrl;
      if (image != null) {
        final ref = FirebaseStorage.instance.ref('property_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
        if (kIsWeb) {
          final bytes = await image.readAsBytes();
          await ref.putData(bytes);
        } else {
          await ref.putFile(File(image.path));
        }
        imageUrl = await ref.getDownloadURL();
      }
      final uid = FirebaseAuth.instance.currentUser?.uid;
      if (uid == null) throw Exception('User not logged in');
      await FirebaseFirestore.instance.collection('properties').add({
        'name': name,
        'address': address,
        'contact': contact,
        'state': state,
        'description': description,
        'imageUrl': imageUrl,
        'ownerId': uid,
      });
      await fetchProperties();
      notifyListeners();
    } catch (e, st) {
      print('Error in addProperty: $e\n$st');
      rethrow;
    }
  }

  Future<void> loadFavourites() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _favourites = prefs.getStringList('favourites')?.toSet() ?? {};
      notifyListeners();
    } catch (e) {
      // Fail silently, no crash
    }
  }

  Future<void> toggleFavourite(String propertyId) async {
    try {
      if (_favourites.contains(propertyId)) {
        _favourites.remove(propertyId);
      } else {
        _favourites.add(propertyId);
      }
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList('favourites', _favourites.toList());
      notifyListeners();
    } catch (e) {
      // Fail silently, no crash
    }
  }

  bool isFavourite(String propertyId) => _favourites.contains(propertyId);

  // NEW: Delete property by ID
  Future<void> deleteProperty(String propertyId) async {
    try {
      await FirebaseFirestore.instance.collection('properties').doc(propertyId).delete();
      await fetchProperties();
      notifyListeners();
    } catch (e) {
      print('Error deleting property: $e');
      rethrow;
    }
  }

  // NEW: Update property by ID
  Future<void> updateProperty({
    required String propertyId,
    required String name,
    required String address,
    required String contact,
    required String state,
    required String description,
    XFile? image,
  }) async {
    try {
      String? imageUrl;
      if (image != null) {
        final ref = FirebaseStorage.instance.ref('property_images/${DateTime.now().millisecondsSinceEpoch}.jpg');
        if (kIsWeb) {
          final bytes = await image.readAsBytes();
          await ref.putData(bytes);
        } else {
          await ref.putFile(File(image.path));
        }
        imageUrl = await ref.getDownloadURL();
      }
      final updateData = {
        'name': name,
        'address': address,
        'contact': contact,
        'state': state,
        'description': description,
      };
      if (imageUrl != null) {
        updateData['imageUrl'] = imageUrl;
      }
      await FirebaseFirestore.instance.collection('properties').doc(propertyId).update(updateData);
      await fetchProperties();
      notifyListeners();
    } catch (e, st) {
      print('Error in updateProperty: $e\n$st');
      rethrow;
    }
  }
}
