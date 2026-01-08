import 'package:artneidich_app/common_widget/header_widget.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:flutter/material.dart';

import '../../../helpers/ui_helpers.dart';
import '../widgets/approval_list_widget.dart';

class ApprovalListScreen extends StatefulWidget {
  const ApprovalListScreen({super.key});

  @override
  State<ApprovalListScreen> createState() => _ApprovalListScreenState();
}

class _ApprovalListScreenState extends State<ApprovalListScreen> {
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
              subtitle: "Approval List",
            ),

            ApprovalListDataTableWidget(),
            UIHelper.verticalSpaceExtraLarge,
          ],
        ),
      ),
    );
  }
}
