import 'dart:io';
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/strings.dart';
import 'custom_flashbar.dart';

Widget imageAsset(String name,
        {double? scale, double? width, double? height, BoxFit? fit, color}) =>
    Image.asset(
      name,
      height: height,
      width: width,
      fit: fit,
      color: color,
    );

Widget imageFile(File file,
        {double? scale, double? width, double? height, BoxFit? fit}) =>
    Image.file(
      file,
      height: height,
      width: width,
      fit: fit,
    );

Widget imageMemory(Uint8List bytes,
        {double? scale, double? width, double? height, BoxFit? fit}) =>
    Image.memory(
      bytes,
      height: height,
      width: width,
      fit: fit,
    );

Widget imageNetwork(String url,
        {double? scale, double? width, double? height, BoxFit? fit}) =>
    Image.network(
      url,
      height: height,
      width: width,
      fit: fit,
    );

imageAssetProvider(name) => AssetImage(name);

imageNetworkProvider(name) => NetworkImage(name);

imageFileProvider(name) => FileImage(name);

Widget cachedImage(
  url, {
  double? height,
  double? width,
  BoxFit boxFit = BoxFit.contain,
}) {
  return CachedNetworkImage(
      width: width,
      height: height,
      fit: boxFit,
      imageUrl: url ?? "",
      placeholder: (context, url) => Center(
            child: CupertinoActivityIndicator(),
          ),
      errorWidget: (context, url, error) => Center(
            child: Icon(
              Icons.error_rounded,
              color: Colors.grey,
            ),
          ));
}

// Widget cachedImageWithView(
//   url, {
//   double? height,
//   double? width,
//   var tag,
//   BoxFit boxFit = BoxFit.contain,
// }) {
//   return FullScreenWidget(
//     disposeLevel: DisposeLevel.High,
//     child: Hero(
//       tag: tag,
//       child: CachedNetworkImage(
//           width: width,
//           height: height,
//           fit: boxFit,
//           imageUrl: url ?? "",
//           placeholder: (context, url) => Center(
//                 child: CupertinoActivityIndicator(),
//               ),
//           errorWidget: (context, url, error) => Icon(
//                 Icons.error_rounded,
//                 color: Colors.grey,
//               )),
//     ),
//   );
// }

fileImage(
    {imageUrl,
    height,
    width,
    radiusAll,
    imageFitType,
    double? topRight,
    double? topLeft,
    double? bottomLeft,
    double? bottomRight}) {
  return ClipRRect(
      borderRadius: radiusAll == null
          ? BorderRadius.only(
              topRight: Radius.circular(topRight ?? 0.0),
              topLeft: Radius.circular(topLeft ?? 0.0),
              bottomLeft: Radius.circular(bottomLeft ?? 0.0),
              bottomRight: Radius.circular(bottomRight ?? 0.0))
          : BorderRadius.circular(radiusAll),
      child: Image.file(
        imageUrl,
        height: height,
        width: width,
        fit: imageFitType == null ? BoxFit.contain : imageFitType,
      ));
}

networkImage(
    {String? imageUrl,
    double? height,
    double? width,
    double? radiusAll,
    BoxFit? imageFitType,
    double? topRight,
    double? topLeft,
    double? bottomLeft,
    double? bottomRight}) {
  return ClipRRect(
      borderRadius: radiusAll == null
          ? BorderRadius.only(
              topRight: Radius.circular(topRight ?? 0.0),
              topLeft: Radius.circular(topLeft ?? 0.0),
              bottomLeft: Radius.circular(bottomLeft ?? 0.0),
              bottomRight: Radius.circular(bottomRight ?? 0.0))
          : BorderRadius.circular(radiusAll),
      child: Image.network(
        imageUrl ?? "",
        height: height,
        width: width,
        fit: imageFitType ?? BoxFit.contain,
      ));
}

imagePickFromGallery(context) async {
  var pickedFile = await ImagePicker()
      .pickImage(source: ImageSource.gallery, imageQuality: 100);
  if (pickedFile == null) {
    toast(strChooseImage);
  } else {
    return cropImage(pickedFile.path, context);
  }
}

imagePickFromCamera(context) async {
  var pickedFile = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 100);
  if (pickedFile == null) {
    toast(strChooseImage);
  } else {
    return cropImage(pickedFile.path, context);
  }
}

Future<PickedFile?> imageFromCamera() async {
  return await ImagePicker.platform
      .pickImage(source: ImageSource.camera, imageQuality: 100);
}

/*=================================================================== Image Pick Using Gallery ===================================================*/
Future<PickedFile?> imageFromGallery() async {
  return await ImagePicker.platform
      .pickImage(source: ImageSource.gallery, imageQuality: 100);
}

cropImage(filePath, context) async {
  var croppedImage = await ImageCropper().cropImage(
    sourcePath: filePath,
    aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
    aspectRatioPresets: [CropAspectRatioPreset.original],
  );
  if (croppedImage == null) {
    toast(strChooseImage);
  } else {
    print("=$croppedImage");
    return croppedImage;
  }
}
