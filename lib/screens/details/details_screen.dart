import 'package:flutter/material.dart';
// import 'package:flutter_native_interaction/providers/rate.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:provider/provider.dart';

import 'components/body.dart';
import 'components/custom_app_bar.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/details";

  @override
  Widget build(BuildContext context) {
    final int id = ModalRoute.of(context).settings.arguments;
    // final rate = Provider.of<RateProvider>(context, listen: false);
    
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(id: id),
      body: Body(id: id),
    );
  }
}
