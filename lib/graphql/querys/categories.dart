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

String singleCategory = '''
query getCategory(\$id: Int!) {
  category(id: \$id) {
    id,
    category,
    products {
      id,
      name,
      price,
      images {
        id,
        filename,
      }
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

