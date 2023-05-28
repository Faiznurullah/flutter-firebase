import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crud/provider/users.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';
import 'provider/storage.dart';
import 'screen/upload.dart';
import 'screen/user_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: ((context) => users())),
          ChangeNotifierProvider(create: ((context) => Storage())),
        ],
        child: UploadScreen(),
      ),
    );
  }
}
