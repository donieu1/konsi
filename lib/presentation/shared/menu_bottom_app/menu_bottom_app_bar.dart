import 'package:desafio/presentation/maps_screen/maps_screen.dart';
import 'package:desafio/presentation/my_saved_addresses/my_saved_addresses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  int _selectedIndex = 0;
  late PageController _pageController;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          MapsScreen(),
          MySavedAddresses(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          _buildBottomNavigationBarItem(0, 'assets/icon/maps.svg', 'Mapa'),
          _buildBottomNavigationBarItem(
              1, 'assets/icon/books.svg', 'Caderneta'),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem(
      int index, String assetName, String label) {
    return BottomNavigationBarItem(
      icon: GestureDetector(
        onTap: () {
          _onItemTapped(index);
        },
        child: Container(
          width: 100,
          decoration: BoxDecoration(
            color: _selectedIndex == index
                ? const Color.fromARGB(59, 46, 136, 150)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            assetName,
            height: 30,
            color: _selectedIndex == index
                ? Theme.of(context).primaryColor
                : Colors.grey,
          ),
        ),
      ),
      label: label,
    );
  }
}
