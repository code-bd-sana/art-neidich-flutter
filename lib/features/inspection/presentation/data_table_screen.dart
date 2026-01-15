import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/inspection_provider.dart';

class DataTableScreen extends StatefulWidget {
  const DataTableScreen({super.key});

  @override
  State<DataTableScreen> createState() => _DataTableScreenState();
}

class _DataTableScreenState extends State<DataTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<InspectionProvider>(
      builder: (context, provider, child) {
        //  Initial loading (center)
        if (provider.datum.isEmpty && provider.isLoading) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Color(0xFF2D8D7C)),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text("Jobs"),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: DataTable2(
            scrollController: provider.scrollController,
         //   minWidth: 400,
            columns: provider.dataColumeList
                .map((e) => DataColumn(label: Text(e)))
                .toList(),
            rows: List.generate(
              provider.datum.length +
                  (provider.isLoading || !provider.hasMore ? 1 : 0),
              (index) {
                // Bottom Loader
                if (index == provider.datum.length &&
                    provider.isLoading &&
                    provider.hasMore) {
                  return _bottomLoader(provider);
                }

                //  No more data
                if (index == provider.datum.length && !provider.hasMore) {
                  return _noMoreData(provider);
                }

                final item = provider.datum[index];
                return DataRow(
                  cells: [
                    DataCell(Text(item.feeStatus ?? "-")),
                    DataCell(Text(item.developmentName ?? "-")),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }

  // Loader Row
  DataRow _bottomLoader(InspectionProvider provider) {
    return DataRow(
      cells: List.generate(
        provider.dataColumeList.length,
        (i) => i == 0
            ? const DataCell(
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: CircularProgressIndicator(color: Color(0xFF2D8D7C)),
                  ),
                ),
              )
            : const DataCell(SizedBox()),
      ),
    );
  }

  // No more data Row
  DataRow _noMoreData(InspectionProvider provider) {
    return DataRow(
      cells: List.generate(
        provider.dataColumeList.length,
        (i) => i == 0
            ? const DataCell(
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "No more data available",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
            : const DataCell(SizedBox()),
      ),
    );
  }
}



















// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:provider/provider.dart';

// import '../../../provider/inspection_provider.dart';

// class DataTableScreen extends StatefulWidget {
//   const DataTableScreen({super.key});

//   @override
//   State<DataTableScreen> createState() => _DataTableScreenState();
// }

// class _DataTableScreenState extends State<DataTableScreen> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context.read<InspectionProvider>().fetchAllJob();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Consumer<InspectionProvider>(
//         builder: (context, inspectionProvider, child) {
//           return SafeArea(
//             child: Column(
//               children: [
//                 Expanded(
//                   child: ListView.builder(
//                     controller: inspectionProvider.scrollController,
//                     itemCount: inspectionProvider.datum.length + 1,
//                     itemBuilder: (context, index) {
//                       if (index < inspectionProvider.datum.length) {
//                         return ListTile(
//                           title: Container(
//                             decoration: BoxDecoration(


//                               border: Border.all(color: Colors.red),
//                             ),
//                             height: 100.h,
//                             child: Text(
//                               inspectionProvider.datum[index].developmentName ??
//                                   "",
//                             ),
//                           ),
//                         );
//                       } else {
//                         // Show loader at the bottom
//                         return inspectionProvider.isLoading
//                             ? Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Center(
//                                   child: CircularProgressIndicator(),
//                                 ),
//                               )
//                             : SizedBox.shrink();
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
