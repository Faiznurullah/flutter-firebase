import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/users.dart';

class AddScreen extends StatelessWidget {
 const AddScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
     users user = Provider.of<users>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tambah User'),
      ),
      body: Padding(
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
              onPressed: (){
                user.addUser();
              }, 
              child: Text('Tambah User'),
              )
          ],
        ),
      ),
    );
  }
}