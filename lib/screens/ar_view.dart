import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ArPage extends StatefulWidget {
  ArPage({Key key, this.title}) : super(key: key);

  final String title;
  static String routeName = "/Ar_page";
  
  @override
  _ArPageState createState() => _ArPageState();
}

class _ArPageState extends State<ArPage> {
  static const platform = const MethodChannel('arcore');
  
  // String _message = "No messages yet...";

  void initState() {
    // _getMessage().then((String message) {
    //   setState(() {
    //     _message = message;
    //   });
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView(
          children: <Widget> [
            ListTile(
              title: Text('AR example'),
            ),
            RaisedButton(
              child: Text('Open AR'),
              onPressed: (){
                _openAr();
              },
            )
          ],
        )
    );
  }

  Future<String> _openAr() async {
    String value;
    try{
      value = await platform.invokeMethod('getMessage');
    } catch(err) {
      print(err);
    }
    return value;
  }

// Future<String> _getMessage() async {
//   var sendMap = <String, dynamic> {
//     'from': 'Ermiyas'
//   };
//
//   String value;
//   try{
//     value = await platform.invokeMethod('getMessage', sendMap);
//   } catch(err) {
//     print(err);
//   }
//   return value;
// }
}
