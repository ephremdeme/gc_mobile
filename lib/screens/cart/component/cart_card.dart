import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key key,
   // @required this.cart,
  }) : super(key: key);

  
//final Cart cart;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
             // child: Image.asset(cart.product.images[0]),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
             "product tittle",
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "33333",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: kPrimaryColor),
                children: [
                  TextSpan(
                      text: " number of item}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
