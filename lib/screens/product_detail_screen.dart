import 'package:flutter/material.dart';
import '../models/furniture_item.dart';
import '../core/theme.dart';
import '../core/responsive.dart';
import '../widgets/custom_button.dart';

class ProductDetailScreen extends StatelessWidget {
  final FurnitureItem item;

  const ProductDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);

    if (isDesktop) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text(item.title)),
        body: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 1200),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // image
                Expanded(
                  flex: 3,
                  child: Hero(
                    tag: 'item_${item.id}',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        item.imageUrl,
                        fit: BoxFit.cover,
                        height: 600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 80),
                // details
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.category.toUpperCase(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: SpaceTheme.accentGold,
                          letterSpacing: 2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        item.title,
                        style: Theme.of(context).textTheme.displayMedium?.copyWith(fontSize: 40),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'Premium Turnkey Solution',
                        style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: SpaceTheme.accentGold,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 40),
                      Text(
                        "Description",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        item.description,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.8),
                      ),
                      const SizedBox(height: 40),
                      const Divider(),
                      const SizedBox(height: 40),
                      CustomButton(
                        text: "CONSULT NOW",
                        isFullWidth: true,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 20),
                      CustomButton(
                        text: "ADD TO WISHLIST",
                        isOutlined: true,
                        isFullWidth: true,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    // Mobile Layout (Original)
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 400,
            pinned: true,
            backgroundColor: Colors.white,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'item_${item.id}',
                child: Image.network(
                  item.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white.withAlpha(200),
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, color: SpaceTheme.primaryDark),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(24.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Text(
                  item.category,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: SpaceTheme.accentGold),
                ),
                Text(
                  item.title,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Expert 3D Visualization',
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: SpaceTheme.accentGold,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 24),
                Text(
                  "Description",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  item.description,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
                ),
                const SizedBox(height: 100),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(12),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: CustomButton(
          text: "Consult Now",
          onPressed: () {},
        ),
      ),
    );
  }
}
