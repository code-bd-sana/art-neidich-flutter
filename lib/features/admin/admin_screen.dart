import 'package:artneidich_app/common_widget/header_widget.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../constants/text_font_style.dart';
import '../../helpers/ui_helpers.dart';
import '../../provider/admin_provider.dart';

class AdminScreen extends StatefulWidget {
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AdminProvider>().setFilters(
        approved: true,
        userRole: 1,
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
              subtitle: "Admin",
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
                  height: 0.55.sh,
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
                          ],

                          /// ROWS + PAGINATION LOADER
                          rows: List.generate(
                            provider.users.length +
                                (provider.isLoadMore ? 1 : 0),
                            (index) {
                              /// Loader Row
                              if (index == provider.users.length) {
                                return const DataRow2(
                                  cells: [
                                    DataCell(
                                      Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
                                    DataCell(SizedBox()),
                                  ],
                                );
                              }

                              final user = provider.users[index];

                              return DataRow2(
                                cells: [
                                  DataCell(
                                    Text("${user.firstName} ${user.lastName}"),
                                  ),
                                  DataCell(Text(user.email ?? "-")),
                                ],
                              );
                            },
                          ),
                        ),
                );
              },
            ),

            //   AdminDataTableWidget(),
            UIHelper.verticalSpaceExtraLarge,
          ],
        ),
      ),
    );
  }
}
