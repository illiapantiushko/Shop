import 'package:flutter/material.dart';

class Product {
  final String image, title;
  final int price;
  final String type;
  final Color bgColor;

  Product({
    required this.image,
    required this.title,
    required this.type,
    required this.price,
    this.bgColor = const Color(0xFFEFEFF2),
  });
}

class ProductList  {

List<Product> demo_product = [
  Product(
    image: "assets/images/product_0.png",
    title: "Класична фотболка",
    type:"T-shirts",
    price: 99,
  ),
  Product(
    image: "assets/images/product_1.png",
    title: "Класична фотболка",
    price: 180,
    type:"T-shirts",
    bgColor: const Color(0xFFF8FEFB),
  ),
   Product(
    image: "assets/images/trouser.jpg",
    title: "Класичні брюки",
    price: 149,
    type:"Trouser",
    bgColor: Colors.white,
  ),
   Product(
    image: "assets/images/trouser2.jpg",
    title: "Класичні брюки",
    price: 149,
    type:"Trouser",
    bgColor: Colors.white,
  ),
    Product(
    image: "assets/images/product_2.png",
    title: "Класична сорочка",
    price: 149,
    type:"Shirt",
    bgColor: Color.fromARGB(255, 255, 255, 245),
  ),
   Product(
    image: "assets/images/product_2.png",
    title: "Класична сорочка",
    price: 149,
    type:"Shirt",
    bgColor: const Color(0xFFEEEEED),
  ),
];

}

