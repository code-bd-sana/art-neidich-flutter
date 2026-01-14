import 'package:flutter/material.dart';

class DataTableScreen extends StatefulWidget {
  const DataTableScreen({super.key});

  @override
  State<DataTableScreen> createState() => _DataTableScreenState();
}

class _DataTableScreenState extends State<DataTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0),

      // body part
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
