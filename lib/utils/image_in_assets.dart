/*
 * image_in_assets.dart
 * flutter_panda_foundation
 *
 * Developed by zhudelun on 2/8/19 1:49 AM.
 * Copyright (c) 2019 by Farfetch. All rights reserved.
 *
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
