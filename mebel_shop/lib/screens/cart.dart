import 'package:flutter/material.dart';

List<Cart> cart = [];

// ignore: must_be_immutable
class Cart extends StatefulWidget {
  final String image;
  final String title;
  final String price;

  const Cart(
      {Key? key, required this.image, required this.title, required this.price})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _CartState createState() => _CartState(image, price, title);
}

class _CartState extends State<Cart> {
  _CartState(String image, String price, String title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  'Cart',
                  style: TextStyle(
                    fontSize: 35,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            // ignore: sized_box_for_whitespace
            Container(
              width: 300,
              height: 700,
              child: GridView.builder(
                itemCount: cart.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  mainAxisSpacing: 30,
                  crossAxisSpacing: 30,
                ),
                itemBuilder: (context, index) => Column(
                  children: [
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
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
                              icon: const Icon(
                                Icons.shopping_cart,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        // ignore: sized_box_for_whitespace
                        Container(
                          width: 150,
                          height: 150,
                          child: Image.asset(cart[index].image),
                        ),
                        Text(
                          "\$${cart[index].price}",
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Text(
                          cart[index].title,
                          style: const TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// import 'package:flutter/material.dart';

// class Cart extends StatelessWidget {
//   // ignore: prefer_typing_uninitialized_variables
//   final cart;
//   // ignore: prefer_typing_uninitialized_variables
//   final sum;

//   // ignore: use_key_in_widget_constructors
//   const Cart(this.cart, this.sum);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Cart'),
//         ),
//         body: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const Center(
//               child: Text('Cart'),
//             ),
//             ListView.separated(
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(cart[index].title,),
//                   trailing: Text(
//                     "\$${cart[index].price}",
//                     style: const TextStyle(
//                       color: Colors.redAccent,
//                       fontSize: 20,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                   onTap: () {},
//                 );
//               },
//               separatorBuilder: (context, index) {
//                 return const Divider();
//               },
//               itemCount: cart.length,
//               shrinkWrap: true,
//             ),
//             const Divider(),
//             Text("Total : \$$sum"),
//           ],
//         ));
//   }
// }
