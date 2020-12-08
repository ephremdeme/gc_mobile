String comments = ''' query Comments(\$productId: Int!, \$limit: Int) {
  comments(
    productId: \$productId,
    limit: \$limit
  )
  {
    count,
    comments {
      id,
      comment,
      user {
        username
      }
    }
  }
}
''';


