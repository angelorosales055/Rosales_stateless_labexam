import 'package:flutter/material.dart';

/// Shopping Cart Page for Campus Store.
/// Implemented entirely using [StatelessWidget] with an elegant monochrome theme.
class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});

  // Monochrome Color Palette
  static const Color primaryBlack = Color(0xFF18181B); // Zinc 900
  static const Color darkCharcoal = Color(0xFF27272A); // Zinc 800
  static const Color mutedText = Color(0xFF71717A); // Zinc 500
  static const Color lightGreyBg = Color(0xFFF4F4F5); // Zinc 100
  static const Color borderColor = Color(0xFFE4E4E7); // Zinc 200
  static const Color scaffoldBg = Color(0xFFFAFAFA); // Neutral surface

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldBg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryBlack),
          onPressed: () {
            debugPrint('Back clicked');
          },
          tooltip: 'Back',
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: primaryBlack,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: -0.3,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {
              debugPrint('Cart clicked');
            },
            tooltip: 'Shopping Cart',
            icon: Stack(
              clipBehavior: Clip.none,
              children: [
                const Icon(
                  Icons.shopping_bag_outlined,
                  color: primaryBlack,
                  size: 26,
                ),
                Positioned(
                  right: -4,
                  top: -4,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: primaryBlack,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 16,
                      minHeight: 16,
                    ),
                    child: const Center(
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 2. Introduction Section
              _buildIntroductionSection(),
              const SizedBox(height: 16),

              // 3. Delivery Information Card
              _buildDeliveryCard(),
              const SizedBox(height: 20),

              // 4. Order Items Header
              _buildOrderItemsHeader(),
              const SizedBox(height: 10),

              // Product Cards using reusable CartItemCard
              const CartItemCard(
                productName: 'Wireless Mouse',
                price: 'PHP 450.00',
                quantity: 1,
                icon: Icons.mouse_outlined,
              ),
              const SizedBox(height: 12),
              const CartItemCard(
                productName: 'USB-C Hub',
                price: 'PHP 850.00',
                quantity: 1,
                icon: Icons.developer_board_outlined,
              ),
              const SizedBox(height: 12),
              const CartItemCard(
                productName: 'Laptop Stand',
                price: 'PHP 700.00',
                quantity: 1,
                icon: Icons.laptop_chromebook_outlined,
              ),
              const SizedBox(height: 16),

              // 5. Discount Banner
              _buildDiscountBanner(),
              const SizedBox(height: 16),

              // 6. Payment Summary
              _buildPaymentSummaryCard(),
              const SizedBox(height: 16),

              // 7. Place Order Button
              _buildPlaceOrderButton(),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  /// Introduction Section: Monochrome Tag, Heading, and Subheading
  Widget _buildIntroductionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
          decoration: BoxDecoration(
            color: lightGreyBg,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: borderColor),
          ),
          child: const Text(
            'CAMPUS STORE',
            style: TextStyle(
              color: primaryBlack,
              fontSize: 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.6,
            ),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Ready for checkout',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: primaryBlack,
            letterSpacing: -0.5,
          ),
        ),
        const SizedBox(height: 4),
        const Text(
          'Review your items before placing your order.',
          style: TextStyle(
            fontSize: 13,
            color: mutedText,
          ),
        ),
      ],
    );
  }

  /// Delivery Information Card
  Widget _buildDeliveryCard() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: lightGreyBg,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.location_on,
              color: primaryBlack,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Deliver to Angelo Rosales',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: primaryBlack,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Matina, Davao City',
                  style: TextStyle(
                    fontSize: 12,
                    color: mutedText,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () {
              debugPrint('Change delivery address clicked');
            },
            style: TextButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              'Change',
              style: TextStyle(
                color: primaryBlack,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Order Items Header Row
  Widget _buildOrderItemsHeader() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Order Items',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: primaryBlack,
          ),
        ),
        Text(
          '3 items',
          style: TextStyle(
            fontSize: 13,
            color: mutedText,
          ),
        ),
      ],
    );
  }

  /// Discount Banner (Monochrome styling)
  Widget _buildDiscountBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: lightGreyBg,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: const Row(
        children: [
          Icon(
            Icons.local_offer_outlined,
            color: primaryBlack,
            size: 22,
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'STUDENT10 applied',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: primaryBlack,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  '10% discount on items',
                  style: TextStyle(
                    fontSize: 12,
                    color: mutedText,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.check_circle,
            color: primaryBlack,
            size: 22,
          ),
        ],
      ),
    );
  }

  /// Payment Summary Card
  Widget _buildPaymentSummaryCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Payment Summary',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: primaryBlack,
            ),
          ),
          const SizedBox(height: 12),
          _buildSummaryRow(label: 'Subtotal', amount: 'PHP 2,000.00'),
          const SizedBox(height: 8),
          _buildSummaryRow(
            label: 'Discount (10%)',
            amount: '− PHP 200.00',
          ),
          const SizedBox(height: 8),
          _buildSummaryRow(label: 'Delivery Fee', amount: 'PHP 50.00'),
          const Divider(
            height: 24,
            thickness: 1,
            color: borderColor,
          ),
          _buildSummaryRow(
            label: 'Total',
            amount: 'PHP 1,850.00',
            isTotal: true,
          ),
        ],
      ),
    );
  }

  /// Helper row for Payment Summary items
  Widget _buildSummaryRow({
    required String label,
    required String amount,
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 15 : 13,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            color: isTotal ? primaryBlack : mutedText,
          ),
        ),
        Text(
          amount,
          style: TextStyle(
            fontSize: isTotal ? 15 : 13,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w500,
            color: primaryBlack,
          ),
        ),
      ],
    );
  }

  /// Full-width Monochrome Place Order Button
  Widget _buildPlaceOrderButton() {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () {
          debugPrint('Place order clicked! Total: PHP 1850.00');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryBlack,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.lock, size: 18, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Place Order',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Reusable Stateless Card for individual Cart Items with Monochrome Styling
class CartItemCard extends StatelessWidget {
  final String productName;
  final String price;
  final int quantity;
  final IconData icon;

  const CartItemCard({
    super.key,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ShoppingCartPage.borderColor),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Icon inside monochrome container
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: ShoppingCartPage.lightGreyBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: ShoppingCartPage.primaryBlack,
              size: 28,
            ),
          ),
          const SizedBox(width: 12),

          // Product Name, Price, and Quantity Controls
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: ShoppingCartPage.primaryBlack,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  price,
                  style: const TextStyle(
                    color: ShoppingCartPage.darkCharcoal,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    _buildQtyButton(
                      icon: Icons.remove,
                      onTap: () {
                        debugPrint('Decrease quantity: $productName');
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        '$quantity',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          color: ShoppingCartPage.primaryBlack,
                        ),
                      ),
                    ),
                    _buildQtyButton(
                      icon: Icons.add,
                      onTap: () {
                        debugPrint('Increase quantity: $productName');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Delete IconButton
          IconButton(
            onPressed: () {
              debugPrint('Remove item: $productName');
            },
            tooltip: 'Remove',
            icon: const Icon(
              Icons.delete_outline,
              color: Color(0xFFA1A1AA),
              size: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQtyButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(6),
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFFD4D4D8), // Zinc 300
            width: 1.2,
          ),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 14,
            color: ShoppingCartPage.primaryBlack,
          ),
        ),
      ),
    );
  }
}
