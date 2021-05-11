import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          elevation: 5.0,
          title: Text('FIRST AUTH'),
          centerTitle: true,
          backgroundColor: Colors.orange,
        ),
        body: Center(
          child: Text(
            'BIENVENUE SUR LA PAGE ',
            style: TextStyle(
                fontSize: 25,
                backgroundColor: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
