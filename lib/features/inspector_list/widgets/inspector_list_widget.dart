import 'package:artneidich_app/common_widget/custom_button.dart';
import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/navigation_service.dart';
import 'package:artneidich_app/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../model/inspector_list_model.dart';

class InspectorDataTableWidget extends StatefulWidget {
  const InspectorDataTableWidget({super.key});

  @override
  State<InspectorDataTableWidget> createState() =>
      _InspectorDataTableWidgetState();
}

class _InspectorDataTableWidgetState extends State<InspectorDataTableWidget> {
  final List<InspectorTableRowData> tableData = [
    InspectorTableRowData(
      name: "Jon",
      email: "jon@gmail.com",
      action: 'Remove',
    ),
    InspectorTableRowData(
      name: "Jon Doe",
      email: "doe@gmail.com",
      action: 'Remove',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DataTable(
        border: TableBorder.all(color: Color(0xFFEFEFF1)),
        dataRowMinHeight: 36,

        headingRowColor: WidgetStateColor.resolveWith((_) {
          return Color(0xFFFAF7F8);
        }),
        headingTextStyle: TextFontStyle.headLine16c141414InterW400,

        columns: [
          DataColumn(
            label: Text(
              "Name",
              style: TextFontStyle.headLine14c323539InterW400,
            ),
          ),
          DataColumn(
            label: Text(
              "Email",
              style: TextFontStyle.headLine14c323539InterW400,
            ),
          ),
          DataColumn(
            label: Text(
              "Action",
              style: TextFontStyle.headLine14c323539InterW400,
            ),
          ),
        ],

        rows: tableData.map((item) {
          return DataRow(
            cells: [
              DataCell(
                Text(
                  item.name,
                  style: TextFontStyle.headLine14c323539InterW400,
                ),
              ),
              DataCell(
                Text(
                  item.email,
                  style: TextFontStyle.headLine14c323539InterW400,
                ),
              ),
              DataCell(
                InkWell(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (_) {
                        return AlertDialog(
                          title: Text(
                            "Confirmation",
                            style: TextFontStyle.headLine16c2D8D7CInterW700
                                .copyWith(color: Colors.black),
                          ),
                          content: Text("Are you sure you want to continue?"),

                          actions: [
                            CustomButton(
                              onPressed: () {
                                NavigationService.goBack;
                              },
                              style: TextFontStyle.headLine14c323539InterW400,

                              text: "Cancel",
                              color: Colors.white,
                              borderSide: BorderSide(color: Colors.blueGrey),
                            ),

                            UIHelper.verticalSpace(10.h),
                            CustomButton(
                              onPressed: () {
                                NavigationService.goBack;
                              },
                              color: Colors.red,
                              text: "Delete",
                            ),
                          ],
                        );
                      },
                    );
                  },

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    spacing: 12.w,
                    children: [
                      Text(
                        item.action,
                        style: TextFontStyle.headLine14c323539InterW400
                            .copyWith(color: Color(0xFFC8322B)),
                      ),
                      Image.asset(
                        Assets.icons.frame8.path,
                        width: 16.w,
                        height: 16.h,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
