import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.amber[100],
        appBar: AppBar(
          title: Text("My First App"),
          backgroundColor: Colors.amber[800],
        ),
        body:Center(
          child: Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26 ,
                  blurRadius: 10,
                  offset: Offset(5, 5)
                )
              ],
                image:DecorationImage(
                image: AssetImage('images/hridaan.jpeg'),
                fit: BoxFit.cover,
               ),
            ),
          ),
        )
      ),
    ),
  );
}
