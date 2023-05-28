import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:io';

class Storage with ChangeNotifier {
  void UploadFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      try {
        await FirebaseStorage.instance
            .ref(result.files.single.name)
            .putFile(file);
      } on firebase_storage.FirebaseException catch (e) {
        print('error');
      }
    } else {
      print('Error');
    }
  }
}
