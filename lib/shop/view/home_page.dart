import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:we_can_do_it/shop/view/shoe_detail.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            children: [
              Container(
                height: 34.h,
                width: 36.w,
                margin: EdgeInsets.only(left: 12.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.h),
                    ),
                    border: Border.all(color: Colors.black)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.menu,
                    size: 20.w,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.w),
                child: Icon(
                  Icons.nine_k,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 22.w),
              child: Icon(
                Icons.shopping_basket_outlined,
                color: Colors.red,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            Center(
              child: Container(
                height: 20.h,
                child: ElevatedButton(
                  child: const Text('Second Page'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ShoeDetails()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
