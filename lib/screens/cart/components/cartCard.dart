import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:stylish/models/Product.dart';

import '../../../../constants.dart';
import '../../home/home_screen.dart';


class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.cart,
  }) : super(key: key);

  final Product cart;

@override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(cart.image),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cart.title,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
             Text(
                 "\$" + cart.price.toString(),
              style: TextStyle(color: Colors.orange, fontSize: 12),
              maxLines: 2,
            ),
          ],
        )
      ],
    );
  }
}




