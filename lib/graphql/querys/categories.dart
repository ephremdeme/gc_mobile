String readCategories = '''
  query getCategories {
    categories {
  	id,
    category,
    products {
      name,
    },
    subProducts {
      name,
    },
    SubCategory {
      category
    }
  }
}
''';
