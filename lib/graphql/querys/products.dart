String singleProduct = '''
  query getProduct(\$id: Int!) {
    product(id: \$id) {
      id,
      name,
      views,
      shortDescription,
      fullDescription,
      price,
      model,
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

String newProducts = ''' query NewProducts(\$limit: Int!, \$by_date: Boolean!){
  products(
    limit: \$limit,
    by_date: \$by_date
  ) {
    count,
    products {
      id,
      name,
      price,
      quantity,
      images{
        filename
      },
      subCategory {
        id,
        category
      }
    }
  }
}
''';
