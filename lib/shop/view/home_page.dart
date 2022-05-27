// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:we_can_do_it/shop/view/shoe_detail.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:video_player/video_player.dart';

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
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

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
            Container(
              width: 300.w,
              decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(20)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: Stack(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          if (_controller.value.isPlaying) {
                            _controller.pause();
                          } else {
                            _controller.play();
                          }
                        });
                      },
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10.r),
                            child: FutureBuilder(
                              future: _initializeVideoPlayerFuture,
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  return AspectRatio(
                                    aspectRatio: _controller.value.aspectRatio,
                                    child: VideoPlayer(_controller),
                                  );
                                } else {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                              },
                            ),
                          ),
                          (_controller.value.isPlaying)
                              ? SizedBox()
                              : Center(
                                  child: Icon(
                                  Icons.play_circle_outline_rounded,
                                  size: 70.r,
                                  color: Colors.white54,
                                )),
                        ],
                      ),
                    ),
                    Container(
                      height: 48.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.black54, Colors.transparent],
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 5),
                            child: CircleAvatar(
                              radius: 20,
                              foregroundImage: AssetImage('images/NIKE.png'),
                              backgroundColor:
                                  Theme.of(context).textTheme.headline1!.color,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 11, left: 7),
                                child: Text(
                                  'aashish',
                                  overflow: TextOverflow.ellipsis,

                                  //style:Theme.of(context).textTheme.subtitle1
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12.sp),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 1, left: 6),
                                child: Text(
                                  'aashish',
                                  overflow: TextOverflow.ellipsis,
                                  // style:Theme.of(context).textTheme.subtitle2
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 11.sp),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: 28.h,
                          padding: EdgeInsets.only(bottom: 5.h),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [Colors.black54, Colors.transparent],
                              ),
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10.r),
                                bottomRight: Radius.circular(10.r),
                              )),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: GestureDetector(
                                  child: Icon(
                                      liked
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: liked ? Colors.red : Colors.black),
                                  onTap: () {},
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.h, left: 3.w),
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.sp),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.h, left: 35.w),
                                child: GestureDetector(
                                  child: Icon(Icons.insert_comment_outlined,
                                      color: Colors.red[100]),
                                  onTap: () {},
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 10.h, left: 3.w),
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }
}
