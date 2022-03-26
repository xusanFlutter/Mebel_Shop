import 'package:flutter/material.dart';
import 'package:mebel_shop/category/categoryList.dart';
import 'package:mebel_shop/category/categorys.dart';
import 'package:mebel_shop/popular/popular.dart';
import 'package:carousel_slider/carousel_slider.dart';

RangeValues currentRangeValues = const RangeValues(0, 100);

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String fullname, email, username, phonenumber;

  HomePage(
      {Key? key,
      required this.fullname,
      required this.email,
      required this.phonenumber,
      required this.username})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 60),
                          child: Text(
                            'Hi ${widget.fullname} 👋 We are glad to see you',
                            style: const TextStyle(
                              fontSize: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.search,
                            size: 50,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                              isScrollControlled: true,
                              context: context,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(25),
                                ),
                              ),
                              builder: (BuildContext context) {
                                return FractionallySizedBox(
                                  heightFactor: 0.4,
                                  child: ListView(
                                    children: [
                                      // ignore: sized_box_for_whitespace
                                      Container(
                                        height: 350,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: const [
                                                Text(
                                                  'Price filter',
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const newSlider(),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    MaterialButton(
                                                      color: Colors.grey[300],
                                                      onPressed: () {},
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(
                                                            15.0),
                                                        child: Text(
                                                          'Clean',
                                                          style: TextStyle(
                                                            fontSize: 25,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      width: 30,
                                                    ),
                                                    MaterialButton(
                                                      color: Colors.blue,
                                                      onPressed: () {},
                                                      child: const Padding(
                                                        padding: EdgeInsets.all(
                                                            15.0),
                                                        child: Text(
                                                          'Apply',
                                                          style: TextStyle(
                                                            fontSize: 25,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.account_tree_outlined,
                            size: 50,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Category',
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: 200,
                height: 200,
                child: const Category(),
              ),

              // ignore: sized_box_for_whitespace
              // Container(
              //   width: 350,
              //   height: 300,
              //   child: Image.asset('assets/sale.png'),
              // ),
              CarouselSlider(
                options: CarouselOptions(
                  height: 300,
                  scrollDirection: Axis.horizontal,
                  autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                  autoPlayInterval: const Duration(seconds: 3),
                  reverse: false,
                  autoPlay: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                ),
                items: [
                  SizedBox(
                    width: 350,
                    height: 300,
                    child: Image.asset('assets/sale.png'),
                  ),
                  SizedBox(
                    width: 350,
                    height: 250,
                    child: Image.asset('assets/friday.png'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Popular 💖',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context, ScaleTransition5(SecondPage(context)));
                      },
                      child: const Text(
                        'View more',
                        style: TextStyle(color: Colors.blue, fontSize: 25),
                      ),
                    ),
                  ],
                ),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: 412,
                height: 230,
                child: Popular1(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class newSlider extends StatefulWidget {
  const newSlider({
    Key? key,
  }) : super(key: key);

  @override
  State<newSlider> createState() => _newSliderState();
}

// ignore: camel_case_types
class _newSliderState extends State<newSlider> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: RangeSlider(
        min: 0,
        max: 100,
        values: currentRangeValues,
        labels: RangeLabels(
          currentRangeValues.start.round().toString(),
          currentRangeValues.end.round().toString(),
        ),
        onChanged: (RangeValues newRange) {
          setState(() {
            currentRangeValues = newRange;
          });
        },
      ),
    );
  }
}
