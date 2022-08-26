import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_can_do_it/shop/view/home_page.dart';

class SignUp extends StatefulWidget {
  final goToLogin;
  SignUp(this.goToLogin);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final emailField = Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            TextFormField(
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
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
              ),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 239, 238, 238),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).cardColor, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  borderSide: BorderSide(
                      color: Theme.of(context).cardColor, width: 1.0),
                ),
                labelText: 'Enter your email',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(
                  fontSize: 10.sp,
                  color: Theme.of(context).hintColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).cardColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
              ),
            ),
            Positioned(
              top: -16.h,
              left: 5.w,
              child: Container(
                height: 26.h,
                width: 96.w,
                child: Center(
                  child: Text(
                    'Email Id',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Color.fromRGBO(255, 228, 228, 1)),
              ),
            )
          ],
        ),
      ),
    );
    final passwordField = Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return 'This field is required';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
              ),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 239, 238, 238),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).cardColor, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  borderSide: BorderSide(
                      color: Theme.of(context).cardColor, width: 1.0),
                ),
                labelText: 'Enter your password',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(
                  fontSize: 10.sp,
                  color: Theme.of(context).hintColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).cardColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
              ),
            ),
            Positioned(
              top: -16.h,
              left: 5.w,
              child: Container(
                height: 26.h,
                width: 96.w,
                child: Center(
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Color.fromRGBO(255, 228, 228, 1)),
              ),
            )
          ],
        ),
      ),
    );
    final confirmPasswordField = Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty || value != passwordController.text) {
                  return 'Input is Incoreect';
                }
                return null;
              },
              autovalidateMode: AutovalidateMode.always,
              controller: confirmPasswordController,
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(
                color: Colors.black,
                fontSize: 12.sp,
              ),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 239, 238, 238),
                enabledBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).cardColor, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  borderSide: BorderSide(
                      color: Theme.of(context).cardColor, width: 1.0),
                ),
                labelText: 'Confirm your password',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                labelStyle: TextStyle(
                  fontSize: 10.sp,
                  color: Theme.of(context).hintColor,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Theme.of(context).cardColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(8.r)),
                ),
              ),
            ),
            Positioned(
              top: -16.h,
              left: 5.w,
              child: Container(
                height: 26.h,
                width: 140.w,
                child: Center(
                  child: Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.r),
                    color: Color.fromRGBO(255, 228, 228, 1)),
              ),
            )
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          SizedBox(height: 200),
          Padding(
            padding: EdgeInsets.all(10),
            child: Text(
              'Register',
              style: TextStyle(
                fontSize: 18.sp,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          emailField,
          SizedBox(height: 20.h),
          passwordField,
          SizedBox(height: 20.h),
          confirmPasswordField,
          SizedBox(height: 30.h),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Container(
              height: 50.h,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: Colors.black,
              ),
              child: Center(
                child: Text(
                  'Register',
                  style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 35.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Row(
              children: [
                Expanded(child: Container(color: Colors.grey, height: 0.5.h)),
                Text(
                  '   Or SignUp with   ',
                  style: TextStyle(fontSize: 14.sp),
                ),
                Expanded(child: Container(color: Colors.grey, height: 0.5.h)),
              ],
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 73.w,
                height: 41.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.r),
                    ),
                    border: Border.all(width: 0.5, color: Colors.grey)),
                child: Padding(
                  padding: EdgeInsets.all(11.h),
                  child: Image(
                    image: AssetImage('images/googleicon.png'),
                  ),
                ),
              ),
              SizedBox(width: 25.w),
              Container(
                width: 73.w,
                height: 41.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.r),
                    ),
                    border: Border.all(width: 0.5, color: Colors.grey)),
                child: Padding(
                  padding: EdgeInsets.all(11.h),
                  child: Image(
                    color: Colors.black,
                    image: AssetImage('images/apple-logo.png'),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 50.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                ),
              ),
              GestureDetector(
                child: Text(
                  " Login",
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 16.sp,
                  ),
                ),
                onTap: () {
                  widget.goToLogin();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
