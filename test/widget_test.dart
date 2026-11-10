import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stateless_lab_exam/main.dart';
import 'package:stateless_lab_exam/shopping_cart_page.dart';

void main() {
  testWidgets('ShoppingCartPage renders all required sections and handles callbacks',
      (WidgetTester tester) async {
    // Set a phone screen size so everything renders cleanly
    tester.view.physicalSize = const Size(400, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // 1. Verify AppBar
    expect(find.text('My Cart'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
    expect(find.text('3'), findsNWidgets(2)); // Badge '3' and '3 items'

    // 2. Verify Introduction Section
    expect(find.text('CAMPUS STORE'), findsOneWidget);
    expect(find.text('Ready for checkout'), findsOneWidget);
    expect(find.text('Review your items before placing your order.'), findsOneWidget);

    // 3. Verify Delivery Information Card
    expect(find.text('Deliver to Angelo Rosales'), findsOneWidget);
    expect(find.text('Matina, Davao City'), findsOneWidget);
    expect(find.text('Change'), findsOneWidget);

    // 4. Verify Order Items & Product Cards
    expect(find.text('Order Items'), findsOneWidget);
    expect(find.text('Wireless Mouse'), findsOneWidget);
    expect(find.text('PHP 450.00'), findsOneWidget);
    expect(find.text('USB-C Hub'), findsOneWidget);
    expect(find.text('PHP 850.00'), findsOneWidget);
    expect(find.text('Laptop Stand'), findsOneWidget);
    expect(find.text('PHP 700.00'), findsOneWidget);

    // Verify reusable CartItemCard is used 3 times
    expect(find.byType(CartItemCard), findsNWidgets(3));

    // 5. Verify Discount Banner
    expect(find.text('STUDENT10 applied'), findsOneWidget);
    expect(find.text('10% discount on items'), findsOneWidget);
    expect(find.byIcon(Icons.check_circle), findsOneWidget);

    // 6. Verify Payment Summary
    expect(find.text('Payment Summary'), findsOneWidget);
    expect(find.text('Subtotal'), findsOneWidget);
    expect(find.text('PHP 2,000.00'), findsOneWidget);
    expect(find.text('Discount (10%)'), findsOneWidget);
    expect(find.text('− PHP 200.00'), findsOneWidget);
    expect(find.text('Delivery Fee'), findsOneWidget);
    expect(find.text('PHP 50.00'), findsOneWidget);
    expect(find.text('Total'), findsOneWidget);
    expect(find.text('PHP 1,850.00'), findsOneWidget);

    // 7. Verify Place Order Button
    expect(find.text('Place Order'), findsOneWidget);
    expect(find.byIcon(Icons.lock), findsOneWidget);

    // Test button taps to verify no exceptions and callbacks execute
    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
    await tester.tap(find.text('Change'));

    // Tap increase, decrease, delete on first item
    await tester.tap(find.byIcon(Icons.add).first);
    await tester.tap(find.byIcon(Icons.remove).first);
    await tester.tap(find.byIcon(Icons.delete_outline).first);

    // Tap Place Order button
    await tester.ensureVisible(find.text('Place Order'));
    await tester.tap(find.text('Place Order'));
    await tester.pump();
  });
}
