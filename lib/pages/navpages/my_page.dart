import 'package:flutter/material.dart';

class MyPage extends StatelessWidget {
  MyPage({Key? key}) : super(key: key);

  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerBio = TextEditingController();
  final TextEditingController _controllerPlace = TextEditingController();

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
                backgroundImage: AssetImage('lib/img/download.png'),
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
              SizedBox(height: 25),
              TextFormField(
                controller: _controllerPlace,
                decoration: InputDecoration(
                  labelText: "Places",
                  border: OutlineInputBorder(),
                  hintText: 'The places you like to visit...',
                ),
              ),
              SizedBox(height: 25),
              TextFormField(
                controller: _controllerBio,
                maxLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Tell us about yourself',
                ),
              ),
              SizedBox(height: 40),
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
