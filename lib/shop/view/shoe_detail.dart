import 'package:flutter/material.dart';

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
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 30),
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(right: 30),
              child: IconButton(
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
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Text('Air Jordan 1'),
              Text('Nike Sneakers'),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      children: [
                        Text('Size\n'),
                        for (int index = 0; index < sizeList.length; index++)
                          Container(
                            height: 40,
                            width: 40,
                            child: GestureDetector(
                              child: Center(child: Text('${sizeList[index]}')),
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: selectedIndex == index
                                  ? Colors.orange
                                  : Colors.white,
                            ),
                          )
                      ],
                    ),
                  ),
                  const Expanded(child: SizedBox()),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Color\n'),
                        for (int index = 0; index < colorList.length; index++)
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedColor = index;
                              });
                            },
                            child: Container(
                              height: selectedColor == index ? 50 : 40,
                              width: selectedColor == index ? 50 : 40,
                              margin: EdgeInsets.only(bottom: 10),
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
              SizedBox(height: 140),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 80,
                    width: 140,
                    color: Colors.redAccent,
                  ),
                  SizedBox(width: 40),
                  Container(
                    height: 80,
                    width: 140,
                    color: Colors.redAccent,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      height: 80,
                      width: 140,
                      child: Center(child: Text('\$180'))),
                  SizedBox(width: 40),
                  Container(
                    height: 60,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.00),
                        color: Colors.blue[50]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Add_To_Cart(),
                        Expanded(
                          child: const Center(
                            child: Text(' Tap to  Cart'),
                          ),
                        ),
                      ],
                    ),
                  )
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
  double x = 0;
  bool added = false;
  void movebox() {
    setState(() {
      added = !added;
      x = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: movebox,
      child: AnimatedContainer(
        height: 80,
        width: 140,
        alignment: Alignment(x, 0.0),
        duration: Duration(seconds: 2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: added ? Colors.red[50] : Colors.black,
        ),
      ),
    );
  }
}
