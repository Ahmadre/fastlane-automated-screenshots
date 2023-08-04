import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Retailer Profile'),
      ),
      body: FutureBuilder(
          future: http.get(
            Uri.parse('https://dummyjson.com/users/1'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              );
            }
            if (snapshot.data == null) {
              return const Center(
                child: Text(
                  '--- No data ---',
                  style: TextStyle(fontSize: 24),
                ),
              );
            }
            final Map<String, dynamic> user =
                (json.decode(snapshot.data!.body) as Map<String, dynamic>);
            debugPrint('user: $user');
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage('${user['image']}'),
                  ),
                  Text(
                    'Name: ${user['firstName']}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 24),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
