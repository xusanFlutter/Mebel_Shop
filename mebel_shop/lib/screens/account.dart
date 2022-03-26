import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mebel_shop/category/categorys.dart';

class Account extends StatefulWidget {
  const Account({Key? key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            // ignore: avoid_unnecessary_containers
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/accaunt.png'),
              ),
              title: Text(
                'Full name',
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
              subtitle: Text(
                '@user_name',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'Information',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15),
                      child: Text(
                        'and settings',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, ScaleTransition5(Accaunt(context)));
                            },
                            child: Row(
                              children: const [
                                Icon(Icons.person),
                                Text('My accaunt'),
                              ],
                            ),
                          ),
                          Row(
                            children: const [
                              Icon(Icons.wrap_text),
                              Text('Order and Return'),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.recent_actors),
                              Text('Categories'),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(Icons.help),
                              Text('Help & info'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    CupertinoButton(
                      minSize: 50,
                      color: Colors.black,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.exit_to_app,
                            color: Colors.white,
                          ),
                          Text(
                            'Sign Out',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: const Text('Exit accaunt'),
                            content: const Text(
                              'Do you want to log out of your account',
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    Navigator.pushNamed(context, '/');
                                  });
                                },
                                child: const Text(
                                  'Оk',
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Accaunt extends StatefulWidget {
  const Accaunt(BuildContext context, {Key? key}) : super(key: key);

  @override
  _AccauntState createState() => _AccauntState();
}

class _AccauntState extends State<Accaunt> {
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
                    'My accaunt',
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
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: const DecorationImage(
                        image: AssetImage('assets/accaunt.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Full name',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Email',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context, ScaleTransition5(Payment(context)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          'Payment methods',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.push(
                                context, ScaleTransition5(Payment(context)));
                          },
                          icon: const Icon(
                            Icons.keyboard_arrow_right_outlined,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Plastik {
  final String nomer;
  final String title;
  final String discription;
  final Color rang;
  final String turi;

  const Plastik({
    required this.nomer,
    required this.title,
    required this.discription,
    required this.rang,
    required this.turi
  });
}

bool utkazma = false;
dynamic border = Colors.white;
dynamic border2 = Colors.white;
dynamic turi;

class Payment extends StatefulWidget {
  const Payment(BuildContext context, {Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  final TextEditingController ismi = TextEditingController();
  final TextEditingController nomer = TextEditingController();
  List<Plastik> method = [
    const Plastik(
      turi: 'VISA',
      rang: Colors.blue,
      nomer: '860009345677',
      title: 'Tolibov Husan',
      discription: 'Lorem ipsum dolor',
    ),
    const Plastik(
      turi: 'Master Card',
      rang: Colors.yellow,
      nomer: '860009345677',
      title: 'Tolibov Husan',
      discription: 'Lorem ipsum dolor',
    ),
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
                        'Payment methods',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 400,
              height: 300,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                scrollDirection: Axis.horizontal,
                itemCount: method.length,
                itemBuilder: (context, index) {
                  final itemlar = method[index];
                  return Row(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: method[index].rang,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 315,
                              height: 180,
                              child: Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Text(
                                          method[index].turi,
                                          style: const TextStyle(
                                            fontSize: 22,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Center(
                                    child: buildNomer(itemlar.nomer),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: buildTitle(itemlar.title),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Add new method',
                  style: TextStyle(
                    fontSize: 25,
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      utkazma = true;
                    });
                    if (utkazma = true) {
                      border = Colors.green;
                    } else if (utkazma = false) {
                      border2 = Colors.white;
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: border,
                        width: 3,
                      ),
                    ),
                    width: 70,
                    height: 50,
                    child: Image.asset('assets/visa.png'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      utkazma = false;
                    });
                    if (utkazma = false) {
                      border2 = Colors.green;
                    } else if (utkazma = true) {
                      border = Colors.white;
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: border2,
                        width: 3,
                      ),
                    ),
                    width: 70,
                    height: 50,
                    child: Image.asset('assets/mastercard.png'),
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
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextField(
                      controller: ismi,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Full name',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: nomer,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Card nomer',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CupertinoButton(
                    color: CupertinoColors.activeBlue,
                    child: const Text('Save'),
                    onPressed: () {
                      setState(() {
                        if (nomer.text != "" &&
                            ismi.text != "" &&
                            utkazma == false) {
                          method.add(
                            Plastik(
                              turi: 'VISA',
                              rang: Colors.blue,
                              nomer: nomer.text,
                              title: ismi.text,
                              discription: 'Lorem ipsum dolor',
                            ),
                          );
                        } else if (nomer.text != "" &&
                            ismi.text != "" &&
                            utkazma == true) {
                          method.add(
                            Plastik(
                              turi: 'Master Card',
                              rang: Colors.yellow,
                              nomer: nomer.text,
                              title: ismi.text,
                              discription: 'Lorem ipsum dolor',
                            ),
                          );
                        } else {
                          return;
                        }
                        nomer.text = "";
                        ismi.text = "";
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNomer(String nomer) {
    return Text(
      nomer,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    );
  }

  Widget buildTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        color: Colors.white,
      ),
    );
  }
}
