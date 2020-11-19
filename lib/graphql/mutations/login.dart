String login = '''mutation Login(\$username: String!, \$password: String!){
  login(
    username: \$username,
    password: \$password
  )
  {
    id,
    token,
    User {
      username
      phone
      id
    }
  }
}''';

