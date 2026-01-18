import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/theme.dart';
import '../core/mock_data.dart';
import '../core/responsive.dart';
import '../widgets/section_header.dart';
import '../widgets/furniture_card.dart';
import 'catalog_screen.dart';
import 'product_detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);
    final featuredItems = isDesktop 
        ? MockData.furnitureItems.take(4).toList() 
        : MockData.furnitureItems.take(2).toList(); // Show fewer on home for mobile to keep it tight

    return Scaffold(
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 1400),
          child: CustomScrollView(
            slivers: [
              // Show mobile app bar only if not desktop (desktop has its own in MainNav)
              if (!isDesktop)
                SliverAppBar(
                  floating: true,
                  backgroundColor: Colors.white,
                  title: Row(
              children: [
                Text(
                  "THE SPACE",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  " POETRY STUDIO",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w300, fontSize: 18),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: SpaceTheme.accentGold,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    "4.9 ★",
                    style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
                  actions: [
                    IconButton(icon: const Icon(Icons.search), onPressed: () {}),
                  ],
                ),

              // Hero Section
              SliverToBoxAdapter(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: isDesktop ? 500.0 : 300.0,
                        viewportFraction: 1.0,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentCarouselIndex = index;
                          });
                        },
                      ),
                      items: [1, 2, 3].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                    i == 1 ? 'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=2000&auto=format&fit=crop' :
                                    i == 2 ? 'https://images.unsplash.com/photo-1616486338812-3dadae4b4f9d?q=80&w=2000&auto=format&fit=crop' :
                                    'https://images.unsplash.com/photo-1616137466211-f939a420be84?q=80&w=2000&auto=format&fit=crop',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.transparent, Colors.black.withAlpha(180)],
                                  ),
                                ),
                                padding: EdgeInsets.symmetric(
                                  horizontal: isDesktop ? 100 : 24,
                                  vertical: isDesktop ? 80 : 40,
                                ),
                                alignment: Alignment.bottomLeft,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Luxurious & Functional",
                                      style: (isDesktop ? Theme.of(context).textTheme.displayLarge : Theme.of(context).textTheme.displaySmall)?.copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        height: 1.1,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Text(
                                      "Wooden Textures • Glass Railings • Greenery",
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                        color: SpaceTheme.accentGold,
                                        letterSpacing: 2,
                                      ),
                                    ),
                                    if (isDesktop) ...[
                                      const SizedBox(height: 32),
                                      SizedBox(
                                        width: 200,
                                        child: ElevatedButton(
                                           onPressed: () {},
                                           child: const Text("EXPLORE NOW"),
                                        ),
                                      )
                                    ]
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                    // Indicator
                    Padding(
                      padding: const EdgeInsets.only(bottom: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [0, 1, 2].map((entry) {
                          return Container(
                            width: isDesktop ? 12.0 : 8.0,
                            height: isDesktop ? 12.0 : 8.0,
                            margin: const EdgeInsets.symmetric(horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentCarouselIndex == entry
                                  ? SpaceTheme.accentGold
                                  : Colors.white.withAlpha(100),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),

              // Categories
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: isDesktop ? 40 : 20),
                  child: SizedBox(
                    height: 100,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 100 : 16),
                      itemCount: MockData.categories.length,
                      itemBuilder: (context, index) {
                        final cat = MockData.categories[index];
                        if (index == 0) return const SizedBox.shrink(); 
                        
                        return Container(
                          margin: EdgeInsets.only(right: isDesktop ? 40 : 16),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.grey.shade300),
                                ),
                                child: Icon(
                                  cat == "Living Room" ? Icons.chair :
                                  cat == "Bedroom" ? Icons.bed :
                                  cat == "Office" ? Icons.computer :
                                  cat == "Outdoor" ? Icons.deck :
                                  Icons.light,
                                  size: 24,
                                  color: SpaceTheme.primaryDark,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(cat, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              // About Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 100 : 24.0,
                vertical: 60,
              ),
              child: isDesktop 
                ? Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1618219908412-a29a1bb7b86e?q=80&w=1000&auto=format&fit=crop',
                            fit: BoxFit.cover,
                            height: 400,
                          ),
                        ),
                      ),
                      const SizedBox(width: 80),
                      Expanded(child: _buildAboutContent(context, true)),
                    ],
                  )
                : Column(
                    children: [
                      _buildAboutContent(context, false),
                      const SizedBox(height: 40),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1618219908412-a29a1bb7b86e?q=80&w=1000&auto=format&fit=crop',
                          fit: BoxFit.cover,
                          height: 300,
                          width: double.infinity,
                        ),
                      ),
                    ],
                  ),
            ),
          ),

          // Reviews Section
          SliverToBoxAdapter(
            child: Container(
              color: SpaceTheme.primaryDark,
              padding: const EdgeInsets.symmetric(vertical: 80),
              child: Column(
                children: [
                  Text(
                    "CLIENT STORIES",
                    style: GoogleFonts.montserrat(
                      color: SpaceTheme.accentGold,
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "What Our Clients Say",
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 48),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 100 : 20),
                      itemCount: MockData.reviews.length,
                      itemBuilder: (context, index) {
                        final review = MockData.reviews[index];
                        return Container(
                          width: isDesktop ? 400 : MediaQuery.of(context).size.width - 40,
                          margin: const EdgeInsets.only(right: 24),
                          padding: const EdgeInsets.all(32),
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(10),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: Colors.white.withAlpha(20)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: List.generate(5, (i) => Icon(
                                  Icons.star,
                                  size: 16,
                                  color: i < review.rating ? SpaceTheme.accentGold : Colors.white24,
                                )),
                              ),
                              const SizedBox(height: 24),
                              Expanded(
                                child: Text(
                                  '"${review.content}"',
                                  style: const TextStyle(color: Colors.white70, fontStyle: FontStyle.italic, height: 1.6),
                                ),
                              ),
                              const SizedBox(height: 24),
                              Text(
                                review.author,
                                style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),

              // Featured Section
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: isDesktop ? 80 : 0, vertical: 40),
                  child: SectionHeader(
                    title: "Featured Renders",
                    onSeeAll: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) => const CatalogScreen()));
                    },
                  ),
                ),
              ),

              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: isDesktop ? 100 : 24.0),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isDesktop ? 4 : 2,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 24,
                    mainAxisSpacing: 24,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final item = featuredItems[index];
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
                    childCount: featuredItems.length,
                  ),
                ),
              ),
              
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAboutContent(BuildContext context, bool isDesktop) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "ABOUT US",
          style: GoogleFonts.montserrat(
            color: SpaceTheme.accentGold,
            letterSpacing: 4,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          "Designing Dreams into Reality",
          style: Theme.of(context).textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 24),
        Text(
          "The Space Designers is an interior design firm based in Indore, specializing in residential and commercial projects. We focus on modern luxury using 3D visualization and turnkey solutions.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.8),
        ),
        const SizedBox(height: 16),
        Text(
          "Our projects emphasize minimalism, elegance, and functionality, featuring luxury bedrooms, modular kitchens, and stunning 3D elevations.",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.8),
        ),
        const SizedBox(height: 32),
        ElevatedButton(
          onPressed: () {},
          child: const Text("LEARN MORE"),
        ),
      ],
    );
  }
}
