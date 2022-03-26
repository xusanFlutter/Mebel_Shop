import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mebel_shop/category/categorys.dart';
import 'package:mebel_shop/popular/popular.dart';
import 'package:mebel_shop/widgets/buy.dart';

class Bathroom {
  final String baho;
  final String image;
  final String title;
  final String discription;
  final String price;

  const Bathroom(
      {required this.title,
      required this.baho,
      required this.image,
      required this.discription,
      required this.price});
}

dynamic _sanagich = 1;

// ignore: must_be_immutable
class Bathroom1 extends StatefulWidget {
  const Bathroom1(BuildContext context, {Key? key}) : super(key: key);

  @override
  State<Bathroom1> createState() => _Bathroom1State();
}

class _Bathroom1State extends State<Bathroom1> {
  List<Bathroom> items = [
    const Bathroom(
        baho: '5',
        title: 'Popular 1',
        image: 'assets/bathroom.png',
        discription: 'Lorem ipsum dolor',
        price: '240.00'),
    const Bathroom(
        baho: '3',
        title: 'Popular 2',
        image: 'assets/popular8.png',
        discription: 'Lorem ipsum dolor',
        price: '590.00'),
    const Bathroom(
        baho: '4.6',
        title: 'Popular 3',
        image: 'assets/popular3.png',
        discription: 'Lorem ipsum dolor',
        price: '240.00'),
    const Bathroom(
        baho: '2.8',
        title: 'Popular 4',
        image: 'assets/popular4.png',
        discription: 'Lorem ipsum dolor',
        price: '590.00'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Bathroom',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 550,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.75,
                    mainAxisSpacing: 30,
                    crossAxisSpacing: 30,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final itemlar = items[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Bathroom2(item: itemlar)));
                      },
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 50),
                                child: IconButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: const Text('Add to basket'),
                                        action: SnackBarAction(
                                          label: 'Ok',
                                          onPressed: () {
                                            // Code to execute.
                                          },
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.shopping_cart),
                                ),
                              )
                            ],
                          ),
                          Hero(
                            tag: itemlar,
                            child: buildItem(itemlar.image),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          buildPrice(itemlar.price),
                          buildTitle(itemlar.discription),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildItem(String image) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: SizedBox(
          height: 130,
          child: Image.asset(
            image,
            fit: BoxFit.cover,
            width: 180,
            height: 180,
          ),
        ),
      );

  Widget buildPrice(String price) {
    return Text(
      price,
      style: const TextStyle(fontSize: 18),
    );
  }

  Widget buildTitle(String discription) {
    return Text(
      discription,
      style: const TextStyle(
        fontSize: 18,
      ),
    );
  }
}

class Bathroom2 extends StatefulWidget {
  final Bathroom item;
  const Bathroom2({Key? key, required this.item}) : super(key: key);

  @override
  State<Bathroom2> createState() => _Bathroom2State();
}

class _Bathroom2State extends State<Bathroom2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                )
              ],
            ),
            Hero(
              tag: widget.item,
              child: buildImage(),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  widget.item.discription,
                  style: const TextStyle(fontSize: 20),
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 25,
                      ),
                      Text(
                        widget.item.baho,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // ignore: unnecessary_string_interpolations
                Text(
                  '\$${widget.item.price}',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _sanagich--;
                          });
                          if (_sanagich == 0) {
                            return;
                          }
                        },
                        icon: const Icon(
                          Icons.remove,
                          size: 20,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '$_sanagich',
                          style: const TextStyle(fontSize: 20),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            _sanagich++;
                          });
                        },
                        icon: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // ignore: avoid_unnecessary_containers
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context, ScaleTransition5(PopularDetails(context)));
              },
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Details',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context, ScaleTransition5(PopularDetails(context)));
                      },
                      icon: const Icon(
                        Icons.keyboard_arrow_right_outlined,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            // ignore: avoid_unnecessary_containers
            GestureDetector(
              onTap: () {},
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, ScaleTransition5(PopularReviews(context)));
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Reviews',
                        style: TextStyle(fontSize: 25),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.push(context,
                              ScaleTransition5(PopularReviews(context)));
                        },
                        icon: const Icon(
                          Icons.keyboard_arrow_right_outlined,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Center(
              child: CupertinoButton(
                child: const Text('Buy'),
                onPressed: () {
                  Navigator.push(context, ScaleTransition5(BuyPage(context)));
                },
                color: CupertinoColors.activeBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: Image.asset(
        widget.item.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
