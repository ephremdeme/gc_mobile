String checkOut = ''' mutation checkOut(\$orders: OrderInput!){
  createOrder(orders: \$orders) {
    message,
    code,
    order {
      id,
      status,
      confirmation_num
    }
  }
}
''';
