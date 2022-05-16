import 'package:flutter/material.dart';

class ShoeDetails extends StatefulWidget {
  ShoeDetails({Key? key}) : super(key: key);

  @override
  State<ShoeDetails> createState() => _ShoeDetailsState();
}

class _ShoeDetailsState extends State<ShoeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Yahan Kaam krna h aaj'),
      ),
    );
  }
}
