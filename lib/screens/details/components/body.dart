import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_interaction/components/default_button.dart';
import 'package:flutter_native_interaction/graphql/querys/products.dart';
import 'package:flutter_native_interaction/screens/see_more/see_more.dart';
import 'package:flutter_native_interaction/size_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import 'product_description.dart';
import 'top_rounded_container.dart';
import 'product_images.dart';

class Body extends StatefulWidget {
  final int id;

  const Body({Key key, @required this.id}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  static const platform = const MethodChannel('arcore');
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(5)),
      child: Query(
          options: QueryOptions(
              documentNode: gql(singleProduct),
              variables: {'id': widget.id},
              pollInterval: 1000),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }
            if (result.loading) {
              return Text('Loading');
            }

            dynamic product = result.data["product"];
            List<dynamic> images = result.data["product"]["images"];

            print(product["id"]);

            return Column(
              children: [
                ProductImages(
                  images: images,
                  id: product["id"],
                ),
                TopRoundedContainer(
                  color: Colors.white,
                  child: Column(
                    children: [
                      ProductDescription(
                        description: result.data["product"]["description"],
                        pressOnSeeMore: () {
                          List list = new List();
                          list.add(widget.id);
                          list.add(images);
                          Navigator.pushNamed(context, SeeMore.routeName,
                              arguments: list);
                        },
                        name: result.data["product"]["name"],
                      ),
                      DefaultButton(
                        text: 'View in AR',
                        press: () {
                          _openAr();
                        },
                      ),
                      TopRoundedContainer(
                        color: Color(0xFFF6F7F9),
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: SizeConfig.screenWidth * 0.15,
                            right: SizeConfig.screenWidth * 0.15,
                            bottom: getProportionateScreenWidth(40),
                            top: getProportionateScreenWidth(15),
                          ),
                          child: DefaultButton(
                            text: "Add To Cart",
                            press: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
    );
  }

  Future<String> _openAr() async {
    String value;
    try {
      value = await platform.invokeMethod('getMessage');
    } catch (err) {
      print(err);
    }
    return value;
  }
}
