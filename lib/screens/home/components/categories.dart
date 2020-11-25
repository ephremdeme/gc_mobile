import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/models/Category.dart';
import 'package:flutter_native_interaction/models/CategoryResponse.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../size_config.dart';
import '../../../graphql/querys/categories.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(20)),
      child: Query(
        options: QueryOptions(
          documentNode: gql(readCategories),
          pollInterval: 20,
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.loading) {
            return Text('Loading');
          }
          List<dynamic> category = result.data["categories"];

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                category.length,
                (index) => CategoryCard(
                  text: category[index]["category"],
                  press: () {},
                ),
              ),
            )
          );
        },
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key key,
    @required this.text,
    @required this.press,
  }) : super(key: key);

  final String text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(90),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(getProportionateScreenWidth(5)),
              padding: EdgeInsets.all(getProportionateScreenWidth(5)),
              height: getProportionateScreenWidth(30),
              width: getProportionateScreenWidth(90),
              decoration: BoxDecoration(
                color: Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(text, textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }
}
