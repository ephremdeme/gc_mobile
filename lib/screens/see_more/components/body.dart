import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/graphql/mutations/comment.dart';
// import 'package:flutter_native_interaction/graphql/mutations/rate.dart';
import 'package:flutter_native_interaction/graphql/querys/comments.dart';
// import 'package:flutter_native_interaction/providers/rate.dart';
import 'package:flutter_native_interaction/screens/sign_in/sign_in_screen.dart';
import 'package:flutter_native_interaction/size_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:provider/provider.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_native_interaction/graphQLConf.dart';

class Body extends StatefulWidget {
  final int id;
  final List<dynamic> images;
  final String description;
  Body({Key key, this.id, this.images, this.description}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      child: Center(
        child: SingleChildScrollView(

          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ClipRRect(
                borderRadius:
                    BorderRadius.circular(getProportionateScreenWidth(20)),
                child: Image(
                    image: NetworkImage(serverLink +
                        "products/" +
                        widget.id.toString() +
                        "/images/" +
                        widget.images[0]["filename"]))),
            SizedBox(
              height: getProportionateScreenWidth(15),
            ),
            Text(
              widget.description,
            ),
            SizedBox(
              height: getProportionateScreenWidth(15),
            ),
            Mutation(
              options: MutationOptions(
                  documentNode: gql(createComment),
                  update: (Cache cache, QueryResult result) {
                    return cache;
                  },
                  onCompleted: (dynamic resultData) async {
                    setState(() {});
                    if (resultData == null) {
                      // Navigator.popAndPushNamed(context, SignInScreen.routeName);

                    }
                  },
                  onError: (OperationException exception) {
                    print(exception.toString());
                    Navigator.popAndPushNamed(context, SignInScreen.routeName);
                  }),
              builder: (RunMutation runMutation, QueryResult result) {
                return TextField(
                  onSubmitted: (String submittedComment) {
                    if (submittedComment != null || submittedComment != " ") {
                      runMutation({
                        "comment": submittedComment,
                        "productId": widget.id,
                        "rating": 1
                      });
                    }
                  },
                  decoration: InputDecoration(hintText: "Write comment"),
                );
              },
            ),

            SizedBox(
              height: getProportionateScreenWidth(15),
            ),

            //////////////////// Comments
            Query(
              options: QueryOptions(
                documentNode: gql(comments),
                variables: {
                  'productId': widget.id,
                  'limit': 30,
                },
                pollInterval: 2,
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
                List<dynamic> comments = result.data["comments"]["comments"];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 5),
                      child: Text(
                        'Comments',
                        style: TextStyle(
                          fontSize: getProportionateScreenWidth(18),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: ListView.builder(
                          physics: ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            if (index < comments.length) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(
                                        getProportionateScreenHeight(30)),
                                    topRight: Radius.circular(
                                        getProportionateScreenHeight(40)),
                                    bottomLeft: Radius.circular(
                                        getProportionateScreenHeight(30)),
                                  ),
                                  child: ListTile(
                                    tileColor: Colors.blueAccent[100],
                                    title: Text(comments[index]["comment"]),
                                    leading: Text(comments[index]["user"]["username"]),
                                  ),
                                ),
                              );
                            }
                          }),
                    ),
                  ],
                );
              },
            ),

            SizedBox(
              height: getProportionateScreenWidth(15),
            ),
          ]),
        ),
      ),
    );
  }
}

// List<String> _comments = [];

// Widget _buildCommentList(List<String> comments) {
//   return ListView.builder(itemBuilder: (context, index) {
//     if (index < comments.length) {
//       return _buildCommentItem(comments[index]);
//     }
//     return null;
//   });
// }

// Widget _buildCommentItem(String comment) {
//   return Padding(
//     padding: EdgeInsets.all(getProportionateScreenHeight(10)),
//     child: ClipRRect(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(getProportionateScreenHeight(30)),
//         topRight: Radius.circular(getProportionateScreenHeight(40)),
//         bottomLeft: Radius.circular(getProportionateScreenHeight(30)),
//       ),
//       child: ListTile(
//         tileColor: Colors.blueAccent[100],
//         title: Text(comment),
//       ),
//     ),
//   );
// }

///////////////// Rating
// Mutation(
//     options: MutationOptions(
//       documentNode: gql(rate),
//       update: (Cache cache, QueryResult result) {
//         return cache;
//       },
//       onCompleted: (dynamic resultData) async {
//         if (resultData != null) {
//           rating.setRating(resultData["rate"]["rating"].toDouble());
//           check = 1;
//           print(rating.rating);
//         }
//       },
//       onError: (OperationException exception) {
//         Navigator.popAndPushNamed(
//           context,
//           SignInScreen.routeName,
//           arguments: exception.graphqlErrors,
//         );
//         print(exception.toString());
//       },
//     ),
//     builder: (
//       RunMutation runMutation,
//       QueryResult result,
//     ) {
//       return Align(
//         alignment: Alignment.center,
//         child: SmoothStarRating(
//           allowHalfRating: false,
//           onRated: (value) {
//             runMutation(
//                 {"rating": value.toDouble(), "ProductId": widget.id});
//           },
//           size: getProportionateScreenWidth(40),
//           halfFilledIconData: Icons.star_half,
//           color: Colors.orange[400],
//           borderColor: Colors.blue,
//         ),
//       );
//     }),

// SizedBox(
//   height: getProportionateScreenWidth(15),
// ),
