import 'package:artneidich_app/common_widget/header_widget.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../../helpers/ui_helpers.dart';
import '../widgets/inspector_list_widget.dart';

class InspectorListScreen extends StatefulWidget {
  const InspectorListScreen({super.key});

  @override
  State<InspectorListScreen> createState() => _InspectorListScreenState();
}

class _InspectorListScreenState extends State<InspectorListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderWidget(
              title: "Settings",
              icon: Assets.icons.profile.path,
              subtitle: "Inspector List",
            ),

            InspectorDataTableWidget(),
            UIHelper.verticalSpaceExtraLarge,
          ],
        ),
      ),
    );
  }
}
