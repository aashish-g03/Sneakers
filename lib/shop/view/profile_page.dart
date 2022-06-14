import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class Profile_Page extends StatefulWidget {
  const Profile_Page({Key? key}) : super(key: key);

  @override
  State<Profile_Page> createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page> {
  @override
  File? image;
  Future pickImage({required ImageSource source}) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      setState(() => this.image = imageTemporary);
    } catch (e) {}
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 221, 238, 248),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: Container(
          height: 44.h,
          width: 50.w,
          margin: EdgeInsets.only(left: 12.w, top: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(8.h),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_back_rounded,
              size: 25.w,
              color: Color.fromARGB(255, 250, 120, 111),
            ),
          ),
        ),
      ),
      body: ListView(children: [
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 20,
          ),
          Container(
            width: 150.w,
            margin: EdgeInsets.only(left: 12.w, top: 10.h),
            child: Text(
              'My Profile',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 50.0),
                child: GestureDetector(
                  onTap: () {
                    pickImage(source: ImageSource.camera);
                  },
                  child: Container(
                    height: 45.h,
                    width: 45.w,
                    child: Icon(Icons.add_a_photo_outlined),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(45),
                      border: Border.all(
                        color: Color.fromARGB(255, 78, 77, 77),
                        width: .5,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30),
                child: Container(
                  height: 100.h,
                  width: 100.w,
                  margin: new EdgeInsets.symmetric(horizontal: 10.0),
                  child: image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: Image.file(
                            image!,
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                        ) // Image.file
                      : Icon(Icons.face_retouching_natural_outlined),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    border: Border.all(
                      color: Color.fromARGB(255, 29, 1, 247),
                      width: 3,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: GestureDetector(
                  onTap: () {
                    pickImage(source: ImageSource.gallery);
                  },
                  child: Container(
                    height: 40.h,
                    width: 40.w,
                    child: Icon(Icons.add_circle_outline),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(
                        color: Color.fromARGB(255, 78, 77, 77),
                        width: .5,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Text(
            'MY NAME',
            style: TextStyle(fontWeight: FontWeight.w400, fontSize: 30),
          )),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Container(
              height: 50.h,
              margin: new EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 174, 215, 248)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.account_box),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'My Account',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Container(
              height: 50.h,
              margin: new EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 174, 215, 248)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.notification_add),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Notifications',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30),
            child: Container(
              height: 50.h,
              margin: new EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 174, 215, 248)),
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Icon(Icons.help_center),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Help center',
                      style:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ]),
    );
  }
}
