import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class users with ChangeNotifier {
  final db = FirebaseFirestore.instance;

  TextEditingController fristNameC = TextEditingController();
  TextEditingController lastNameC = TextEditingController();
  TextEditingController ageC = TextEditingController();

  void addUser() {
    if (fristNameC.text.isNotEmpty &&
        lastNameC.text.isNotEmpty &&
        ageC.text.isNotEmpty) {
      CollectionReference users = this.db.collection("users");

      users.add({
        'fristname': this.fristNameC.text,
        'lastname': this.lastNameC.text,
        'age': this.ageC.text,
      });

      fristNameC.clear();
      lastNameC.clear();
      ageC.clear();
    }
  }

  Future<QuerySnapshot<Object?>> getUser() async {
    CollectionReference users = this.db.collection("users");
    return await users.get();
  }

  Stream<QuerySnapshot<Object?>> streamUser() {
    CollectionReference users = this.db.collection("users");
    return users.snapshots();
  }
}
