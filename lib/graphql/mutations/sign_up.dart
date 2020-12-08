String signUp = '''mutation SignUp(\$username: String!, \$password: String!, \$phone: String!, \$first_name: String!, \$last_name: String!){
  createUser(
    username: \$username,
    password: \$password,
    phone: \$phone,
    first_name: \$first_name,
    last_name: \$last_name,
  )
  {
    id,
    token,
    User{
      username
      phone
      id
    }
  }
}''';
