String login = '''mutation Login(\$phone: String!, \$password: String!){
  login(
    phone: \$phone,
    password: \$password
  )
  {
    id,
    token,
    User{
      phone
      id
    } 
  }
}''';

