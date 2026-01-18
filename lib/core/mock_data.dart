import '../models/furniture_item.dart';

class Review {
  final String author;
  final String content;
  final double rating;

  const Review({required this.author, required this.content, required this.rating});
}

class MockData {
  static const String firmName = "THE DESIGN POETRY STUDIO";
  static const String location = "Indore, Madhya Pradesh";
  static const String phone = "+91-6264549625";
  static const String email = "hello@thespacedesigner.in";
  static const String stats = "4.9/5 Rating | 28+ Clients";

  static const List<String> categories = [
    "All",
    "3D Elevation",
    "Living Room",
    "Modular Kitchen",
    "Bedrooms",
    "Commercial",
  ];

  static const List<Review> reviews = [
    Review(author: "Amit Sharma", content: "Professional approach and excellent 3D visualization. Highly recommend!", rating: 5.0),
    Review(author: "Priya Jain", content: "They transformed our modular kitchen beyond expectations. Delivery was timely.", rating: 4.8),
    Review(author: "Rahul V.", content: "Expert in front elevations. Innovative and luxury-focused design.", rating: 5.0),
  ];

  static const List<FurnitureItem> furnitureItems = [
    // Residential - 3D Elevation
    FurnitureItem(
      id: '1',
      title: 'Modern Urban Villa',
      category: '3D Elevation',
      description: 'Sophisticated exterior design with wooden textures, glass railings, and geometric facades.',
      price: 0, // Request Quote Focus
      imageUrl: 'https://images.unsplash.com/photo-1600210492486-724fe5c67fb0?q=80&w=1974&auto=format&fit=crop',
    ),
    FurnitureItem(
      id: '2',
      title: 'Luxury Master Bedroom',
      category: 'Bedrooms',
      description: 'Contemporary bedroom blending minimalism and elegance with custom premium storage.',
      price: 0,
      imageUrl: 'https://images.unsplash.com/photo-1616594039964-ae9021a400a0?q=80&w=2080&auto=format&fit=crop',
    ),
    FurnitureItem(
      id: '3',
      title: 'Italian Modular Kitchen',
      category: 'Modular Kitchen',
      description: 'Highly functional modular kitchen with premium finishes and ergonomic layout.',
      price: 0,
      imageUrl: 'https://images.unsplash.com/photo-1556911223-e4520288df81?q=80&w=1974&auto=format&fit=crop',
    ),
    FurnitureItem(
      id: '4',
      title: 'Corporate Office Lounge',
      category: 'Commercial',
      description: 'Modern commercial space designed for functionality and corporate branding.',
      price: 0,
      imageUrl: 'https://images.unsplash.com/photo-1497366216548-37526070297c?q=80&w=2069&auto=format&fit=crop',
    ),
     FurnitureItem(
      id: '5',
      title: 'Kids Creative Room',
      category: 'Bedrooms',
      description: 'Vibrant and functional kids room design with custom storage solutions.',
      price: 0,
      imageUrl: 'https://images.unsplash.com/photo-1616486701797-0f33f61038ec?q=80&w=2128&auto=format&fit=crop',
    ),
    FurnitureItem(
      id: '6',
      title: 'Luxe Living Area',
      category: 'Living Room',
      description: 'Minimalist living area with accent walls and wooden texture highlights.',
      price: 0,
      imageUrl: 'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?q=80&w=2000&auto=format&fit=crop',
    ),
  ];
}
