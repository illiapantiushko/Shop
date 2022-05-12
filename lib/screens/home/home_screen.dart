import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/constants.dart';
import '../../models/Product.dart';
import '../cart/cart_screen.dart';
import 'components/categories.dart';
import 'components/new_arrival_products.dart';
import 'components/search_form.dart';

class ParentPage extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<ParentPage> {
  int _count = 0;
  List<Product> cart = [];
  List<Product> demo = ProductList().demo_product;
  
  void _addToCart(int price,Product product) {
    setState(() => _count = _count + price);
    setState(() => cart.add(product));
  }

  void _removeFromCart(int price, Product product) {
    setState(() => _count = _count - price);
    setState(() => cart.remove(product));
  }

   void _payment() {
    setState(() => _count = 0);
    setState(() => cart = []);
  }

  void initial() {
    setState(() => demo = ProductList().demo_product);
  }

  void filterByCategory(String categorie) {
    setState(() => demo = ProductList().demo_product.where((element) => element.type == categorie).toList());
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/Location.svg"),
            const SizedBox(width: defaultPadding / 2),
            Text(
              "Магазин",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset("assets/icons/cart.svg",  color: Colors.blue),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartScreen(list: cart ,count: _count, removeFromCart:_removeFromCart, payment:_payment),
                        ));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Explore",
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            const Text(
              "best Outfits for you",
              style: TextStyle(fontSize: 18),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: defaultPadding),
              child: SearchForm(),
            ),
             Categories(filterByCategory:filterByCategory),
             NewArrivalProducts(demo: demo, SeeAll: initial, addToCart: _addToCart),
          ],
        ),
      ),
    );
  }
}
