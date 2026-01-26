import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

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

    return GridView.builder(
      itemCount: images!.length, // ALWAYS 2
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final File? file = images[index];

        return GestureDetector(
          onTap: () {
            provider.pickedImage(labelIndex: labelIndex, imageIndex: index);
          },
          child: file == null
              ? 
              DottedBorder(
                  child: Text(
                    'Rectangular Border',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              //DottedBorder(
                //options: CircularDottedBorderOptions(

              //  ),
                //  dashPattern: const [4, 3],
                //  child: const Center(child: Icon(Icons.add_a_photo_outlined)),
            //    )
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
                      top: -6,
                      right: -6,
                      child: GestureDetector(
                        onTap: () {
                          provider.removeImage(labelIndex, index);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(4),
                          child: const Icon(
                            Icons.close,
                            color: Colors.red,
                            size: 14,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}
