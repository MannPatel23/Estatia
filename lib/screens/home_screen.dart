import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/property_provider.dart';
import '../widgets/property_card.dart';
import '../utils/indian_states.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PropertyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Properties'),
        actions: [
          DropdownButton<String>(
            value: provider.selectedState,
            hint: const Text('Filter by State'),
            items: indianStates.map((state) => DropdownMenuItem(
              value: state,
              child: Text(state),
            )).toList(),
            onChanged: (state) => provider.filterByState(state),
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => Navigator.pushNamed(context, '/list'),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: Colors.deepPurple.shade50,
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: const Center(
              child: Text(
                'ESTATIA - Real Estate Company',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: provider.filteredProperties.isEmpty
                ? const Center(child: Text('No properties found.'))
                : ListView.builder(
                    itemCount: provider.filteredProperties.length,
                    itemBuilder: (context, index) => PropertyCard(
                      property: provider.filteredProperties[index],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
