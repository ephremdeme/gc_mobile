class Rate {
  final double rating;
  final int count;

  Rate({this.rating, this.count});

  factory Rate.fromJson(Map<String, dynamic> data) {
    return Rate(
      rating: data['rating'],
      count: data['count']
    );
  }
}
