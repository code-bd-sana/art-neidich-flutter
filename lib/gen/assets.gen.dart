/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Frame (1).png
  AssetGenImage get frame1 => const AssetGenImage('assets/icons/Frame (1).png');

  /// File path: assets/icons/Frame (2).png
  AssetGenImage get frame2 => const AssetGenImage('assets/icons/Frame (2).png');

  /// File path: assets/icons/Frame (4).png
  AssetGenImage get frame4 => const AssetGenImage('assets/icons/Frame (4).png');

  /// File path: assets/icons/Frame (5).png
  AssetGenImage get frame5 => const AssetGenImage('assets/icons/Frame (5).png');

  /// File path: assets/icons/Frame (6).png
  AssetGenImage get frame6 => const AssetGenImage('assets/icons/Frame (6).png');

  /// File path: assets/icons/Frame (7).png
  AssetGenImage get frame7 => const AssetGenImage('assets/icons/Frame (7).png');

  /// File path: assets/icons/Frame (8).png
  AssetGenImage get frame8 => const AssetGenImage('assets/icons/Frame (8).png');

  /// File path: assets/icons/Frame.svg
  String get frame => 'assets/icons/Frame.svg';

  /// File path: assets/icons/arrow_right.png
  AssetGenImage get arrowRight =>
      const AssetGenImage('assets/icons/arrow_right.png');

  /// File path: assets/icons/download.png
  AssetGenImage get download =>
      const AssetGenImage('assets/icons/download.png');

  /// File path: assets/icons/eye_off.svg
  String get eyeOff => 'assets/icons/eye_off.svg';

  /// File path: assets/icons/eye_on.svg
  String get eyeOn => 'assets/icons/eye_on.svg';

  /// File path: assets/icons/filter.png
  AssetGenImage get filter => const AssetGenImage('assets/icons/filter.png');

  /// File path: assets/icons/profile.png
  AssetGenImage get profile => const AssetGenImage('assets/icons/profile.png');

  /// File path: assets/icons/right_arrow.png
  AssetGenImage get rightArrow =>
      const AssetGenImage('assets/icons/right_arrow.png');

  /// File path: assets/icons/search.png
  AssetGenImage get search => const AssetGenImage('assets/icons/search.png');

  /// List of all assets
  List<dynamic> get values => [
        frame1,
        frame2,
        frame4,
        frame5,
        frame6,
        frame7,
        frame8,
        frame,
        arrowRight,
        download,
        eyeOff,
        eyeOn,
        filter,
        profile,
        rightArrow,
        search
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/Frame (4).png
  AssetGenImage get frame4 =>
      const AssetGenImage('assets/images/Frame (4).png');

  /// File path: assets/images/Frame (5).png
  AssetGenImage get frame5 =>
      const AssetGenImage('assets/images/Frame (5).png');

  /// File path: assets/images/Vector.png
  AssetGenImage get vector => const AssetGenImage('assets/images/Vector.png');

  /// File path: assets/images/create_job.png
  AssetGenImage get createJob =>
      const AssetGenImage('assets/images/create_job.png');

  /// File path: assets/images/email.png
  AssetGenImage get email => const AssetGenImage('assets/images/email.png');

  /// File path: assets/images/inspection.png
  AssetGenImage get inspection =>
      const AssetGenImage('assets/images/inspection.png');

  /// File path: assets/images/jobs.png
  AssetGenImage get jobs => const AssetGenImage('assets/images/jobs.png');

  /// File path: assets/images/jobs_icon.png
  AssetGenImage get jobsIcon =>
      const AssetGenImage('assets/images/jobs_icon.png');

  /// File path: assets/images/label.png
  AssetGenImage get label => const AssetGenImage('assets/images/label.png');

  /// File path: assets/images/no_image_available.png
  AssetGenImage get noImageAvailable =>
      const AssetGenImage('assets/images/no_image_available.png');

  /// File path: assets/images/overview.png
  AssetGenImage get overview =>
      const AssetGenImage('assets/images/overview.png');

  /// File path: assets/images/photos.png
  AssetGenImage get photos => const AssetGenImage('assets/images/photos.png');

  /// File path: assets/images/report.png
  AssetGenImage get report => const AssetGenImage('assets/images/report.png');

  /// File path: assets/images/search_icon.png
  AssetGenImage get searchIcon =>
      const AssetGenImage('assets/images/search_icon.png');

  /// File path: assets/images/summary.png
  AssetGenImage get summary => const AssetGenImage('assets/images/summary.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        frame4,
        frame5,
        vector,
        createJob,
        email,
        inspection,
        jobs,
        jobsIcon,
        label,
        noImageAvailable,
        overview,
        photos,
        report,
        searchIcon,
        summary
      ];
}

class $AssetsLottieGen {
  const $AssetsLottieGen();

  /// File path: assets/lottie/Wede_Animation.json
  String get wedeAnimation => 'assets/lottie/Wede_Animation.json';

  /// File path: assets/lottie/hamburger.json
  String get hamburger => 'assets/lottie/hamburger.json';

  /// File path: assets/lottie/image_shimmer.json
  String get imageShimmer => 'assets/lottie/image_shimmer.json';

  /// File path: assets/lottie/loading.json
  String get loading => 'assets/lottie/loading.json';

  /// File path: assets/lottie/remove_from_cart.json
  String get removeFromCart => 'assets/lottie/remove_from_cart.json';

  /// File path: assets/lottie/success.json
  String get success => 'assets/lottie/success.json';

  /// List of all assets
  List<String> get values => [
        wedeAnimation,
        hamburger,
        imageShimmer,
        loading,
        removeFromCart,
        success
      ];
}

class Assets {
  Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $AssetsLottieGen lottie = $AssetsLottieGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
