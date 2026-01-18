import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'main_nav.dart';

void main() {
  runApp(const SpaceDesignerApp());
}

class SpaceDesignerApp extends StatelessWidget {
  const SpaceDesignerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Space Designer',
      debugShowCheckedModeBanner: false,
      theme: SpaceTheme.lightTheme,
      home: const MainNav(),
    );
  }
}
