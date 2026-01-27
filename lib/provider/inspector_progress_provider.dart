import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

import '../features/inspector_role/camera_setting/camea_screen.dart';
import '../features/inspector_role/inspection_progress/model/inspector_label_model.dart';
import '../helpers/navigation_service.dart';
import '../helpers/toast.dart';

class InspectorProgressProvider extends ChangeNotifier {
  // Camera Mode Settings
  final controller = ValueNotifier<bool>(false);
  bool isCamera = false;

  // GetStorage instance
  final _storage = GetStorage();
  static const String _cameraModeKey = 'camera_portrait_mode';

  InspectorProgressProvider() {
    _loadCameraMode();
    // Listen to controller changes
    controller.addListener(_onControllerChanged);
  }

  void _onControllerChanged() {
    // Sync controller value with isCamera
    if (isCamera != controller.value) {
      isCamera = controller.value;
      _saveCameraMode(isCamera);
      notifyListeners();
      debugPrint('Camera mode changed: $isCamera');
    }
  }

  /// Load camera mode from storage
  void _loadCameraMode() {
    try {
      isCamera = _storage.read(_cameraModeKey) ?? false;
      controller.value = isCamera;
      debugPrint('Loaded camera mode: $isCamera');
      notifyListeners();
    } catch (e) {
      isCamera = false;
      controller.value = false;
    }
  }

  /// Save camera mode to storage
  void _saveCameraMode(bool value) {
    try {
      _storage.write(_cameraModeKey, value);
      debugPrint('Saved camera mode: $value');
    } catch (e) {
      ToastUtil.showShortToast("Failed to save settings");
    }
  }

  void toggleUpdateCamera(bool value) {
    debugPrint('Toggle called with value: $value');
    controller.value = value;
    isCamera = value;
    _saveCameraMode(value);
    notifyListeners();
  }

  ////
  List<InspectorLabelModel> inspectorList = [];

  /// Create label with 2 empty image slots
  void createLabel({required String labelID, required String labelName}) {
    inspectorList.add(
      InspectorLabelModel(
        labelID: labelID,
        labelName: labelName,
        images: List<File?>.filled(2, null),
      ),
    );
    notifyListeners();
  }

  /// Pick image for specific label & slot
  Future<void> pickedImage({
    required int labelIndex,
    required int imageIndex,
    required ImageSource imageSource,
  }) async {
    try {
      debugPrint('Picking image with camera mode: $isCamera');

      if (imageSource == ImageSource.camera) {
        // Use custom camera screen with orientation based on isCamera toggle
        final File? file = await Navigator.push(
          NavigationService.navigatorKey.currentContext!,
          MaterialPageRoute(
            builder: (context) => CustomCameraScreen(
              isPortraitMode: isCamera, // Pass the toggle value
            ),
          ),
        );

        if (file != null) {
          inspectorList[labelIndex].images![imageIndex] = file;
          notifyListeners();
        } else {
          ToastUtil.showShortToast("You haven't selected any image");
        }
      } else {
        // Use image picker for gallery
        final picker = ImagePicker();
        final XFile? file = await picker.pickImage(source: imageSource);

        if (file != null) {
          inspectorList[labelIndex].images![imageIndex] = File(file.path);
          notifyListeners();
        } else {
          ToastUtil.showShortToast("You haven't selected any image");
        }
      }
    } catch (e) {
      debugPrint('Error picking image: $e');
      ToastUtil.showShortToast("Error picking image");
    }
  }

  /// Remove image
  void removeImage(int labelIndex, int imageIndex) {
    inspectorList[labelIndex].images![imageIndex] = null;
    notifyListeners();
  }

  /// Remove label
  void removeLabel(int index) {
    inspectorList.removeAt(index);
    notifyListeners();
  }

  bool hasAnyImage() {
    return inspectorList.any(
      (label) =>
          label.images != null && label.images!.any((img) => img != null),
    );
  }

  bool allLabelsEmpty() {
    return inspectorList.isNotEmpty &&
        inspectorList.every(
          (label) =>
              label.images == null || label.images!.every((img) => img == null),
        );
  }

  /// Check if every label has at least one image
  bool everyLabelHasAtLeastOneImage() {
    if (inspectorList.isEmpty) return false;

    return inspectorList.every(
      (label) =>
          label.images != null && label.images!.any((img) => img != null),
    );
  }

  // Clear all
  void clearAllData() {
    inspectorList.clear();
    notifyListeners();
  }

  // Clear camera settings (optional)
  void clearCameraSettings() {
    _storage.remove(_cameraModeKey);
    isCamera = false;
    controller.value = false;
    notifyListeners();
  }

  @override
  void dispose() {
    controller.removeListener(_onControllerChanged);
    controller.dispose();
    super.dispose();
  }
}
