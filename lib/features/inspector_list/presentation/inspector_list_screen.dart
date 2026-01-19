import 'package:artneidich_app/common_widget/header_widget.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/loading_helper.dart';
import 'package:artneidich_app/networks/api_acess.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../common_widget/custom_button.dart';
import '../../../constants/text_font_style.dart';
import '../../../helpers/ui_helpers.dart';
import '../../../provider/admin_provider.dart';

class InspectorListScreen extends StatefulWidget {
  const InspectorListScreen({super.key});

  @override
  State<InspectorListScreen> createState() => _InspectorListScreenState();
}

class _InspectorListScreenState extends State<InspectorListScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AdminProvider>().setFilters(
        approved: true,
        userRole: 2,
        suspended: false,
      );
    });
  }

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

            //
            Consumer<AdminProvider>(
              builder: (context, provider, child) {
                if (provider.isLoading && provider.users.isEmpty) {
                  return const Center(
                    child: CircularProgressIndicator(color: Color(0xFF2D8D7C)),
                  );
                }

                return SizedBox(
                  height: 0.70.sh,
                  child: provider.users.isEmpty
                      ? const Center(child: Text("No Data Found"))
                      : DataTable2(
                          headingRowColor: WidgetStateProperty.all(
                            const Color(0xFFFAF7F8),
                          ),
                          headingTextStyle:
                              TextFontStyle.headLine16c141414InterW400,
                          dataRowColor: WidgetStateProperty.all(Colors.white),
                          border: TableBorder.all(
                            color: const Color(0xFFEFEFF1),
                          ),
                          scrollController: provider.scrollController,
                          columnSpacing: 20,
                          horizontalMargin: 16,
                          dataRowHeight: 56,
                          headingRowHeight: 56,
                          minWidth: MediaQuery.sizeOf(context).width,

                          /// FIXED COLUMNS
                          columns: [
                            DataColumn2(
                              size: ColumnSize.L,
                              label: Text(
                                "Name",
                                style: TextFontStyle.headLine16c141414InterW400,
                              ),
                            ),
                            DataColumn2(
                              size: ColumnSize.L,
                              label: Text(
                                "Email",
                                style: TextFontStyle.headLine16c141414InterW400,
                              ),
                            ),

                            DataColumn2(
                              size: ColumnSize.S,
                              label: Text(
                                "Email",
                                style: TextFontStyle.headLine16c141414InterW400,
                              ),
                            ),
                          ],

                          /// ROWS + PAGINATION LOADER
                          rows: List.generate(provider.users.length + (provider.isLoadMore ? 1 : 0), (
                            index,
                          ) {
                            /// Loader Row
                            if (index == provider.users.length) {
                              return const DataRow2(
                                cells: [
                                  DataCell(
                                    Center(child: CircularProgressIndicator()),
                                  ),
                                  DataCell(SizedBox()),
                                ],
                              );
                            }

                            final user = provider.users[index];

                            return DataRow2(
                              cells: [
                                DataCell(
                                  Text(
                                    "${user.firstName} ${user.lastName}",
                                    style: TextFontStyle
                                        .headLine14c323539InterW400,
                                  ),
                                ),
                                DataCell(
                                  Text(
                                    user.email ?? "-",
                                    style: TextFontStyle
                                        .headLine14c323539InterW400,
                                  ),
                                ),
                                DataCell(
                                  InkWell(
                                    onTap: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return AlertDialog(
                                            title: Text(
                                              "Confirmation",
                                              style: TextFontStyle
                                                  .headLine16c2D8D7CInterW700
                                                  .copyWith(
                                                    color: Colors.black,
                                                  ),
                                            ),
                                            content: Text(
                                              "Are you sure you want to continue?",
                                            ),

                                            actions: [
                                              CustomButton(
                                                onPressed: () {
                                                  Navigator.pop(dialogContext);
                                                },
                                                style: TextFontStyle
                                                    .headLine14c323539InterW400,

                                                text: "Cancel",
                                                color: Colors.white,
                                                borderSide: BorderSide(
                                                  color: Colors.blueGrey,
                                                ),
                                              ),

                                              UIHelper.verticalSpace(10.h),
                                              CustomButton(
                                                onPressed: () {
                                                  // suspendUser
                                                  Navigator.pop(dialogContext);

                                                  (user.isSuspended ?? false)
                                                      ? suspendRxObj
                                                            .suspendRx(
                                                              id: user.id!,
                                                            )
                                                            .waitingForFuture()
                                                            .then((success) {
                                                              if (success) {
                                                                context
                                                                    .read<
                                                                      AdminProvider
                                                                    >()
                                                                    .setFilters(
                                                                      approved:
                                                                          true,
                                                                      userRole:
                                                                          2,
                                                                      suspended:
                                                                          false,
                                                                    );
                                                              }
                                                            })
                                                      : unSuspendRxObj
                                                            .unSuspendRx(
                                                              id: user.id!,
                                                            )
                                                            .waitingForFuture()
                                                            .then((success) {
                                                              if (success) {
                                                                context
                                                                    .read<
                                                                      AdminProvider
                                                                    >()
                                                                    .setFilters(
                                                                      approved:
                                                                          true,
                                                                      userRole:
                                                                          2,
                                                                      suspended:
                                                                          false,
                                                                    );
                                                              }
                                                            });
                                                },
                                                color: Colors.red,
                                                text:
                                                    (user.isSuspended ?? false)
                                                    ? "Suspend"
                                                    : "UnSuspend",
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      (user.isSuspended ?? false)
                                          ? "Suspend"
                                          : "UnSuspend",

                                      style: TextFontStyle
                                          .headLine14c323539InterW400
                                          .copyWith(color: Color(0xFFC8322B)),
                                    ),
                                  ),
                                  // InkWell(
                                  //   onTap: () async {
                                  //     await showDialog(
                                  //       context: context,
                                  //       builder: (_) {
                                  //         return AlertDialog(
                                  //           title: Text(
                                  //             "Confirmation",
                                  //             style: TextFontStyle
                                  //                 .headLine16c2D8D7CInterW700
                                  //                 .copyWith(
                                  //                   color: Colors.black,
                                  //                 ),
                                  //           ),
                                  //           content: Text(
                                  //             "Are you sure you want to continue?",
                                  //           ),

                                  //           actions: [
                                  //             CustomButton(
                                  //               onPressed: () {
                                  //                 NavigationService.goBack;
                                  //               },
                                  //               style: TextFontStyle
                                  //                   .headLine14c323539InterW400,

                                  //               text: "Cancel",
                                  //               color: Colors.white,
                                  //               borderSide: BorderSide(
                                  //                 color: Colors.blueGrey,
                                  //               ),
                                  //             ),

                                  //             UIHelper.verticalSpace(10.h),
                                  //             CustomButton(
                                  //               onPressed: () {
                                  //                 NavigationService.goBack;
                                  //               },
                                  //               color: Colors.red,
                                  //               text: "Delete",
                                  //             ),
                                  //           ],
                                  //         );
                                  //       },
                                  //     );
                                  //   },

                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.start,
                                  //     spacing: 12.w,
                                  //     children: [
                                  //       Text(
                                  //         "Suspend",
                                  //         style: TextFontStyle
                                  //             .headLine14c323539InterW400
                                  //             .copyWith(
                                  //               color: Color(0xFFC8322B),
                                  //             ),
                                  //       ),
                                  //       Image.asset(
                                  //         Assets.icons.frame8.path,
                                  //         width: 16.w,
                                  //         height: 16.h,
                                  //         fit: BoxFit.cover,
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ),
                              ],
                            );
                          }),
                        ),
                );
              },
            ),

            //  InspectorDataTableWidget(),
            UIHelper.verticalSpaceExtraLarge,
          ],
        ),
      ),
    );
  }
}
