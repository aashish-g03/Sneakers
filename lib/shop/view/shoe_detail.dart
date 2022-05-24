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
          title: const Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Center(
              child: Text(
                '    Air Max 299 SE',
                // textAlign:TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
            child: Container(
              height: 12,
              decoration: BoxDecoration(
                  border: Border.all(width: .25),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      size: 20,
                      color: Colors.black,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
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
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 3.0),
                          child: Text(
                            'Size\n',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        for (int index = 0; index < sizeList.length; index++)
                          Column(
                            children: [
                              Container(
                                height: 35,
                                width: 45,
                                child: GestureDetector(
                                  child:
                                      Center(child: Text('${sizeList[index]}')),
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
                              const SizedBox(
                                height: 4,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      height: 350,
                      width: 230,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('images/Red_Shoe.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Colour\n',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
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
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      children: const [
                        Text(
                          '\$ 30.99',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '10\%off',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 0,
              ),
              Column(
                children: [
                  const Text(
                    'swipe down to add',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      width: 42,
                      height: 92,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
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
                      )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 185,
                    width: 300,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/shoe_box.png'),
                        fit: BoxFit.cover,
                      ),
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
