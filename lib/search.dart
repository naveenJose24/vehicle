import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CloudFirestoreSearch extends StatefulWidget {
  @override
  _CloudFirestoreSearchState createState() => _CloudFirestoreSearchState();
}

class _CloudFirestoreSearchState extends State<CloudFirestoreSearch> {
  String registerno = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back_ios),
        //   onPressed: () {
        //     Navigator.of(context).pop();
        //   },
        // ),
        title: Card(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Enter  Register No KL57A4290'),
            onChanged: (val) {
              setState(() {
                registerno = val;
              });
            },
          ),
        ),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: (registerno != "" && registerno != null)
            ? Firestore.instance
                .collection('items')
                .where("searchKeywords", arrayContains: registerno)
                .snapshots()
            : Firestore.instance.collection("items").snapshots(),
        builder: (context, snapshot) {
          return (snapshot.connectionState == ConnectionState.waiting)
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: snapshot.data.documents.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot data = snapshot.data.documents[index];
                    return Card(
                        margin: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                data['name'],
                                style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.grey[600],
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Text(
                                data['registerno'],
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey[800],
                                ),
                              ),
                              SizedBox(height: 6.0),
                              Row(
                                children: [
                                  Text('City:'),
                                  Text(
                                    data['city'],
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('State:'),
                                  Text(
                                    data['state'],
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('chassis no:'),
                                  Text(
                                    data['chassisno'],
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Color:'),
                                  Text(
                                    data['color'],
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text('Variant:'),
                                  Text(
                                    data['variant'],
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ));
                    // return Card(
                    //   child: Row(
                    //     children: <Widget>[
                    //       Image.network(
                    //         data['imageUrl'],
                    //         width: 150,
                    //         height: 100,
                    //         fit: BoxFit.fill,
                    //       ),
                    //       SizedBox(
                    //         width: 25,
                    //       ),
                    //       Text(
                    //         data['name'],
                    //         style: TextStyle(
                    //           fontWeight: FontWeight.w700,
                    //           fontSize: 20,
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // );
                  },
                );
        },
      ),
    );
  }
}
