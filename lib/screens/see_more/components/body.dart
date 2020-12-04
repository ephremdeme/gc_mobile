import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/size_config.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_native_interaction/graphQLConf.dart';


class Body extends StatefulWidget {
  final int id;
  final List<dynamic> images;
  Body({Key key, this.id, this.images}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      // widget.id.toString() + " "+ widget.images[0]["filename"].toString()
      padding: EdgeInsets.all(getProportionateScreenWidth(10)),
      child: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(getProportionateScreenWidth(20)),
              child: Image(
                image: NetworkImage(serverLink + "products/"
                    +widget.id.toString()+"/images/"+ widget.images[0]["filename"])
              )
            )
          ]
        ),
      ),
    );
  }
}
