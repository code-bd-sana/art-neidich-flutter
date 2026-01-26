import 'package:artneidich_app/helpers/toast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../common_widget/custom_button.dart';
import '../../../gen/assets.gen.dart';
import '../../../helpers/loading_helper.dart';
import '../../../networks/api_acess.dart';
import '../../../provider/multiple_image_provider.dart';

class MultipleImageScreen extends StatelessWidget {
  const MultipleImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MultipleImageProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.white, elevation: 0),
          body: Column(
            children: [
              const SizedBox(height: 30),

              ///  Pick Image
              InkWell(
                onTap: () {
                  provider.pickedIMage(imageSource: ImageSource.gallery);
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
                    if (provider.fileList.isNotEmpty) {
                      multipleImageRXObj
                          .multipleImageRX(images: provider.fileList)
                          .waitingForFuture()
                          .then((success) {
                            if (success) {
                              ToastUtil.showShortToast(
                                "Multiple Image Uploaded successsfully",
                              );
                            }
                          });
                    } else {
                      ToastUtil.showShortToast(
                        "Please select multiple images.",
                      );
                    }
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
