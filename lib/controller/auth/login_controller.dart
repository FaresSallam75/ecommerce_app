import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/constant/rotesname.dart';
import 'package:ecommerce_app2/core/function/fcmc.config.dart';
import 'package:ecommerce_app2/core/function/handlingdata_controller.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/auth/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUpPage();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;
  String checkIndex = "one";
  StatusRequest statusRequest = StatusRequest.none;
  List data = [];
  LoginData loginData = LoginData(Get.find());
  MyServices myServices = Get.find();

  String? googleId;
  String? googleName;
  String? googleEmail;
  String? gogolePhoto;
  bool isShowPassword = true;
  String? usersid;

  @override
  void onInit() {
    super.onInit();
   
    print(" Get.localec ============ ${Get.locale}");
    print(" Get.localec ============ ${Get.deviceLocale!.languageCode}");
    print(" Get.localec ============ ${Get.locale!.languageCode}");

    email = TextEditingController();
    password = TextEditingController();
    getUserToken();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  getUserToken() {
    FirebaseMessaging.instance.getToken().then((value) {
      print("========================== Value Of Token $value");
      // ignore: unused_local_variable
      String? token = value;
    });
  }

  @override
  goToSignUpPage() {
    Get.offNamed(AppRotes.signUp);
  }

  showPassword() {
    isShowPassword = isShowPassword == true ? false : true;
    update();
  }

  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) {
      return; // here it out from function and did't make exception ..
    }
    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;
    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // myServices.sharedPref.setString("step", "2");
    myServices.sharedPref.setString("googleId", googleUser!.id);
    myServices.sharedPref.setString("googleEmail", googleUser.email);
    myServices.sharedPref.setString("googleName", googleUser.displayName!);
    myServices.sharedPref.setString("googlePhoto", googleUser.photoUrl!);
    print("======================================== google ${googleUser.id}");
    print(
        "======================================== google ${googleUser.email}");
    print(
        "======================================== google ${googleUser.displayName}");
    print(
        "======================================== google ${googleUser.photoUrl}");
    print(
        "======================================== google ${googleUser.serverAuthCode}");

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Get.offNamed(AppRotes.homePage);
  }

/*   var acs = ActionCodeSettings(
      url: 'https://www.example.com/finishSignUp?cartId=1234',
      handleCodeInApp: true,
      iOSBundleId: 'com.example.ios',
      androidPackageName: 'com.example.ecommerce_app2',
      androidInstallApp: true,
      androidMinimumVersion: '12'); 

            FirebaseAuth.instance
                .sendSignInLinkToEmail(
                    email: email.text, actionCodeSettings: acs)
                .catchError((onError) =>
                    print('Error sending email verification $onError'))
                .then((value) {
              print(
                  'Successfully sent email verification ===========================');
            }); */

  @override
  login() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postData(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          if (response['data']['users_approve'] == "1" ||
              response['data']['users_approve'] == 1) {
            myServices.sharedPref
                .setString("id", response['data']['users_id'].toString());
            usersid = myServices.sharedPref.getString("id")!;

            myServices.sharedPref
                .setString("username", response['data']['users_name']);
            myServices.sharedPref
                .setString("email", response['data']['users_email']);
            myServices.sharedPref.setString("image", response['data']['image']);
            myServices.sharedPref
                .setString("password", response['data']['users_password']);
            myServices.sharedPref
                .setString("phone", response['data']['users_phone']);
            myServices.sharedPref.setString("valPassword", password.text);

            myServices.sharedPref.setString("step", "2");
            Get.offNamed(AppRotes.homePage);
          } else {
            myServices.sharedPref
                .setString("id", response['data']['users_id'].toString());
            usersid = myServices.sharedPref.getString("id")!;

            Get.offNamed(AppRotes.verifyCodeSignUp,
                arguments: {"email": email.text, "one": checkIndex});
          }

          FirebaseMessaging.instance.subscribeToTopic("users");
          FirebaseMessaging.instance.subscribeToTopic("users$usersid");
        } else {
          Get.defaultDialog(
            title: "54".tr,
            middleText: "55".tr,
          );
          password.text = "";
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {
      Get.defaultDialog(
        title: "98".tr,
        middleText: "165".tr,
      );
    }
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRotes.forgetPassword);
  }
}


/*   signUp() async {
    var response = await signupData.signUpData(
        myServices.sharedPref.getString("googleName")!,
        "",
        myServices.sharedPref.getString("googleEmail")!,
        "",
        File(myServices.sharedPref.getString("googlePhoto")!));
    print("=============================== Controller $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        Get.snackbar("wait", "Sign Up Successfully");
      }
    }
    update();
  } */
