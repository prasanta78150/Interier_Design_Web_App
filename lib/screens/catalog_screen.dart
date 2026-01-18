import 'package:flutter/material.dart';
import '../models/furniture_item.dart';
import '../core/mock_data.dart';
import '../core/theme.dart';
import '../core/responsive.dart';
import '../widgets/furniture_card.dart';
import 'product_detail_screen.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({super.key});

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  String _selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);

    List<FurnitureItem> displayedItems = _selectedCategory == "All"
        ? MockData.furnitureItems
        : MockData.furnitureItems.where((i) => i.category == _selectedCategory).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: isDesktop ? null : AppBar(title: const Text("Catalog")),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: Column(
            children: [
              // Filter Chips
              Container(
                height: 80,
                padding: EdgeInsets.symmetric(horizontal: isDesktop ? 100 : 16, vertical: 20),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: MockData.categories.length,
                  itemBuilder: (context, index) {
                    final cat = MockData.categories[index];
                    final isSelected = _selectedCategory == cat;
                    return Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: FilterChip(
                        label: Text(cat),
                        selected: isSelected,
                        selectedColor: SpaceTheme.accentGold,
                        checkmarkColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : SpaceTheme.primaryDark,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                        onSelected: (bool selected) {
                          setState(() {
                            _selectedCategory = cat;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              
              // Grid
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(
                    horizontal: isDesktop ? 100 : 16,
                    vertical: 20,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isDesktop ? 4 : (MediaQuery.of(context).size.width > 600 ? 3 : 2),
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                  ),
                  itemCount: displayedItems.length,
                  itemBuilder: (context, index) {
                    final item = displayedItems[index];
                    return FurnitureCard(
                      item: item,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(item: item),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
