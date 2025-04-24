import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/property_provider.dart';
import '../widgets/property_card.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context);
    final favourites = provider.favouriteProperties;
    return Scaffold(
      appBar: AppBar(title: const Text('Favourites')),
      body: favourites.isEmpty
          ? const Center(child: Text('No favourite properties yet.'))
          : ListView.builder(
              itemCount: favourites.length,
              itemBuilder: (context, index) => PropertyCard(
                property: favourites[index],
              ),
            ),
    );
  }
}
