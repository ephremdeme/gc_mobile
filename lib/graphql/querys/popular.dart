String popular = ''' query Popular(\$limit: Int!) {
  popularProducts(limit: \$limit) {
    products {
      id,
      price,
      name,
      images {
        id,
        filename
      },
    }    
  }
}
''';
