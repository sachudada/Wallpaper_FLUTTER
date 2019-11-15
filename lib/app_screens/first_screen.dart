import 'package:flutter/material.dart';


class Firstscreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "2nd Page",
        home:
        Scaffold(
          appBar: AppBar(title: Text("Sachin Kumar's App"),),
          body: Material(
            color: Colors.white,
            child: Center(child:
            Text("This is a 2nd Screen",
              textDirection: TextDirection.ltr,
              style: TextStyle(color: Colors.black),
            )
            ),
          ),
        )
    );
  }
}


