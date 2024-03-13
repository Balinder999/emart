import 'package:emart_app/view/Splash_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'consts/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyBaJLxVnwqhbxU4rxowsUrToZwSelS49EE",
      //authDomain: 'your_auth_domain',
      projectId: "bkmart-74723",
      appId: "1:551367544582:android:91866069ee28f3f964d887",
      messagingSenderId: "551367544582",
      storageBucket: "gs://bkmart-74723.appspot.com",
      // Add other options as needed
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: darkFontGrey,
          ),
        ),
        fontFamily: regular,
      ),
      home: const Splash_Screen(),
    );
  }
}
