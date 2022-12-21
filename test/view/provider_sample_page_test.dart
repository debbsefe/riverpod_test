import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverpod_test/view/provider_sample_page.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(
      child: MaterialApp(
        home: ProviderSamplePage(
          title: '',
        ),
      ),
    ));

    // Verify that our counter starts at 1.
    expect(find.text('1'), findsOneWidget);
  });
}
