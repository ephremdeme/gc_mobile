String rate = ''' query Rate(\$ProductId: Int!) {
  rating(ProductId: \$ProductId) {
    rating,
    count
  }
}
''';
