import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/property_provider.dart';
import '../utils/indian_states.dart';
import '../models/property.dart';
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;

class ListPropertyScreen extends StatefulWidget {
  final Property? property;
  const ListPropertyScreen({Key? key, this.property}) : super(key: key);

  @override
  State<ListPropertyScreen> createState() => _ListPropertyScreenState();
}

class _ListPropertyScreenState extends State<ListPropertyScreen> {
  final _formKey = GlobalKey<FormState>();
  String? name, address, contact, state, description;
  XFile? image;

  @override
  void initState() {
    super.initState();
    if (widget.property != null) {
      name = widget.property!.name;
      address = widget.property!.address;
      contact = widget.property!.contact;
      state = widget.property!.state;
      description = widget.property!.description;
    }
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context, listen: false);
    final isEditing = widget.property != null;
    return Scaffold(
      appBar: AppBar(title: Text(isEditing ? 'Edit Property' : 'List Property')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              GestureDetector(
                onTap: () async {
                  final img = await ImagePicker().pickImage(source: ImageSource.gallery);
                  setState(() => image = img);
                },
                child: Container(
                  height: 180,
                  color: Colors.grey[200],
                  child: image != null
                      ? kIsWeb
                          ? Image.network(image!.path, fit: BoxFit.cover)
                          : Image.file(File(image!.path), fit: BoxFit.cover)
                      : (isEditing && widget.property!.imageUrl != null)
                          ? Image.network(widget.property!.imageUrl!, fit: BoxFit.cover)
                          : const Icon(Icons.camera_alt, size: 60),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                initialValue: name,
                decoration: const InputDecoration(labelText: 'Property Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter name' : null,
                onSaved: (v) => name = v,
              ),
              TextFormField(
                initialValue: address,
                decoration: const InputDecoration(labelText: 'Address'),
                validator: (v) => v == null || v.isEmpty ? 'Enter address' : null,
                onSaved: (v) => address = v,
              ),
              TextFormField(
                initialValue: contact,
                decoration: const InputDecoration(labelText: 'Contact Info'),
                keyboardType: TextInputType.phone,
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Enter contact';
                  final phoneRegExp = RegExp(r'^\+?[0-9]{10,15}?$');
                  if (!phoneRegExp.hasMatch(v)) return 'Enter a valid phone number';
                  return null;
                },
                onSaved: (v) => contact = v,
              ),
              TextFormField(
                initialValue: description,
                decoration: const InputDecoration(labelText: 'Description'),
                maxLines: 3,
                validator: (v) => v == null || v.isEmpty ? 'Enter description' : null,
                onSaved: (v) => description = v,
              ),
              DropdownButtonFormField<String>(
                value: state,
                decoration: const InputDecoration(labelText: 'State'),
                items: indianStates.map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
                onChanged: (v) => state = v,
                validator: (v) => v == null ? 'Select state' : null,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    try {
                      if (isEditing) {
                        await provider.updateProperty(
                          propertyId: widget.property!.id,
                          name: name!,
                          address: address!,
                          contact: contact!,
                          state: state!,
                          description: description!,
                          image: image,
                        );
                        if (mounted) {
                          Navigator.pop(context, true);
                        }
                      } else {
                        await provider.addProperty(
                          name: name!,
                          address: address!,
                          contact: contact!,
                          state: state!,
                          description: description!,
                          image: image,
                        );
                        if (mounted) {
                          Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
                        }
                      }
                    } catch (e) {
                      showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          title: const Text('Error'),
                          content: Text('Failed to ${isEditing ? 'update' : 'list'} property: ${e.toString()}'),
                          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
                        ),
                      );
                    }
                  }
                },
                child: Text(isEditing ? 'Update Property' : 'List Property'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
