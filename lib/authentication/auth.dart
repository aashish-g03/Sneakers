import 'package:flutter/material.dart';

import 'screens/login.dart';
import 'screens/signup.dart';
import 'widgets/background_painter.dart';

class AuthenticationPage extends StatefulWidget {
  AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool isLogin = true;

  ValueNotifier<bool> showSignInPage = ValueNotifier<bool>(true);

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(
                animation: _controller,
              ),
            ),
          ),
          Center(
              child: AnimatedSwitcher(
            duration: Duration(milliseconds: 500),
            child: isLogin ? Login() : SignUp(),
          ))
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (() {
        if (isLogin) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
        setState(() {
          isLogin = !isLogin;
        });
      })),
    );
  }
}
