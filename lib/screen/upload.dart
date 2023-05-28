import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import '../provider/storage.dart';

class UploadScreen extends StatelessWidget {
  const UploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Storage storage = Provider.of<Storage>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image'),
      ),
      body: Center(
        child: OutlinedButton(
          child: Text('upload'),
          onPressed: () {
            storage.UploadFile();
          },
        ),
      ),
    );
  }
}
