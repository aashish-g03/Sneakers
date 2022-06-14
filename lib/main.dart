import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_can_do_it/authentication/auth.dart';
import 'package:we_can_do_it/shop/view/home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:we_can_do_it/shop/view/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, widget) => MaterialApp(
        title: 'Sneakers',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Profile_Page(),
      ),
    );
  }
}
