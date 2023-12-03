import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerBio = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage('assets/demo_avatar.jpg'),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _controllerName,
                decoration: InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Name',
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _controllerName,
                decoration: InputDecoration(
                  labelText: "Places",
                  border: OutlineInputBorder(),
                  hintText: 'The places you like to visit...',
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _controllerBio,
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: "Bio",
                  border: OutlineInputBorder(),
                  hintText: 'Tell us about yourself',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle save action here
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Details Saved'),
                        content: const Text('Your details have been saved.'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
