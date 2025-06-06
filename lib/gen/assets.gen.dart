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

  /// File path: assets/icons/drawer.svg
  String get drawer => 'assets/icons/drawer.svg';

  /// File path: assets/icons/expand_arrow.svg
  String get expandArrow => 'assets/icons/expand_arrow.svg';

  /// File path: assets/icons/profile.svg
  String get profile => 'assets/icons/profile.svg';

  /// File path: assets/icons/ring.svg
  String get ring => 'assets/icons/ring.svg';

  /// File path: assets/icons/search.svg
  String get search => 'assets/icons/search.svg';

  /// File path: assets/icons/tick.svg
  String get tick => 'assets/icons/tick.svg';

  /// List of all assets
  List<String> get values => [drawer, expandArrow, profile, ring, search, tick];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/dr_image.png
  AssetGenImage get drImage =>
      const AssetGenImage('assets/images/dr_image.png');

  /// File path: assets/images/expedition_1.png
  AssetGenImage get expedition1 =>
      const AssetGenImage('assets/images/expedition_1.png');

  /// File path: assets/images/expedition_2.png
  AssetGenImage get expedition2 =>
      const AssetGenImage('assets/images/expedition_2.png');

  /// File path: assets/images/img_1.png
  AssetGenImage get img1 => const AssetGenImage('assets/images/img_1.png');

  /// File path: assets/images/img_2.png
  AssetGenImage get img2 => const AssetGenImage('assets/images/img_2.png');

  /// File path: assets/images/img_3.png
  AssetGenImage get img3 => const AssetGenImage('assets/images/img_3.png');

  /// File path: assets/images/img_4.png
  AssetGenImage get img4 => const AssetGenImage('assets/images/img_4.png');

  /// File path: assets/images/img_5.png
  AssetGenImage get img5 => const AssetGenImage('assets/images/img_5.png');

  /// File path: assets/images/img_6.png
  AssetGenImage get img6 => const AssetGenImage('assets/images/img_6.png');

  /// File path: assets/images/main_image.png
  AssetGenImage get mainImage =>
      const AssetGenImage('assets/images/main_image.png');

  /// File path: assets/images/patrons_club.png
  AssetGenImage get patronsClub =>
      const AssetGenImage('assets/images/patrons_club.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    drImage,
    expedition1,
    expedition2,
    img1,
    img2,
    img3,
    img4,
    img5,
    img6,
    mainImage,
    patronsClub,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}});

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
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
