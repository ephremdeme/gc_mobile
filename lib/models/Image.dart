class Image {
  final int id;
  final String filename;

  Image({this.id, this.filename});

  factory Image.fromJson(Map<String, dynamic> data) {
    return Image(id: data['id'], filename: data['filename']);
  }
}
