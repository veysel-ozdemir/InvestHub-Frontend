import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:investhub/app/investhub_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: InvestHubApp(),
    ),
  );
}
