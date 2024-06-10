import 'package:ecommerce_app2/controller/orders/pending_orders_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

requestPermissionNotifications() async {
  // ignore: unused_local_variable
  NotificationSettings settings =
      await FirebaseMessaging.instance.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
}

fcmsConfigration() {
  FirebaseMessaging.onMessage.listen((message) {
    print("==================== Notifications  ================");
    print(message.notification!.title);
    print(message.notification!.body);
    FlutterRingtonePlayer.playNotification();
    if (Get.currentRoute == "/verifycodesignup") {
      Get.snackbar(
          duration: const Duration(seconds: 3),
          message.notification!.title!,
          message.notification!.body!);
    } else {
      Get.snackbar(message.notification!.title!, message.notification!.body!);
    }
    refreshOrderNotification(message.data);
  });
}

refreshOrderNotification(data) {
  print("pade id ============================");
  data['pageid'];
  print("pade name ============================");
  data['pagename'];
  if (Get.currentRoute == "/pendingorders" &&
      data['pagename'] == "refreshorder") {
    PendingOrdersController controller = Get.find();
    controller.refreshOrderPage();
  } else if (Get.currentRoute == "/verifycodesignup"  &&                                  
      data['pagename'] == "refresh") {
  }
}
