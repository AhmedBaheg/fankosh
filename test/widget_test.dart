import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fankosh/main.dart';

void main() {
  testWidgets('App launches smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());
    await tester.pump();

    // Verify that the MaterialApp is mounted
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
