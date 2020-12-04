import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/constants.dart';
import 'package:flutter_native_interaction/screens/details/details_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:flutter_native_interaction/graphQLConf.dart';
import 'package:provider/provider.dart';

import '../../providers/cart.dart';
import '../../size_config.dart';
import '../../graphql/querys/categories.dart';
import 'components/home_header.dart';
import 'components/special_offers.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key key});

  static String routeName = './category_screen';
  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context).settings.arguments;

    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            HomeHeader(),
            SizedBox(height: getProportionateScreenHeight(20)),
            SpecialOffers(),
            SizedBox(height: getProportionateScreenHeight(20)),
            CategoryBody(id: id)
          ],
        ),
      ),
    ));
  }
}

class CategoryBody extends StatelessWidget {
  final int id;
  const CategoryBody({Key key, @required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);

    return Padding(
        padding: EdgeInsets.all(getProportionateScreenWidth(5)),
        child: Query(
            options: QueryOptions(
              documentNode: gql(singleCategory),
              variables: {
                'id': id,
              },
              pollInterval: 30,
            ),
            builder: (QueryResult result,
                {VoidCallback refetch, FetchMore fetchMore}) {
              if (result.hasException) {
                return Text(result.exception.toString());
              }
              if (result.loading) {
                return Text('Loading');
              }
              List<dynamic> category = result.data["category"]["products"];
              print(category[0]);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                    child: Text(
                      result.data["category"]["category"],
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(18),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: GridView.builder(
                      itemCount: category.length,
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
                                arguments: category[index]["id"])
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
                                      tag: category[index]["id"],
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              getProportionateScreenWidth(10)),
                                          child: Image(
                                            image: NetworkImage(serverLink +
                                                "products/" +
                                                category[index]["id"]
                                                    .toString() +
                                                "/images/" +
                                                category[index]["images"][0]
                                                    ["filename"]),
                                            fit: BoxFit.cover,
                                          ))),
                                ),
                              ),
                              const SizedBox(height: 2),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  category[index]["name"],
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
                                      "Br. ${category[index]["price"]}",
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
                                              category[index]["id"],
                                              category[index]["price"].toDouble(),
                                              category[index]["name"],
                                              serverLink +
                                                  "products/" +
                                                  category[index]["id"]
                                                      .toString() +
                                                  "/images/" +
                                                  category[index]["images"][0]
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
            }));
  }
}
