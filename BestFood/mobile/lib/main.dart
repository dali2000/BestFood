import 'package:flutter/material.dart';
import 'package:mobile/home_page.dart';
import 'package:mobile/login_page.dart';
import 'package:mobile/register_page.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginPage()
    ) ;
  }
}

