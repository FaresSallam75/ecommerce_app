import 'package:ecommerce_app2/core/class/crud.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {

  @override
  void dependencies() {
    Get.put(Crud());
  }
}
