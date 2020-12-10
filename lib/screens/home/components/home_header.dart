import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/screens/cart/cart_screen.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart.dart';
import '../../../size_config.dart';
import 'icon_btn_with_counter.dart';
import 'search_field.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Shop In AR",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          Spacer(),
          Consumer<Cart>(builder: (_, cart, wt) => IconBtnWithCounter (
              svgSrc: "assets/icons/Cart Icon.svg",
              numOfitem: cart.itemCount,
              press: () => Navigator.pushNamed(context, CartScreen.routeName),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(2.0),
          //   child: IconBtnWithCounter(
          //     svgSrc: "assets/icons/Bell.svg",
          //     numOfitem: 3,
          //     press: () {},
          //   ),
          // ),
        ],
      ),
    );
  }
}
