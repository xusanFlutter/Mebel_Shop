// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:mebel_shop/category/categorys.dart';

class Product {
  final String image, title;
  final int id;
  Product({
    required this.id,
    required this.image,
    required this.title,
  });
}

List<Product> categories = [
  Product(
    id: 1,
    title: "Exclusive",
    image: 'assets/exclusive.png',
  ),
  Product(
    id: 2,
    title: "Home decor",
    image: 'assets/homedecor.png',
  ),
  Product(
    id: 3,
    title: "Lighting",
    image: 'assets/lighting.png',
  ),
  Product(
    id: 4,
    title: "Bathroom",
    image: 'assets/bathroom.png',
  ),
];

class Category extends StatefulWidget {
  const Category({Key? key}) : super(key: key);

  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) => Row(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: Column(
                children: [
                  // ignore: sized_box_for_whitespace
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage(categories[index].image),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8, left: 8),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(context, ScaleTransition5(SecondPage(context)));
                          },
                        ),
                      ),
                    ),
                  ),
                  Text(
                    categories[index].title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
