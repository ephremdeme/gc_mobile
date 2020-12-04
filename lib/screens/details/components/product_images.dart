import 'package:flutter/material.dart';
import 'package:flutter_native_interaction/graphQLConf.dart';


import '../../../constants.dart';
import '../../../size_config.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({
    Key key,
    this.id,
    @required this.images,
  }) : super(key: key);

  final List<dynamic> images;
  final int id;

  @override
  _ProductImagesState createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  int selectedImage = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(238),
            child: AspectRatio(
              aspectRatio: 1,
              child: Hero(
                tag: "2", // widget.product.id.toString(),
                child: Image(
                  image: NetworkImage(serverLink + "products/" +
                      widget.id.toString() +
                      "/images/" +
                      widget.images[selectedImage]["filename"]),
                ),
              ),
            ),
          ),
          // SizedBox(height: getProportionateScreenWidth(20)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(widget.images.length,
                  (index) => buildSmallProductPreview(index)),
            ],
          )
        ],
      ),
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = index;
        });
      },
      child: AnimatedContainer(
        duration: defaultDuration,
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: getProportionateScreenWidth(48),
        width: getProportionateScreenWidth(48),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
        ),
        child: Image(
          image: NetworkImage(serverLink + "products/" +
              widget.id.toString() +
              "/images/" +
              widget.images[selectedImage]["filename"]),
        ),
      ),
    );
  }
}
