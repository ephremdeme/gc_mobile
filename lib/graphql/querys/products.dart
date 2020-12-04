String singleProduct = '''
  query getProduct(\$id: Int!) {
    product(id: \$id) {
      id,
      name,
      views,
      description,
      price,
      quantity,
      images {
        id,
        filename
      },
      rating {
        rating,
        count
      },
      category {
        id,
        category
      },
      seller {
        id,
        username
      },
      subCategory {
        id,
        category
      }
    }
  }
''';
