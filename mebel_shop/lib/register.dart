import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _fullname1 = TextEditingController();
  final TextEditingController _email1 = TextEditingController();
  final TextEditingController _phonenumber1 = TextEditingController();
  final TextEditingController _username1 = TextEditingController();
  final TextEditingController _password1 = TextEditingController();

  final TextEditingController _fullname2 = TextEditingController();
  final TextEditingController _password2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Registration here',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoButton(
                    color: CupertinoColors.activeBlue,
                    child: const Text('Sign in'),
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return FractionallySizedBox(
                            heightFactor: 0.5,
                            child: Column(
                              children: [
                                // ignore: sized_box_for_whitespace
                                Container(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              'Sign in',
                                              style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 50,
                                          right: 50,
                                        ),
                                        child: TextField(
                                          controller: _fullname2,
                                          decoration: const InputDecoration(
                                            fillColor: Colors.grey,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            labelText: 'Full name',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 50,
                                          right: 50,
                                        ),
                                        child: TextField(
                                          controller: _password2,
                                          decoration: const InputDecoration(
                                            fillColor: Colors.grey,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            labelText: 'Password',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      CupertinoButton(
                                        color: CupertinoColors.activeBlue,
                                        onPressed: () {
                                          // ignore: empty_statements
                                          if (_fullname2.text == "" &&
                                              _password2.text == "") {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: const Text('Error'),
                                                content: const Text(
                                                    'You did not enter the following. Please try again later'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                    child: const Text(
                                                      'Оk',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            Navigator.pushNamed(
                                                context, '/second');
                                          }
                                          _fullname2.text == "";
                                          _password2.text == "";
                                        },
                                        child: const Text(
                                          'Register',
                                        ),
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CupertinoButton(
                    color: CupertinoColors.activeBlue,
                    child: const Text('Sign up'),
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder: (BuildContext context) {
                          return FractionallySizedBox(
                            heightFactor: 0.8,
                            child: Column(
                              children: [
                                // ignore: sized_box_for_whitespace
                                Container(
                                  height: 600,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: const [
                                          Padding(
                                            padding: EdgeInsets.all(15.0),
                                            child: Text(
                                              'Sign up',
                                              style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 50, right: 50),
                                        child: TextField(
                                          controller: _fullname1,
                                          decoration: const InputDecoration(
                                            fillColor: Colors.grey,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            labelText: 'Full name',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 50, right: 50),
                                        child: TextField(
                                          controller: _username1,
                                          decoration: const InputDecoration(
                                            fillColor: Colors.grey,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.transparent),
                                            ),
                                            labelText: 'User name',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 50, right: 50),
                                        child: TextField(
                                          controller: _phonenumber1,
                                          keyboardType: TextInputType.number,
                                          decoration: const InputDecoration(
                                            fillColor: Colors.grey,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            labelText: 'Phone number',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 50,
                                          right: 50,
                                        ),
                                        child: TextField(
                                          controller: _email1,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          decoration: const InputDecoration(
                                            fillColor: Colors.grey,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            labelText: 'Email',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 50,
                                          right: 50,
                                        ),
                                        child: TextField(
                                          controller: _password1,
                                          decoration: const InputDecoration(
                                            fillColor: Colors.grey,
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            labelText: 'Password',
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      CupertinoButton(
                                        color: CupertinoColors.activeBlue,
                                        onPressed: () {
                                          // ignore: empty_statements
                                          if (_phonenumber1.text == "" &&
                                              _email1.text == "" &&
                                              _fullname1.text == "" &&
                                              _password1.text == "" &&
                                              _username1.text == "") {
                                            showDialog(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: const Text('Error'),
                                                content: const Text(
                                                    'You did not enter the following. Please try again later'),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        Navigator.pop(context);
                                                      });
                                                    },
                                                    child: const Text(
                                                      'Оk',
                                                      style: TextStyle(
                                                          color: Colors.blue,
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          } else {
                                            Navigator.pushNamed(
                                                context, '/second');
                                          }
                                          _phonenumber1.text == "";
                                          _email1.text == "";
                                          _fullname1.text == "";
                                          _password1.text == "";
                                          _username1.text == "";
                                        },
                                        child: const Text(
                                          'Register',
                                        ),
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
