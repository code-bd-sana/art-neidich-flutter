import 'package:artneidich_app/common_widget/header_widget.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../../common_widget/create_job.dart';
import '../../../helpers/all_routes.dart';
import '../../../helpers/navigation_service.dart';

class LabelsScreen extends StatefulWidget {
  const LabelsScreen({super.key});

  @override
  State<LabelsScreen> createState() => _LabelsScreenState();
}

class _LabelsScreenState extends State<LabelsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderWidget(
              title: "Labels",
              icon: Assets.icons.label.path,
              subtitle: "Total Labels",
            ),
          ],
        ),
      ),

      floatingActionButton: CreateJob(
        heroTag: "new_label_tag",
        title: 'Create new Label',
        onpressed: () {
          NavigationService.navigateTo(Routes.createLabelScreen);
        },
      ),
    );
  }
}
