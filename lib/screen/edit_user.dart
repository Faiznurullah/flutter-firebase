import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/users.dart';

class EditScreen extends StatelessWidget {
  EditScreen({required this.idDoc, Key? key}) : super(key: key);

  String idDoc;
  @override
  Widget build(BuildContext context) {
    users user = Provider.of<users>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit User'),
      ),
      body: FutureBuilder<DocumentSnapshot<Object?>>(
          future: users().getUserById(idDoc),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final data = snapshot.data!.data() as Map<String, dynamic>;
              user.fristNameC.text = data['fristname'];
              user.lastNameC.text = data['lastname'];
              user.ageC.text = data['age'];
              return Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    TextField(
                      controller: user.fristNameC,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: user.lastNameC,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextField(
                      controller: user.ageC,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        user.UpdateUser(idDoc);
                        Navigator.pop(context);
                      },
                      child: Text('Edit User'),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
