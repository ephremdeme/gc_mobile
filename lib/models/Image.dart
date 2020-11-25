class Image {
  int id;
  String filename;

  Image({this.id, this.filename});

  factory Image.fromJson(Map<String, dynamic> data) {
    return Image(id: data['id'], filename: data['filename']);
  }
}

// pass the images array values to this constructor to get
// each image filename and id 