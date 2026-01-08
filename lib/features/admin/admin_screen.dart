import 'package:artneidich_app/common_widget/header_widget.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../helpers/ui_helpers.dart';
import 'widgets/admin_widget.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
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
              subtitle: "Admin",
            ),

            AdminDataTableWidget(),
            UIHelper.verticalSpaceExtraLarge,
          ],
        ),
      ),
    );
  }
}
