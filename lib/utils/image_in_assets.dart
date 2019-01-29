/*
 * image_in_assets.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 1/29/19 10:12 PM
 * Copyright (c) 2019. Farfetch. All rights reserved.
 */

import 'package:flutter/material.dart';

class ImageInAssets {
  final AssetImage _assetImage;

  AssetImage assetImage() => _assetImage;
  Image image({Color color}) => Image(
        image: _assetImage,
        color: color,
      );

  ImageInAssets({String name}) : _assetImage = AssetImage(name);
}
