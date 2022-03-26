import 'package:flutter/material.dart';
import 'package:mebel_shop/screens/account.dart';
// ignore: unused_import
import 'package:mebel_shop/screens/cart.dart';
import 'package:mebel_shop/screens/homePage.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final screens = [
    HomePage(fullname: '', email: '', phonenumber: '', username: '',),
    const Cart(image: '', price: '', title: '',),
    const Account(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: Colors.blue,
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          selectedIndex: index,
          onDestinationSelected: (index) => setState(() {
            this.index = index;
          }),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home, size: 30,), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.shopping_cart, size: 30,), label: 'Cart'),
            NavigationDestination(icon: Icon(Icons.person, size: 30,), label: 'Account'),
          ],
        ),
      ),
    );
  }
}
