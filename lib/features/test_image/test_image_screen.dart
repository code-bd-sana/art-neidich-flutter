import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../common_widget/custom_button.dart';
import '../../gen/assets.gen.dart';
import '../../provider/test_image_provider.dart';

class TestImageScreen extends StatelessWidget {
  const TestImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TestImageProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
          body: Column(
            children: [
              const SizedBox(height: 30),

              ///  Pick Image
              InkWell(
                onTap: () {
                  provider.pickedIMage(imageSource: ImageSource.camera);
                },
                child: ClipOval(
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: provider.latestFile != null
                        ? Image.file(provider.latestFile!, fit: BoxFit.cover)
                        : Image.asset(
                            Assets.images.avatar.path,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              /// Image Grid
              Expanded(
                child: provider.fileList.isEmpty
                    ? const Center(child: Text("No images selected"))
                    : GridView.builder(
                        padding: const EdgeInsets.all(12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                        itemCount: provider.fileList.length,
                        itemBuilder: (context, index) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.file(
                              provider.fileList[index],
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(
                  onPressed: () {
                    log(
                      "Length ================== ${provider.fileList.length}",
                    );

                    final docs = provider.fileList
                        .map((e) => log("IMages ========= $e"))
                        .toList();

                    log(docs.toString());

                    // createReportRxObj
                    //     .createJobRx(images: provider.fileList)
                    //     .waitingForFuture()
                    //     .then((success) {
                    //       if (success) {
                    //         log("Image Uploaded successsfully");
                    //       }
                    //     });
                  },
                  text: "Upload Here",
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}
