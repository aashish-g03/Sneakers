// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:we_can_do_it/shop/view/shoe_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_swiper/card_swiper.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> tags = [
    "All",
    "Running",
    "Sneakers",
    "Formal",
    "Casual",
  ];
  int selectedIndex = 0;
  List images = [
    'images/Full_shoe_box.png',
    'images/NIKE.png',
    'images/shoe_box.png',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: Container(
            height: 34.h,
            width: 36.w,
            margin: EdgeInsets.only(left: 12.w, top: 10.h),
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
          title: Row(
            children: [
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
            SizedBox(height: 33.h),
            Container(
              height: 150.h,
              width: 334.w,
              child: Swiper(
                itemBuilder: (context, index) {
                  final image = images[index];
                  return Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        height: 150.h,
                        width: 334.w,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(width: 26.w),
                            Column(
                              children: [
                                SizedBox(height: 31.h),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '20% ',
                                        style: TextStyle(
                                            fontSize: 30.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      TextSpan(
                                        text: 'Discount',
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      TextSpan(
                                        text: '\non your first purchase',
                                        style: TextStyle(
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 22.h),
                              ],
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(239, 239, 239, 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(18.r),
                          ),
                        ),
                      ),
                      Image.asset(
                        'images/Green 1.png',
                        
                      )
                    ],
                  );
                },
                indicatorLayout: PageIndicatorLayout.COLOR,
                autoplay: true,
                duration: 500,
                autoplayDelay: 5000,
                itemCount: images.length,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        height: 36.h,
                        width: 72.w,
                        alignment: Alignment.center,
                        child: Text(
                          tags[index],
                          style: TextStyle(
                            color: selectedIndex == index
                                ? Colors.white
                                : Color.fromRGBO(156, 156, 156, 1),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(18.r),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: tags.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 100.h,
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
          ],
        ),
      ),
    );
  }
}
