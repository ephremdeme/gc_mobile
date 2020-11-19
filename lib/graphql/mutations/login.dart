String login = '''mutation Login(\$username: String!, \$password: String!){
  login(
    username: \$username,
    password: \$password
  )
  {
    token
  }
}''';

