import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProfileScreen'),
      ),
      body: Center(child: Container(child: Text('ProfileScreen', style: TextStyle(fontSize: 50, color: Colors.orange),))),
    );
  }
}
