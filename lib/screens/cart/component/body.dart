import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/providers/cart.dart';
import 'package:flutter_native_interaction/screens/cart/component/cart_card.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: ListView.builder(
            itemCount: cart.items.length, 
            itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Dismissible(
                    key: ValueKey(cart.items.keys.toList()[index]),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      cart.removeItem(cart.items.keys.toList()[index]);
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
                    child:
                        CartCard(name: cart.items.values.toList()[index].name),
                  ),
                )));
  }
}
