class User {
  final String name;
  final String email;
  final double? monthlyIncome;
  final double? yearlyIncome;

  User(
      {required this.name,
      required this.email,
      this.monthlyIncome,
      this.yearlyIncome});
}
