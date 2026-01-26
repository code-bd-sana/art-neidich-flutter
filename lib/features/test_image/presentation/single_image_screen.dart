import 'package:artneidich_app/common_widget/custom_button.dart';
import 'package:artneidich_app/constants/text_font_style.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/helpers/loading_helper.dart';
import 'package:artneidich_app/helpers/toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../networks/api_acess.dart';
import '../../../provider/single_image_provider.dart';

class SingleImageScreen extends StatelessWidget {
  const SingleImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SingleImageProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(
              "Single Image",
              style: TextFontStyle.headLine28c3D3D3DInterW700,
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 30,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    provider.singleImagePicked();
                  },
                  child: ClipOval(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: provider.file != null
                          ? Image.file(
                              provider.file!,
                              fit: BoxFit.cover,
                              width: 200,
                              height: 200,
                            )
                          : Image.asset(
                              Assets.images.avatar.path,
                              fit: BoxFit.cover,
                              width: 200,
                              height: 200,
                            ),
                    ),
                  ),
                ),

                CustomButton(
                  onPressed: () async {
                    if (provider.file != null) {
                      final response = await singleImageRXObj
                          .singleImageRX(image: provider.file!)
                          .waitingForFuture();

                      if (response) {
                        ToastUtil.showShortToast("Image Uploaded Successfully");
                      }
                    } else {
                      ToastUtil.showShortToast("Please upload an Image");
                    }
                  },
                  text: "Upload Image",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
