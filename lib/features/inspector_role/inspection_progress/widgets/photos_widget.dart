import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../../provider/inspector_progress_provider.dart';

class LabelPhotosWidget extends StatelessWidget {
  final InspectorProgressProvider provider;
  final int labelIndex;

  const LabelPhotosWidget({
    super.key,
    required this.provider,
    required this.labelIndex,
  });

  @override
  Widget build(BuildContext context) {
    final images = provider.inspectorList[labelIndex].images;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: AnimationLimiter(
        child: GridView.builder(
          itemCount: images!.length,
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final File? file = images[index];

            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: const Duration(milliseconds: 375),
              columnCount: 2,
              child: ScaleAnimation(
                child: GestureDetector(
                  onDoubleTap: () {
                    provider.removeImage(labelIndex, index);
                  },
                  onTap: () {
                    provider.pickedImage(
                      labelIndex: labelIndex,
                      imageIndex: index,
                    );
                  },
                  child: FadeInAnimation(
                    child: file == null
                        ? DottedBorder(
                            options: RectDottedBorderOptions(
                              dashPattern: [3, 2],
                              strokeWidth: 1,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add_a_photo_outlined,
                                size: 20.sp,
                              ),
                            ),
                          )
                        : Stack(
                            clipBehavior: Clip.none,

                            children: [
                              Image.file(
                                file,
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: double.infinity,
                              ),

                              Positioned(
                                top: -5.h,
                                right: -5.w,
                                child: GestureDetector(
                                  onTap: () {
                                    provider.removeImage(labelIndex, index);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black.withValues(
                                        alpha: 0.5,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: EdgeInsets.all(2.w),
                                    child: Icon(
                                      Icons.cancel_outlined,
                                      size: 16.sp,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


// import 'dart:io';

// import 'package:dotted_border/dotted_border.dart';
// import 'package:flutter/material.dart';

// import '../../../../provider/inspector_progress_provider.dart';

// class LabelPhotosWidget extends StatelessWidget {
//   final InspectorProgressProvider provider;
//   final int labelIndex;

//   const LabelPhotosWidget({
//     super.key,
//     required this.provider,
//     required this.labelIndex,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final images = provider.inspectorList[labelIndex].images;

//     return GridView.builder(
//       itemCount: images!.length, // ALWAYS 2
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2,
//         crossAxisSpacing: 10,
//         mainAxisSpacing: 10,
//       ),
//       itemBuilder: (context, index) {
//         final File? file = images[index];

//         return GestureDetector(
//           onTap: () {
//             provider.pickedImage(labelIndex: labelIndex, imageIndex: index);
//           },
//           child: file == null
//               ? 
//               DottedBorder(
//                   child: Text(
//                     'Rectangular Border',
//                     style: TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 )
//               //DottedBorder(
//                 //options: CircularDottedBorderOptions(

//               //  ),
//                 //  dashPattern: const [4, 3],
//                 //  child: const Center(child: Icon(Icons.add_a_photo_outlined)),
//             //    )
//               : Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     Image.file(
//                       file,
//                       fit: BoxFit.cover,
//                       width: double.infinity,
//                       height: double.infinity,
//                     ),
//                     Positioned(
//                       top: -6,
//                       right: -6,
//                       child: GestureDetector(
//                         onTap: () {
//                           provider.removeImage(labelIndex, index);
//                         },
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: Colors.black.withOpacity(0.6),
//                             shape: BoxShape.circle,
//                           ),
//                           padding: const EdgeInsets.all(4),
//                           child: const Icon(
//                             Icons.close,
//                             color: Colors.red,
//                             size: 14,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//         );
//       },
//     );
//   }
// }
