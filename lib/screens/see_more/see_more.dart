import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/screens/details/components/custom_app_bar.dart';

import 'components/body.dart';


class SeeMore extends StatelessWidget {
  static String routeName = "/see_more";

  @override
  Widget build(BuildContext context) {
    final List data =  ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color(0xFFF5F6F9),
      appBar: CustomAppBar(rating: 4.5), 
      body: Body(id: data[0], images: data[1]),
    );
  }
}
