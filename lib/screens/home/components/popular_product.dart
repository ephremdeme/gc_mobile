import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/graphql/querys/popular.dart';
import 'package:flutter_native_interaction/providers/cart.dart';
import 'package:flutter_native_interaction/screens/details/details_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
// import 'package:flutter_native_interaction/components/product_card.dart';

import '../../../constants.dart';
import '../../../graphQLConf.dart';
import '../../../size_config.dart';

class PopularProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Query(
        options: QueryOptions(
          documentNode: gql(popular),
          variables: {
            'limit': 6,
          },
          pollInterval: 2,
        ),
        builder: (QueryResult result,
                {VoidCallback refetch, FetchMore fetchMore}) {
                  if (result.hasException) {
                    return Text(result.exception.toString());
                  }
                  if (result.loading) {
                    return Center(child: CircularProgressIndicator(),);
                  }

                  List<dynamic> products = result.data["popularProducts"]["products"];
                  return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                    child: Text(
                      'Popular Products',
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: GridView.builder(
                      itemCount: products.length,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          color: kSecondaryColor.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(
                              getProportionateScreenWidth(10)),
                        ),
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.pushNamed(
                                context, DetailsScreen.routeName,
                                arguments: products[index]["id"])
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 1.4,
                                child: Container(
                                  padding: EdgeInsets.all(
                                      getProportionateScreenWidth(1)),
                                  child: Hero(
                                      tag: products[index]["id"],
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              getProportionateScreenWidth(10)),
                                          child: Image(
                                            image: NetworkImage(serverLink +
                                                "products/" +
                                                products[index]["id"]
                                                    .toString() +
                                                "/images/" +
                                                products[index]["images"][0]
                                                    ["filename"]),
                                            fit: BoxFit.cover,
                                          ))),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  products[index]["name"],
                                  style: TextStyle(color: Colors.black),
                                  maxLines: 2,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Br. ${products[index]["price"]}",
                                      style: TextStyle(
                                        fontSize:
                                            getProportionateScreenWidth(15),
                                        fontWeight: FontWeight.w500,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                    InkWell(
                                        borderRadius: BorderRadius.circular(50),
                                        onTap: () {
                                          cart.addItem(
                                              products[index]["id"],
                                              products[index]["price"].toDouble(),
                                              products[index]["name"],
                                              serverLink +
                                                  "products/" +
                                                  products[index]["id"]
                                                      .toString() +
                                                  "/images/" +
                                                  products[index]["images"][0]
                                                      ["filename"]);
                                        },
                                        child: Icon(
                                            Icons.add_shopping_cart_outlined,
                                            color: Colors.black45)),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
                },
      )
      
    );
  }
}
