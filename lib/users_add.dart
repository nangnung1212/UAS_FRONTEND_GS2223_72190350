import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class users_add extends StatefulWidget {
  const users_add({Key? key}) : super(key: key);

  @override
  State<users_add> createState() => _users_addState();
}

class _users_addState extends State<users_add> {
  final _formKey = GlobalKey<FormState>();

  Future<List>? resp;

  TextEditingController postIdController = new TextEditingController(text: '1');
  TextEditingController idController = new TextEditingController(text: '1');
  TextEditingController nameController = new TextEditingController(text: 'id labore ex et quam laborum');
  TextEditingController emailcontroller = new TextEditingController(text: 'Eliseo@gardner.biz');
  TextEditingController bodyController = new TextEditingController(text: 'laudantium enim quasi est quidem magnam voluptate ipsam eos\ntempora quo necessitatibus\ndolor quam autem quasi\nreiciendis et nam sapiente accusantium');

  Future<List> sendMhs(String postId,id,name,email,body) async {
    final http.Response response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'postId': postId,
        'id': id,
        'name': name,
        'email' :email,
        'body': body
      }),
    );
    if (response.statusCode == 201) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load response');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert COMMENTS"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Add TextFormFields and ElevatedButton here.
            TextFormField(
              controller: postIdController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: idController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: nameController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: emailcontroller,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            TextFormField(
              controller: bodyController,
              // The validator receives the text that the user has entered.
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false otherwise.
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar. In the real world,
                  // you'd often call a server or save the information in a database.
                  resp = sendMhs as Future<List>?;
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
