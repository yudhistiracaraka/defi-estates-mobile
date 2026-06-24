import 'package:defi_estates_mobile/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  final TestWidgetsFlutterBinding binding =
      TestWidgetsFlutterBinding.ensureInitialized();

  Future<void> pumpAtSize(WidgetTester tester, {required Size size}) async {
    addTearDown(() async {
      await binding.setSurfaceSize(null);
    });
    await binding.setSurfaceSize(size);
    await tester.pumpWidget(const ProviderScope(child: DefiEstatesApp()));
    await tester.pump(const Duration(milliseconds: 1000));
  }

  testWidgets('renders shell on small phone', (WidgetTester tester) async {
    await pumpAtSize(tester, size: const Size(320, 568));

    expect(find.text('DeFi Estates'), findsWidgets);
    expect(find.text('Explore Properties'), findsOneWidget);
    expect(find.text('Connect'), findsOneWidget);
  });

  testWidgets('renders shell on large phone', (WidgetTester tester) async {
    await pumpAtSize(tester, size: const Size(430, 932));

    expect(find.text('DeFi Estates'), findsWidgets);
    expect(find.text('Featured Properties'), findsOneWidget);
  });

  testWidgets('renders shell on tablet landscape', (WidgetTester tester) async {
    await pumpAtSize(tester, size: const Size(1024, 768));

    expect(find.text('DeFi Estates'), findsWidgets);
    expect(find.text('How It Works'), findsOneWidget);
  });

  testWidgets('renders shell on phone landscape', (WidgetTester tester) async {
    await pumpAtSize(tester, size: const Size(932, 430));

    expect(find.text('DeFi Estates'), findsWidgets);
    expect(find.text('Explore Properties'), findsOneWidget);
  });
}
