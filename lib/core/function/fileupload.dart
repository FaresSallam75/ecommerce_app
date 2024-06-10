import 'dart:io';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera(String rote) async {
  XFile? file = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90);

  File imageFile = File(file!.path);
  // ignore: unnecessary_null_comparison
  if (file == null) {
    return null;
  }
  // ignore: unnecessary_null_comparison
  if (imageFile != null) {
    Get.toNamed(rote);
    return (imageFile);
  } else {
    return null;
  }
}

fileUploadGallery(String rote, [isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: isSvg
          ? ["svg", "Svg", "SVG"]
          : ["png", "PNG", "jpg", "JPG", "gif", "GIF"]);

  if (result != null) {
    Get.toNamed(rote);
    return File(result.files.single.path!);
  } else {
    return null;
  }
}

showBottomSheetMenuImage(fileUploadGallery, imageUploadCamera) {
  Get.bottomSheet(
      backgroundColor: Colors.grey.shade900.withOpacity(0.9),
      Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
          padding: const EdgeInsets.all(15),
          height: 175,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  "Choose Image",
                  style: TextStyle(
                    fontSize: 22,
                    color: AppColor.backGround,
                    fontFamily: "sans",
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  fileUploadGallery();
                  Get.back();
                },
                child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.photo_outlined,
                          size: 30,
                          color: AppColor.backGround,
                        ),
                        SizedBox(width: 20),
                        Text(
                          "From Gallery",
                          style: TextStyle(
                              color: AppColor.backGround,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ),
              InkWell(
                onTap: () {
                  imageUploadCamera();
                  Get.back();
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.camera,
                        size: 30,
                        color: AppColor.backGround,
                      ),
                      SizedBox(width: 20),
                      Text(
                        "From Camera",
                        style: TextStyle(
                            color: AppColor.backGround,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ));
}
