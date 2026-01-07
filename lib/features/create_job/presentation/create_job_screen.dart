import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common_widget/job_create_header.dart';
import '../widgets/create_job_widget1.dart';
import '../widgets/create_job_widget2.dart';
import '../widgets/create_job_widget3.dart';

class CreateJobScreen extends StatefulWidget {
  const CreateJobScreen({super.key});

  @override
  State<CreateJobScreen> createState() => _CreateJobScreenState();
}

class _CreateJobScreenState extends State<CreateJobScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          JobCreateHeaderWidget(
            title: "Jobs",
            icon: Assets.images.createJob.path,
            subtitle: "Create New Job",
            onPressed: () {
              previousPage();
            },
          ),

          UIHelper.verticalSpace(20.h),

          Expanded(
            child: PageView(
              controller: _pageController,
              physics: NeverScrollableScrollPhysics(), // disable swipe
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              children: [
                CreateJobWidget1(nextScreen: nextPage),
                CreateJobWidget2(),
                CreateJobWidget3(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
