import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../graphQLConf.dart';
import '../../../size_config.dart';
import 'section_title.dart';
import '../../../graphql/querys/products.dart';

class SpecialOffers extends StatelessWidget {
  const SpecialOffers({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Query(
          options: QueryOptions(
            documentNode: gql(newProducts),
            variables: {'limit': 8, 'by_date': true},
            pollInterval: 10,
          ),
          builder: (QueryResult result,
              {VoidCallback refetch, FetchMore fetchMore}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }
            if (result.loading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            List<dynamic> products = result.data["products"]["products"];

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(20)),
                  child: SectionTitle(
                    title: "New Arrived",
                    press: () {},
                  ),
                ),     
                SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SpecialOfferCard(
                          image: serverLink + "products/" + products[0]["id"].toString() + "/images/" + 
                            products[0]["images"][0]["filename"].toString(),
                          category: products[0]["subCategory"]["category"],
                          numOfBrands: products[0]["quantity"],
                          press: () {},
                        ),
                    SpecialOfferCard(
                          image: serverLink + "products/" + products[1]["id"].toString() + "/images/" + 
                            products[1]["images"][0]["filename"].toString(),
                          category: products[1]["subCategory"]["category"],
                          numOfBrands: products[1]["quantity"],
                          press: () {},
                        ),
                    SpecialOfferCard(
                          image: serverLink + "products/" + products[2]["id"].toString() + "/images/" + 
                            products[2]["images"][0]["filename"].toString(),
                          category: products[2]["subCategory"]["category"],
                          numOfBrands: products[2]["quantity"],
                          press: () {},
                        ),                  
                  ],
                ),
                  ),                
              ],
            );
          }),
    );
  }
}

class SpecialOfferCard extends StatelessWidget {
  const SpecialOfferCard({
    Key key,
    @required this.category,
    @required this.image,
    @required this.numOfBrands,
    @required this.press,
  }) : super(key: key);

  final String category, image;
  final int numOfBrands;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: GestureDetector(
        onTap: press,
        child: SizedBox(
          width: getProportionateScreenWidth(242),
          height: getProportionateScreenWidth(100),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Stack(
              children: [
                Image(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF343434).withOpacity(0.4),
                        Color(0xFF343434).withOpacity(0.15),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: getProportionateScreenWidth(15.0),
                    vertical: getProportionateScreenWidth(10),
                  ),
                  child: Text.rich(
                    TextSpan(
                      style: TextStyle(color: Colors.white),
                      children: [
                        TextSpan(
                          text: "$category\n",
                          style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(text: "$numOfBrands Items")
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
