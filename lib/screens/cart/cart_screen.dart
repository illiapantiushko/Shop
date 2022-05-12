import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:stylish/constants.dart';
import '../../models/Product.dart';
import 'cartCard.dart';



class CartScreen  extends StatelessWidget {
   CartScreen ({Key? key, required this.list, this.count, required this.removeFromCart, required this.payment}) : super(key: key);

   final count;
   final List<Product> list;
   final Function removeFromCart;
   final Function payment;
   @override
  Widget build(BuildContext context) {
     
   return Scaffold(
      appBar: AppBar(
          leading: const BackButton(color: Color.fromARGB(255, 62, 34, 34)),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/Location.svg"),
            const SizedBox(width: defaultPadding / 2),
            Text(
              "Кошик",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
        actions: [
        ],
      ),
      body: Padding(
      padding:
          EdgeInsets.symmetric(horizontal: 2),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(list[index].title),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              removeFromCart(list[index].price, list[index]);
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartCard(cart: list[index]),
          ),
        ),
      ),
       ),
      
        bottomNavigationBar:
        Container(
      padding: EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 30,
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child:
       SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "\$${count}",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 50,
                  child:
                 ElevatedButton(
                        onPressed: (){ 
                          payment();
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                            primary: primaryColor,
                            shape: const StadiumBorder()),
                        child: const Text("Оплатити"),
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    )
   );
  }
}
