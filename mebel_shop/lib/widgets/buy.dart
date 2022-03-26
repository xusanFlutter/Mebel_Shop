import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextEditingController _name = TextEditingController();
TextEditingController _nomer = TextEditingController();
TextEditingController _mmgg = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _pochta = TextEditingController();

class BuyPage extends StatefulWidget {
  const BuyPage(BuildContext context, {Key? key}) : super(key: key);

  @override
  _BuyPageState createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
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
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Buy a product',
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          'Payment methods:',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset('assets/visa.png'),
                      ),
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: Image.asset('assets/mastercard.png'),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          controller: _name,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Имя на карте',
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          controller: _nomer,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Номер карты',
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          controller: _mmgg,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'ММ/ГГ',
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          obscureText: true,
                          controller: _password,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Код безопастности карты',
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: TextField(
                          controller: _pochta,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Почтовый индекс',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CupertinoButton(
                        color: CupertinoColors.activeBlue,
                        child: const Text('Payment'),
                        onPressed: () {
                          if (_name.text == "" &&
                              _pochta.text == "" &&
                              _nomer.text == "" &&
                              _mmgg.text == "" &&
                              _password.text == "") {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
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
                                          color: Colors.blue, fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text('Tansfer money'),
                                content: const Text(
                                    'The money was transferred successfully 👏👏'),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        Navigator.pop(context);
                                        _name.text = "";
                                        _nomer.text = "";
                                        _mmgg.text = "";
                                        _password.text = "";
                                        _pochta.text = "";
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
                          }
                        },
                      ),
                    ],
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
