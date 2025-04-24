import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/property.dart';
import '../providers/property_provider.dart';
import '../screens/property_detail_screen.dart';

class PropertyCard extends StatelessWidget {
  final Property property;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  const PropertyCard({Key? key, required this.property, this.onEdit, this.onDelete}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context, listen: false);
    final isFav = provider.isFavourite(property.id);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: property.imageUrl != null
            ? Image.network(property.imageUrl!, width: 60, height: 60, fit: BoxFit.cover)
            : const Icon(Icons.home, size: 40),
        title: Text(property.name),
        subtitle: Text('${property.address}\n${property.state}\n${property.description.length > 40 ? property.description.substring(0, 40) + '...' : property.description}'),
        trailing: onEdit != null && onDelete != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.blue),
                    onPressed: onEdit,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: onDelete,
                  ),
                ],
              )
            : IconButton(
                icon: Icon(isFav ? Icons.favorite : Icons.favorite_border, color: isFav ? Colors.red : null),
                onPressed: () {
                  provider.toggleFavourite(property.id);
                },
              ),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PropertyDetailScreen(property: property),
          ),
        ),
      ),
    );
  }
}
