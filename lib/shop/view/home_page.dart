// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:we_can_do_it/shop/models/shoe_model.dart';
import 'package:we_can_do_it/shop/view/shoe_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:shimmer/shimmer.dart';

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
  List shoeList = [
    Shoe(
        imageUrl: 'images/Yellow Shoe.png',
        shoeName: 'Air Max 97',
        price: 20.99,
        colorsList: [Colors.black],
        sizeList: [6, 7, 8, 9],
        isFavourite: false,
        discountP: 10),
    Shoe(
        imageUrl: 'images/rb shoe.png',
        shoeName: 'React Presto',
        price: 20.99,
        colorsList: [Colors.black],
        sizeList: [6, 7, 8, 9],
        isFavourite: false,
        discountP: 10),
    Shoe(
        imageUrl: 'images/toppng.png',
        shoeName: 'Air Max 97',
        price: 20.99,
        colorsList: [Colors.black],
        sizeList: [6, 7, 8, 9],
        isFavourite: false,
        discountP: 10),
    Shoe(
        imageUrl: 'images/Shoe 1.png',
        shoeName: 'Air Max 200',
        price: 20.99,
        colorsList: [Colors.black],
        sizeList: [6, 7, 8, 9],
        isFavourite: false,
        discountP: 10),
  ];
  List images = [
    'images/Yellow Shoe.png',
    'images/rb shoe.png',
    'images/toppng.png',
    'images/Shoe 1.png',
  ];
  late Future<bool> isLoading;

  Future<bool> intialise() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  @override
  void initState() {
    super.initState();
    isLoading = intialise();
  }

  @override
  void dispose() {
    super.dispose();
  }

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
        body: SingleChildScrollView(
          child: Flex(
            mainAxisSize: MainAxisSize.min,
            direction: Axis.vertical,
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
              Container(
                height: 50.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (int index = 0; index < tags.length; index++)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              height: 36.h,
                              width: 75.w,
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
                                  Radius.circular(18.sp),
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Flexible(
                  fit: FlexFit.loose,
                  child: FutureBuilder(
                      future: isLoading,
                      initialData: null,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.connectionState == ConnectionState.none ||
                            snapshot.connectionState ==
                                ConnectionState.waiting) {
                          return Shimmer.fromColors(
                            baseColor: Colors.grey[400]!,
                            highlightColor: Colors.grey[300]!,
                            child: GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: images.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 16.w,
                                      mainAxisSpacing: 26.h),
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  height: 200,
                                  width: 200,
                                  color: Colors.grey,
                                );
                              },
                            ),
                          );
                        } else if (snapshot.hasData) {
                          return GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: images.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 200.h,
                              crossAxisCount: 2,
                              crossAxisSpacing: 16.w,
                              mainAxisSpacing: 26.h,
                            ),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ShoeDetails(shoeList[index])),
                                  );
                                },
                                child: Container(
                                  width: 160.w,
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(239, 239, 239, 1),
                                    borderRadius: BorderRadius.circular(18.sp),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                          (shoeList[index] as Shoe).imageUrl),
                                      Text((shoeList[index] as Shoe).shoeName),
                                      Text(
                                          '\$ ${(shoeList[index] as Shoe).price}')
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        } else
                          return Scaffold();
                      }),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: 100.h,
                child: ElevatedButton(
                  child: const Text('Second Page'),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
