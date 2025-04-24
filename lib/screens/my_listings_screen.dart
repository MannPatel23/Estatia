import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/property_provider.dart';
import '../widgets/property_card.dart';
import 'list_property_screen.dart';

class MyListingsScreen extends StatelessWidget {
  const MyListingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context);
    final myProperties = provider.myProperties;
    return Scaffold(
      appBar: AppBar(title: const Text('My Listings')),
      body: myProperties.isEmpty
          ? const Center(child: Text('No properties listed by you.'))
          : ListView.builder(
              itemCount: myProperties.length,
              itemBuilder: (context, index) => PropertyCard(
                property: myProperties[index],
                onEdit: () async {
                  // Navigate to list_property_screen.dart for editing, passing property
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ListPropertyScreen(
                        property: myProperties[index],
                      ),
                    ),
                  );
                  if (result == true) {
                    provider.fetchProperties();
                  }
                },
                onDelete: () async {
                  final confirm = await showDialog<bool>(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: const Text('Delete Listing'),
                      content: const Text('Are you sure you want to delete this listing?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx, false),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(ctx, true),
                          child: const Text('Delete', style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                  if (confirm == true) {
                    await provider.deleteProperty(myProperties[index].id);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Listing deleted')),
                    );
                  }
                },
              ),
            ),
    );
  }
}
