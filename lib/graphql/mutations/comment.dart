String createComment = ''' mutation NewComment(\$comment: String!, \$productId: Int!, \$rating: Int!){
  createComment(
    comment: \$comment,
    productId: \$productId,
    rating: \$rating
  )
  {
    id,
    comment,
    user {
      id,
      username
    }
  }
}
''';
