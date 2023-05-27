import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_crud/provider/users.dart';
import 'package:firebase_crud/screen/add_user.dart';
import 'package:firebase_crud/screen/edit_user.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    users user = Provider.of<users>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                      create: (context) => users(), child: AddScreen())));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text('Crud Anjing'),
      ),
      // body: FutureBuilder<QuerySnapshot<Object?>>(
      //   future: user.getUser(),
      //   builder: (context, snapshot) {
      //     if(snapshot.connectionState == ConnectionState.done){
      //     var data = snapshot.data!.docs;
      //        return ListView.builder(
      //       itemCount: data.length,
      //       itemBuilder: (context, index){
      //       final user = data[index].data() as Map<String, dynamic>;
      //       return ListTile(
      //         title: Text(user['fristname']),
      //         subtitle: Text(user['age']),
      //       );
      //     });
      //     }
      //     return Center(
      //       child: CircularProgressIndicator(),
      //     );
      //   },
      // ),

      // get Stream
      body: StreamBuilder<QuerySnapshot>(
        stream: user.streamUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            var data = snapshot.data!.docs;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                final userData = data[index].data() as Map<String, dynamic>;
                return ListTile(
                  title: Text(userData['fristname']),
                  subtitle: Text(userData['age']),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChangeNotifierProvider(
                                create: (context) => users(),
                                child: EditScreen(idDoc: data[index].id))));
                  },
                  trailing: IconButton(
                    onPressed: () {
                      user.DeleteUser(data[index].id);
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
