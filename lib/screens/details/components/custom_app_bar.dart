import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/constants.dart';
import 'package:flutter_native_interaction/graphql/querys/rate.dart';
import 'package:flutter_native_interaction/providers/cart.dart';
import 'package:flutter_native_interaction/screens/cart/cart_screen.dart';
import 'package:flutter_native_interaction/screens/home/components/icon_btn_with_counter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import '../../../size_config.dart';

class CustomAppBar extends PreferredSize {
  final int id;

  CustomAppBar({this.id});

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    double rating = 0.0;
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(30),
            vertical: getProportionateScreenHeight(10)),
        child: Row(
          children: [
            SizedBox(
              height: getProportionateScreenWidth(40),
              width: getProportionateScreenWidth(40),
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(60),
                ),
                color: kSecondaryColor.withOpacity(0.1),
                padding: EdgeInsets.zero,
                onPressed: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  "assets/icons/Back ICon.svg",
                  height: 15,
                ),
              ),
            ),
            Spacer(),
            Consumer<Cart>(
              builder: (_, cart, wt) => IconBtnWithCounter(
                svgSrc: "assets/icons/Cart Icon.svg",
                numOfitem: cart.itemCount,
                press: () => Navigator.pushNamed(context, CartScreen.routeName),
              ),
            ),
            SizedBox(width: getProportionateScreenWidth(10)),
            // Query(
            //     options: QueryOptions(
            //       documentNode: gql(rate),
            //       variables: {
            //         'id': 6,
            //       },
            //       pollInterval: 10,
            //     ),
            //     builder: (QueryResult result,
            //         {VoidCallback refetch, FetchMore fetchMore}) {
            //       if (result.hasException) {
            //         print(result.exception.toString());
            //       }
            //       // rating = result.data["rating"]["rating"];
            //       print(result.data["rating"]["rating"]);
            //       return Container(
            //         padding:
            //             const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
            //         decoration: BoxDecoration(
            //           color: kSecondaryColor.withOpacity(0.1),
            //           borderRadius: BorderRadius.circular(14),
            //         ),
            //         child: Row(
            //           children: [
            //             Text(
            //               "$rating",
            //               style: const TextStyle(
            //                 fontSize: 14,
            //                 fontWeight: FontWeight.w600,
            //               ),
            //             ),
            //             const SizedBox(width: 5),
            //             SvgPicture.asset("assets/icons/Star Icon.svg"),
            //           ],
            //         ),
            //       );
            //     }),
          ],
        ),
      ),
    );
  }
}
