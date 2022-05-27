import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ShoeWidget extends StatefulWidget {
  final buttonPressed;
  ShoeWidget({this.buttonPressed});
  @override
  _ShoeWidgetState createState() => _ShoeWidgetState();
}

class _ShoeWidgetState extends State<ShoeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> slideAnimation;
  late Animation<double> sizeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    startAnimation();
  }

  void startAnimation() {
    final curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.ease);

    sizeAnimation =
        Tween<double>(begin: 300, end: 100).animate(curvedAnimation);
    slideAnimation = Tween<double>(begin: 0, end: 0.4).animate(curvedAnimation)
      ..addStatusListener(listenAnimation);

    controller.reset();

    controller.forward();
  }

  void listenAnimation(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.removeStatusListener(listenAnimation);
      widget.buttonPressed();
    }
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Center(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            final height = MediaQuery.of(context).size.height;
            final y = slideAnimation.value * height;
            return Transform(
              transform: Matrix4.translationValues(0, y, 0),
              child: Container(
                width: sizeAnimation.value.w,
                height: sizeAnimation.value.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/Red_Shoe.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
      );
}
