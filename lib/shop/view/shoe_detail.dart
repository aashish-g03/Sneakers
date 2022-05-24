import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoeDetails extends StatefulWidget {
  ShoeDetails({Key? key}) : super(key: key);

  @override
  State<ShoeDetails> createState() => _ShoeDetailsState();
}

class _ShoeDetailsState extends State<ShoeDetails> {
  bool favourite = false;
  final sizeList = [39, 40, 41, 42, 43];
  final colorList = [Colors.orange, Colors.blue, Colors.red, Colors.black];
  int selectedIndex = 0;
  int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Center(
              child: Text(
                'Air Max 299 SE',
                // textAlign:TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.sp,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 14.w, top: 15),
            child: Container(
              height: 34.h,
              width: 36.w,
              decoration: BoxDecoration(
                  border: Border.all(width: .25),
                  borderRadius: BorderRadius.circular(8.r)),
              child: Center(
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back_rounded,
                    size: 20.r,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(
                    favourite ? Icons.favorite_border : Icons.favorite_rounded,
                    color: favourite ? Colors.black : Colors.pink,
                  ),
                  onPressed: () {
                    setState(() {
                      favourite = !favourite;
                    });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30.h,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 300.h,
                    width: 140.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/NIKE.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 3.0),
                              child: Text(
                                'Size\n',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.sp),
                              ),
                            ),
                            for (int index = 0;
                                index < sizeList.length;
                                index++)
                              Column(
                                children: [
                                  Container(
                                    height: 30.h,
                                    width: 50.w,
                                    child: GestureDetector(
                                      child: Center(
                                          child: Text(
                                        '${sizeList[index]}',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                        ),
                                      )),
                                      onTap: () {
                                        setState(() {
                                          selectedIndex = index;
                                        });
                                      },
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(width: .55),
                                      borderRadius: BorderRadius.circular(10),
                                      color: selectedIndex == index
                                          ? colorList[selectedColor]
                                          : Colors.white,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                ],
                              ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Colour\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14.sp),
                            ),
                            for (int index = 0;
                                index < colorList.length;
                                index++)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedColor = index;
                                  });
                                },
                                child: Container(
                                  height: selectedColor == index ? 40.r : 35.r,
                                  width: selectedColor == index ? 40.r : 35.r,
                                  margin: EdgeInsets.only(bottom: 10.h),
                                  child: Center(
                                      child: selectedColor == index
                                          ? const Icon(
                                              Icons.check,
                                              color: Colors.white,
                                            )
                                          : null),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: colorList[index],
                                  ),
                                ),
                              )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 300.h,
                    width: 300.w,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/Red_Shoe.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 21.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        Text(
                          '\$ 30.99',
                          style: TextStyle(
                            fontSize: 24.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '10% OFF',
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.red,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Swipe down to add',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 60.h),
                        child: Container(
                          height: 185,
                          width: 247.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('images/shoe_box.png'),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 42.w,
                        height: 92.h,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.r),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Icon(
                                Icons.shopping_basket_rounded,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class Add_To_Cart extends StatefulWidget {
  const Add_To_Cart({Key? key}) : super(key: key);

  @override
  State<Add_To_Cart> createState() => _Add_To_CartState();
}

class _Add_To_CartState extends State<Add_To_Cart> {
  double x = 1;
  bool added = false;
  void movebox() {
    setState(() {
      added = !added;
      x = x * -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: movebox,
      child: AnimatedContainer(
        height: 60,
        width: 100,
        color: added ? Colors.red[50] : Colors.black,
        alignment: Alignment(0, x),
        duration: Duration(seconds: 2),
        child: Container(
          height: 10,
          width: 10,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
