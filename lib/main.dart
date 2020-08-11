import 'package:flutter/material.dart';
import 'package:vehicle/search.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Register Book",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: CloudFirestoreSearch(),
        // child: RaisedButton(
        //   child: Text("Click to search"),
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute(builder: (_) {
        //       return CloudFirestoreSearch();
        //     }));
        //   },
        // ),
      ),
    );
  }
}
