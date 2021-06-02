class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  //named arguments(dart will bind the name of argument with name of variable)(igual names)
  Transaction(
      {required this.id,
      required this.title,
      required this.amount,
      required this.date});
}
