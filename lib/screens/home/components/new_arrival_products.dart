import 'package:flutter/material.dart';
import 'package:stylish/models/Product.dart';
import 'package:stylish/screens/details/details_screen.dart';

import '../../../constants.dart';
import 'product_card.dart';
import 'section_title.dart';

class NewArrivalProducts extends StatelessWidget {
  const NewArrivalProducts({ Key? key, required this.demo, required this.SeeAll, required this.addToCart}) : super(key: key);
  
  final List<Product> demo;
  final Function SeeAll;
  final Function addToCart;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [  
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: SectionTitle(
            title: "Список товарів",
            pressSeeAll: () => SeeAll(),
          ),
        ),
        SingleChildScrollView(
           scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            children: List.generate(
              demo.length,
              (index) => Padding(
                padding: const EdgeInsets.only(right: defaultPadding),
                child: ProductCard(
                  title: demo[index].title,
                  image: demo[index].image,
                  price: demo[index].price,
                  bgColor: demo[index].bgColor,
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DetailsScreen(product: demo[index],addToCart: addToCart),
                        ));
                  },
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
