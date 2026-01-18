import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/catalog_screen.dart';
import 'screens/contact_screen.dart';
import 'core/theme.dart';
import 'core/responsive.dart';
import 'package:url_launcher/url_launcher.dart';

class MainNav extends StatefulWidget {
  const MainNav({super.key});

  @override
  State<MainNav> createState() => _MainNavState();
}

class _MainNavState extends State<MainNav> {
  int _currentIndex = 0;
  
  final List<Widget> _screens = const [
    HomeScreen(),
    CatalogScreen(),
    ContactScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    bool isDesktop = Responsive.isDesktop(context);

    Future<void> openWhatsApp() async {
      final Uri whatsappUri = Uri.parse(
          'https://wa.me/917815084902?text=Hello%20I%20need%20support'
      );

      if (await canLaunchUrl(whatsappUri)) {
        await launchUrl(
          whatsappUri,
          mode: LaunchMode.externalApplication,
        );
      } else {
        throw 'Could not open WhatsApp';
      }
    }
    return Stack(
      children: [
        Scaffold(
          appBar: isDesktop ? _buildDesktopHeader() : null,
          body: _screens[_currentIndex],
          bottomNavigationBar: !isDesktop ? NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            backgroundColor: Colors.white,
            indicatorColor: SpaceTheme.accentGold.withAlpha(100),
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home_outlined),
                selectedIcon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.grid_view),
                selectedIcon: Icon(Icons.grid_view_rounded),
                label: 'Catalog',
              ),
               NavigationDestination(
                icon: Icon(Icons.mail_outline),
                selectedIcon: Icon(Icons.mail),
                label: 'Contact',
              ),
            ],
          ) : null,
        ),
        Positioned(
          bottom: !isDesktop ? 100 : 110,
          right: 20,
          child: IconButton(
            onPressed: openWhatsApp,
            icon: Image.asset(
              'assets/icons/whatsapp_logo.png',
              width: 54,
              height: 54,
              fit: BoxFit.cover,
            ),
            style: IconButton.styleFrom(
              // backgroundColor: SpaceTheme.accentGold,
              foregroundColor: Colors.white,

              padding: const EdgeInsets.all(16),
              elevation: 8,
            ),
          ),
        ),
      ],
    );

  }

  PreferredSizeWidget _buildDesktopHeader() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      title: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          children: [
            Text(
              "THE DESIGN",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
            ),
            Text(
              " POETRY STUDIO",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w300,
                letterSpacing: 2,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: SpaceTheme.accentGold,
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                "4.9 ★",
                style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
            const Spacer(),
            _navItem("Home", 0),
            const SizedBox(width: 30),
            _navItem("Catalog", 1),
            const SizedBox(width: 30),
            _navItem("Contact", 2),
            const SizedBox(width: 40),
            ElevatedButton(
              onPressed: () {
                setState(() => _currentIndex = 2);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: SpaceTheme.accentGold,
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              ),
              child: const Text("GET A QUOTE"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem(String title, int index) {
    bool isActive = _currentIndex == index;
    return InkWell(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isActive ? SpaceTheme.accentGold : SpaceTheme.primaryDark,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          if (isActive)
            Container(
              margin: const EdgeInsets.only(top: 4),
              height: 2,
              width: 20,
              color: SpaceTheme.accentGold,
            )
        ],
      ),
    );
  }
}
