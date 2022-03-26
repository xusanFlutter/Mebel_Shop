// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mebel_shop/category/categorys.dart';
import 'package:mebel_shop/widgets/buy.dart';

dynamic _sanagich = 1;

class Popular {
  final String baho;
  final String image;
  final String title;
  final String discription;
  final String price;

  const Popular(
      {required this.title,
      required this.baho,
      required this.image,
      required this.discription,
      required this.price});
}

// ignore: must_be_immutable
class Popular1 extends StatefulWidget {
  const Popular1(BuildContext context, {Key? key}) : super(key: key);

  @override
  State<Popular1> createState() => _Popular1State();
}

class _Popular1State extends State<Popular1> {
  List<Popular> items = [
    const Popular(
        baho: '4.3',
        title: 'Popular 1',
        image: 'assets/popular1.png',
        discription: 'Lorem ipsum dolor',
        price: '548.00'),
    const Popular(
        baho: '3',
        title: 'Popular 2',
        image: 'assets/popular2.png',
        discription: 'Lorem ipsum dolor',
        price: '240.00'),
    const Popular(
        baho: '5',
        title: 'Popular 3',
        image: 'assets/popular3.png',
        discription: 'Lorem ipsum dolor',
        price: '548.00'),
    const Popular(
        baho: '5',
        title: 'Popular 4',
        image: 'assets/popular4.png',
        discription: 'Lorem ipsum dolor',
        price: '240.00'),
    const Popular(
        baho: '4',
        title: 'Popular 5',
        image: 'assets/popular5.png',
        discription: 'Lorem ipsum dolor',
        price: '548.00'),
    const Popular(
        baho: '3.8',
        title: 'Popular 6',
        image: 'assets/popular6.png',
        discription: 'Lorem ipsum dolor',
        price: '240.00'),
    const Popular(
        baho: '5',
        title: 'Popular 7',
        image: 'assets/popular7.png',
        discription: 'Lorem ipsum dolor',
        price: '548.00'),
    const Popular(
        baho: '4',
        title: 'Popular 8',
        image: 'assets/popular8.png',
        discription: 'Lorem ipsum dolor',
        price: '240.00'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: ListView.builder(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              final itemlar = items[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Popular2(item: itemlar)));
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
                    buildPrice('\$${itemlar.price}'),
                    Text(
                      'Popular ${index + 1}',
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }

  Widget buildItem(String image) => Padding(
        padding: const EdgeInsets.all(12.0),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
          width: 100,
          height: 100,
        ),
      );

  Widget buildPrice(String price) {
    return Text(
      price,
      style: const TextStyle(fontSize: 18),
    );
  }
}

class Popular2 extends StatefulWidget {
  final Popular item;
  const Popular2({Key? key, required this.item}) : super(key: key);

  @override
  State<Popular2> createState() => _Popular2State();
}

class _Popular2State extends State<Popular2> {
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
            Hero(tag: widget.item, child: buildImage()),
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

class PopularDetails extends StatefulWidget {
  const PopularDetails(BuildContext context, {Key? key}) : super(key: key);

  @override
  _PopularDetailsState createState() => _PopularDetailsState();
}

class _PopularDetailsState extends State<PopularDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Details',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque mollis, massa id lobortis feugiat',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque mollis, massa id lobortis feugiat, mi metus facilisis tortor, malesuada finibus ante mi quis turpis.',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Praesent auctor lorem quam, in viverra nunc pharetra sit amet. Vivamus id urna imperdiet, viverra leo non, tincidunt nisl. ',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Reviews {
  final String image;
  final String title;
  final dynamic icon;
  final dynamic time;
  final String description;
  final String ball;

  const Reviews({
    required this.ball,
    required this.description,
    required this.icon,
    required this.time,
    required this.title,
    required this.image,
  });
}

var time = '';
var star1 = Colors.black;
var star2 = Colors.black;
var star3 = Colors.black;
var star4 = Colors.black;
var star5 = Colors.black;
var sariq = Colors.yellow;

final comment = TextEditingController();
var ball = 0;

// ignore: must_be_immutable
class PopularReviews extends StatefulWidget {
  const PopularReviews(BuildContext context, {Key? key}) : super(key: key);

