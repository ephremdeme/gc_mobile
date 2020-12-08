import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/providers/cart.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
// import '../../../constants.dart';
import '../../../size_config.dart';
import '../../../components/default_button.dart';
import '../../../graphql/mutations/check_out.dart';

class CheckoutCard extends StatelessWidget {
  const CheckoutCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
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
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: "Total:\n",
                    children: [
                      TextSpan(
                        text: "Br. ${cart.totalAmount}",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: //Mutation(
                  //   options: MutationOptions(
                  //     documentNode: gql(checkOut),
                  //     update: (Cache cache, QueryResult result) {
                  //       return cache;
                  //     },
                  //     onCompleted: (dynamic resultData) async {
                  //       if (resultData != null) {
                  //         Navigator.popAndPushNamed(
                  //           context, HomeScreen.routeName);
                  //       } 
                  //     },
                  //     onError: (OperationException exception) {
                  //       Navigator.popAndPushNamed(
                  //         context,
                  //         LoginFailedScreen.routeName,
                  //         arguments: exception.graphqlErrors,
                  //       );
                  //     }),
                  //   builder: (
                  //     RunMutation runMutation,
                  //     QueryResult result,
                  //   ) {
                  //     return DefaultButton(
                  //       text: "Check Out",
                  //       press: () async {
                  //           Map<String, Map<>>
                  //           runMutation({
                  //             "orders": order,
                  //           });
                  //         }
                  //     );
                  //   }),
                  // ), 
                  DefaultButton(
                    text: "Check Out",
                    press: () async {

                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
