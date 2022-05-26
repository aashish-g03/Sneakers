// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:we_can_do_it/shop/view/shoe_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  bool liked = false;
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                width: 300.w,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () async {
                          // await getuserdocDetails(
                          //     widget.post.post.userId);
                        },
                        child: Row(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(left: 5, top: 5),
                                child: CircleAvatar(
                                  radius: 20,
                                  child: Image.network(
                                    'https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                                  ),
                                )
                                // CachedNetworkImage(
                                //   imageUrl: widget.post.profilePicPath,
                                //   imageBuilder: (context, imageProvider) =>
                                //       CircleAvatar(
                                //           radius: 20,
                                //           backgroundColor:
                                //               Theme.of(context).backgroundColor,
                                //           foregroundImage: imageProvider),
                                //   placeholder: (context, url) => CircleAvatar(
                                //     radius: 20,
                                //     backgroundColor:
                                //         Theme.of(context).backgroundColor,
                                //   ),
                                //   errorWidget: (context, url, error) =>
                                //       CircleAvatar(
                                //     radius: 20,
                                //     foregroundImage:
                                //         AssetImage('assets/profileimg.png'),
                                //     backgroundColor: Theme.of(context)
                                //         .textTheme
                                //         .headline1
                                //         .color,
                                //   ),
                                // ),
                                // CircleAvatar(
                                //   foregroundImage:
                                //       //NetworkImage(widget.post.profilePicPath),
                                //       (widget.post.profilePicPath == null)
                                //           ? AssetImage('assets/profileimg.png')
                                //           : NetworkImage(
                                //               widget.post.profilePicPath),
                                //   backgroundColor: Colors.grey,
                                //   radius: 20,
                                // ),
                                ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Text('aashish',
                                      // widget.post.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.w),
                                  child: Text('Aashish',
                                      // "@${widget.post.userName}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle2),
                                ),
                              ],
                            ),
                            Spacer(),
                            // Provider.of<UserProfileProvider>(context,
                            //                 listen: false)
                            //             .id ==
                            //         widget.post.post.userId
                            liked
                                ? PopupMenuButton<String>(
                                    onSelected: (value) {},
                                    itemBuilder: (BuildContext context) {
                                      return {'Edit', 'Delete'}
                                          .map((String choice) {
                                        return PopupMenuItem<String>(
                                          value: choice,
                                          child: Text(choice),
                                          onTap: () {
                                            if (choice == 'Edit') {
                                              // pushNewScreen(context,
                                              //     screen: editImgPost(
                                              //       post: widget.post,
                                              //     ),
                                              //     withNavBar: false,
                                              //     pageTransitionAnimation:
                                              //         PageTransitionAnimation
                                              //             .cupertino);
                                            } else if (choice == 'Delete') {
                                              // deletePost(
                                              //     widget.post.post.id,
                                              //     Provider.of<UserProfileProvider>(
                                              //             context,
                                              //             listen: false)
                                              //         .id);
                                            }
                                          },
                                        );
                                      }).toList();
                                    },
                                  )
                                : PopupMenuButton<String>(
                                    onSelected: (value) {},
                                    itemBuilder: (BuildContext context) {
                                      return {'Report'}.map((String choice) {
                                        return PopupMenuItem<String>(
                                          value: choice,
                                          child: Text(choice),
                                          onTap: () {
                                            var reason =
                                                TextEditingController();
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertDialog(
                                                      title: Text(
                                                          'Report this post'),
                                                      content: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                              "Help us understand what is wrong with this post"),
                                                          TextFormField(
                                                            controller: reason,
                                                            validator: (value) {
                                                              if (value!
                                                                      .isEmpty ||
                                                                  value ==
                                                                      null) {
                                                                return "Please state your reasons";
                                                              }
                                                              return null;
                                                            },
                                                          )
                                                        ],
                                                      ),
                                                      actions: [
                                                        TextButton(
                                                            onPressed:
                                                                () async {
                                                              // Navigator.of(
                                                              //         context)
                                                              //     .pop();
                                                              // await report(
                                                              //     Provider.of<UserProfileProvider>(
                                                              //             context,
                                                              //             listen:
                                                              //                 false)
                                                              //         .id,
                                                              //     widget.post
                                                              //         .post.id,
                                                              //     reason.text);
                                                            },
                                                            child: Text(
                                                              'Report',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .bodyText2,
                                                            )),
                                                        TextButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            child: Text(
                                                                'Cancel',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .bodyText2))
                                                      ],
                                                    ));
                                          },
                                        );
                                      }).toList();
                                    },
                                  ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 20),
                      child: Text(
                        'How many times do you think is it okay to exercise in a day?',
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(fontSize: 16.sp),
                      ),
                      // ReadMoreText(
                      //   widget.post.post.postText,
                      //   trimLength: 60,
                      //   trimMode: TrimMode.Length,
                      //   trimCollapsedText: 'More',
                      //   trimExpandedText: 'Less',
                      //   style: Theme.of(context)
                      //       .textTheme
                      //       .caption
                      //       .copyWith(fontSize: 16.sp),
                      //   lessStyle: TextStyle(
                      //       fontSize: 16.sp,
                      //       color: customPink,
                      //       fontWeight: FontWeight.bold),
                      //   moreStyle: TextStyle(
                      //       fontSize: 16.sp,
                      //       color: customPink,
                      //       fontWeight: FontWeight.bold),
                      // ),
                    ),
                    Container(),
                    Center(
                      child: Container(
                          //  width: 300.w,
                          //  height: 500.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text('What is your opinion')),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 8.0,
                            left: 12.0,
                          ),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      child: Icon(
                                          liked
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color:
                                              liked ? Colors.red : Colors.grey),
                                      onTap: () {
                                        liked = !liked;
                                      },
                                    ),
                                  ),
                                  Text(
                                    '1',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 18.sp),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 16),
                          child: GestureDetector(
                            child: Icon(Icons.comment, color: Colors.red[100]),
                            onTap: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 14),
                          child: Text(
                            '0',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 18.sp),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 20),
                      child: Wrap(
                        children: [],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