  @override
  _PopularReviewsState createState() => _PopularReviewsState();
}

class _PopularReviewsState extends State<PopularReviews> {
  List<Reviews> chat = [
    const Reviews(
      ball: '5',
      description:
          'For students it is not much good app but good for doing a personal business it is very good as it has tasks, my date, important, planned, assigned to me,',
      icon: Icons.star,
      title: 'Antonio Baindue',
      image: 'assets/comment1.png',
      time: Text('12.09.2021 | 12:33'),
    ),
    const Reviews(
      ball: '4',
      description:
          'We aim to show you accurate product that you like definitely because of its quality. Therefore, we address this information to our customers.',
      icon: Icons.star,
      title: 'Darlene Robertson',
      image: 'assets/comment2.png',
      time: Text('05.08.2021 | 10:21'),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Reviews',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              // ignore: sized_box_for_whitespace
              Container(
                width: 392,
                height: 500,
                child: ListView.builder(
                  itemCount: chat.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListTile(
                          title: Text(chat[index].title),
                          leading: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(chat[index].image),
                          ),
                          subtitle: chat[index].time,
                          trailing: Padding(
                            padding: const EdgeInsets.only(right: 50),
                            // ignore: sized_box_for_whitespace
                            child: Container(
                              width: 40,
                              child: Row(
                                children: [
                                  Icon(
                                    chat[index].icon,
                                    color: Colors.yellow,
                                    size: 25,
                                  ),
                                  Text(
                                    chat[index].ball,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            chat[index].description,
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Container(
                    color: Colors.grey[200],
                    width: double.infinity,
                    height: 150,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    star1 = sariq;
                                  });
                                },
                                icon: Icon(
                                  Icons.star,
                                  color: star1,
                                )),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    star2 = sariq;
                                    star1 = sariq;
                                  });
                                },
                                icon: Icon(Icons.star, color: star2)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    star3 = sariq;
                                    star2 = sariq;
                                    star1 = sariq;
                                  });
                                },
                                icon: Icon(Icons.star, color: star3)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    star4 = sariq;
                                    star3 = sariq;
                                    star2 = sariq;
                                    star1 = sariq;
                                  });
                                },
                                icon: Icon(Icons.star, color: star4)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    star5 = sariq;
                                    star4 = sariq;
                                    star3 = sariq;
                                    star2 = sariq;
                                    star1 = sariq;
                                  });
                                },
                                icon: Icon(Icons.star, color: star5)),
                          ],
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: TextField(
                              controller: comment,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    if (star1 == sariq) {
                                      ball = 1;
                                    }
                                    if (star2 == sariq) {
                                      ball = 2;
                                    }
                                    if (star3 == sariq) {
                                      ball = 3;
                                    }
                                    if (star4 == sariq) {
                                      ball = 4;
                                    }
                                    if (star5 == sariq) {
                                      ball = 5;
                                    }
                                    if (comment.text != '') {
                                      setState(() {
                                        star5 = Colors.black;
                                        star4 = Colors.black;
                                        star3 = Colors.black;
                                        star2 = Colors.black;
                                        star1 = Colors.black;
                                        chat.add(
                                          Reviews(
                                            ball: ball.toString(),
                                            description: comment.text,
                                            icon: Icons.star,
                                            title: 'User name',
                                            image: 'assets/accaunt.png',
                                            time: Text(time =
                                                DateTime.now().toString()),
                                          ),
                                        );
                                        comment.text = '';
                                      });
                                    } else {
                                      return;
                                    }
                                  },
                                  icon: const Icon(Icons.send),
                                  color: Colors.blue,
                                ),
                                border: const OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                labelText: 'Comment',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
