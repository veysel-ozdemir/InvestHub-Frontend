enum AccountType {
  investor(name: "Investor Account"),
  studentCommunity(name: "Student Community Account"),
  individual(name: "Individual Account");

  final String name;
  const AccountType({required this.name});
}
