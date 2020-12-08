String rate = ''' mutation Rate(\$rating: Int!, \$ProductId: Int!) {
  rate(
    rating: \$rating,
    ProductId: \$ProductId
  )
  {
    rating,
    count
  }
}
''';
