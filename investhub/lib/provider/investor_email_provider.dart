import 'package:flutter_riverpod/flutter_riverpod.dart';

class InvestorEmailNotifier extends Notifier<String> {
  InvestorEmailNotifier() : super("");
  void updateEmail(String newEmail) {
    state = newEmail;
  }
}

class Notifier<T> extends StateNotifier<T> {
  Notifier(T state) : super(state);
}

final investorEmailProvider =
    StateNotifierProvider<InvestorEmailNotifier, String>(
  (ref) => InvestorEmailNotifier(),
);
