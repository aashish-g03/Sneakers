import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      key: const ValueKey("emailfield"),
      style: TextStyle(color: Colors.black, fontSize: 12.sp),
      validator: (value) {
        if (value!.isEmpty ||
            !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(value)) {
          return 'This field is required';
        }
        return null;
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: emailController,
      obscureText: false,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(223, 221, 221, 1), width: 1.0),
        ),
        prefixIcon: const Icon(
          Icons.mail,
          color: Color.fromARGB(255, 169, 169, 169),
        ),
        labelText: 'Email',
        labelStyle: TextStyle(
          fontSize: 10.sp,
          color: const Color.fromARGB(255, 169, 169, 169),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        contentPadding: const EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
      ),
    );
    final passwordField = TextFormField(
      key: const ValueKey("passwordfield"),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(color: Colors.black, fontSize: 12.sp),
      validator: (value) {
        if (value!.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
      cursorColor: Colors.black,
      controller: passwordController,
      obscureText: true,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide:
              BorderSide(color: Color.fromRGBO(223, 221, 221, 1), width: 1.0),
        ),

        labelText: 'Password',
        prefixIcon: const Icon(
          Icons.lock,
          color: Color.fromARGB(255, 169, 169, 169),
        ),
        labelStyle: TextStyle(
          fontSize: 10.sp,
          color: const Color.fromARGB(255, 169, 169, 169),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.0),
        ),
        contentPadding: const EdgeInsets.fromLTRB(10.0, 15.0, 20.0, 15.0),
        // hintText: "Password", hintStyle: TextStyle(color: Colors.white),
        // border:
        //     OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
      ),
    );
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(children: [
        SizedBox(height: 200.h),
        emailField,
        passwordField,
      ]),
    );
  }
}
