import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/features/inspection/presentation/inspection_screen.dart';
import 'package:artneidich_app/features/labels/presentation/labels_screen.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'features/jobs/presentation/jobs_screen.dart';
import 'features/overview/presentation/overview_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    OverviewScreen(),
    JobsScreen(),
    InspectionScreen(),
    LabelsScreen(),
  ];

  Widget _navImage(String path, bool active) {
    return Image.asset(
      path,
      height: 24,
      width: 24,
      color: active ? Color(0xFFFFFFFF) : Colors.grey, // optional tint
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: _pages),

      // BOTTOM NAV
      bottomNavigationBar: SafeArea(
        child: GNav(
          textStyle: TextFontStyle.headLine16c2D8D7CInterW700,
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() => _selectedIndex = index);
          },
        
          iconSize: 0, // hide default icon
          gap: 8,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 14.h),
          duration: const Duration(milliseconds: 350),
          tabBorderRadius: 16,
        
          color: Colors.grey,
        
          tabBackgroundColor: Color(0xFF2D8D7C),
        
          tabs: [
            GButton(
              icon: Icons.home,
              leading: _navImage(
                Assets.images.overview.path,
                _selectedIndex == 0,
              ),
              text: 'Overview',
            ),
            GButton(
              icon: Icons.favorite,
              leading: _navImage(Assets.images.jobs.path, _selectedIndex == 1),
              text: 'Jobs',
            ),
            GButton(
              icon: Icons.search,
              leading: _navImage(
                Assets.images.inspection.path,
                _selectedIndex == 2,
              ),
              text: 'Inspection',
            ),
            GButton(
              icon: Icons.person,
              leading: _navImage(Assets.images.label.path, _selectedIndex == 3),
              text: 'Labels',
            ),
          ],
        ),
      ),
    );
  }
}
