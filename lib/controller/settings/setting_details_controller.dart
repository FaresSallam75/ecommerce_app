import 'dart:async';
import 'dart:io';
import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/fileupload.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/setting/updateProfileusers.dart';
import 'package:ecommerce_app2/data/model/usersmodel.dart';
import 'package:get/get.dart';

class SettingsDetailsController extends GetxController {
  File? file;
  StatusRequest statusRequest = StatusRequest.none;
  UpdateProfileUser updateProfileUser = UpdateProfileUser(Get.find());
  bool isLoading = false;
  MyServices myServices = Get.find();
  late UserModel userModel;

  chooseImageGallery() async {
    file = await fileUploadGallery(AppRotes.changeUserImageProfile, false);
    if (file != null) {
      isLoading = true;
      Timer.periodic(const Duration(seconds: 4), (timer) {
        isLoading = false;
        update();
      });
    }
    update();
  }

  chooseImageCamera() async {
    file = await imageUploadCamera(AppRotes.changeUserImageProfile);
    if (file != null) {
      isLoading = true;
      Timer.periodic(const Duration(seconds: 4), (timer) {
        isLoading = false;
        update();
      });
    }
    update();
  }

  chooseImageOption() {
    showBottomSheetMenuImage(chooseImageGallery, chooseImageCamera);
    update();
  }

  editData() async {
    // if (formState.currentState!.validate()) {
    statusRequest = StatusRequest.loading;
    update();
    Map data = {};
    if (userModel.image != "" || userModel.image!.isNotEmpty) {
      data = {"userid": userModel.usersId, "oldimage": userModel.image!};
    } else {
      data = {"userid": userModel.usersId, "oldimage": ""};
    }

    var response = await updateProfileUser.updateData(data, file);
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        /*     isLoading = true;
        update();
        await Future.delayed(const Duration(seconds: 3));
        Get.offNamed(AppRotes.homePage); */
        file = null;

        Get.offAllNamed(AppRotes.homePage);
        /*    Get.delete<SettingsController>();
        SettingsController con = Get.put(SettingsController());
        con.onInit();
        Get.delete<HomePageControllerImp>(); */

        //  Get.delete<SettingsController>();
        //   SettingsController c = Get.put(SettingsController());
        // c.refreshPage();
      } else {
        // isLoading = false;
        statusRequest = StatusRequest.failure;
      }
    }
    update();
    // }
  }

  @override
  void onInit() {
    userModel = Get.arguments['userModel'];
    super.onInit();
  }

  @override
  void onClose() {
    file = null;
    super.onClose();
  }
}
