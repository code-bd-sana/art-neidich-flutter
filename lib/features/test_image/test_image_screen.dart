import 'package:artneidich_app/common_widget/custom_button.dart';
import 'package:artneidich_app/gen/assets.gen.dart';
import 'package:artneidich_app/provider/test_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class TestImageScreen extends StatelessWidget {
  const TestImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TestImageProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(backgroundColor: Colors.white, elevation: 0),

          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 30,
            children: [
              Center(
                child: InkWell(
                  onTap: () {
                    provider.pickedIMage(imageSource: ImageSource.camera);
                  },
                  child: ClipOval(
                    child: SizedBox(
                      width: 200,
                      height: 200,
                      child: provider.file != null
                          ? Image.file(provider.file!, fit: BoxFit.cover)
                          : Image.asset(
                              Assets.images.avatar.path,
                              fit: BoxFit.cover,
                            ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: CustomButton(onPressed: () {
                  
                }, text: "Upload Here"),
              ),
            ],
          ),
        );
      },
    );
  }
}
