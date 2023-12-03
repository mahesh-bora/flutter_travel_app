import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  TextEditingController _searchController = TextEditingController();
  List<String> _suggestions = [
    'Paris',
    'New York',
    'Tokyo',
    'London',
    'Sydney',
    'Rome',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Serch here...",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: TextFormField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Search",
                    hintText: 'Search for a destination...',
                    suffixIcon: Icon(Icons.search),
                  ),
                  onChanged: (value) {
                    // Implement your search logic here
                    // You can filter suggestions based on the entered value
                  },
                ),
              ),
              SizedBox(height: 15),
              Text(
                'Suggestions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: _suggestions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_suggestions[index]),
                      onTap: () {
                        // Handle the suggestion tile tap
                        _searchController.text = _suggestions[index];
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
