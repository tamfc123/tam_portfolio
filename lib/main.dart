import 'package:flutter/material.dart';
import 'package:tam_portfolio/core/core.dart';
import 'package:tam_portfolio/features/features.dart';
import 'package:tam_portfolio/features/home/home_portfolio_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tam Portfolio',
      debugShowCheckedModeBanner: false,
      
      // Modern Dark Theme (Primary)
      theme: AppTheme.modernDarkTheme,
      
      home: const HomePortfolioPage(),
    );
  }
}

// Legacy: Kept for reference if needed
// class PortfolioHomePage extends StatefulWidget {
//   final VoidCallback onThemeToggle;
//
//   const PortfolioHomePage({super.key, required this.onThemeToggle});
//
//   @override
//   State<PortfolioHomePage> createState() => _PortfolioHomePageState();
// }
//
// class _PortfolioHomePageState extends State<PortfolioHomePage> {
//   int _selectedIndex = 0;
//
//   final List<Widget> _pages = const [
//     HomePage(),
//     ProjectsPage(),
//     AboutPage(),
//     ContactPage(),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Tam Portfolio'),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.brightness_4),
//             onPressed: widget.onThemeToggle,
//             tooltip: 'Toggle Theme',
//           ),
//         ],
//       ),
//       body: _pages[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.work),
//             label: 'Projects',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'About',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.email),
//             label: 'Contact',
//           ),
//         ],
//       ),
//     );
//   }
// }
