import 'package:ecommerce_app2/core/class/statusrequest.dart';
import 'package:ecommerce_app2/core/services/services.dart';
import 'package:ecommerce_app2/data/datasourse/remote/address/address_data.dart';
import 'package:ecommerce_app2/data/model/addressmodel.dart';
import 'package:get/get.dart';
import '../../core/function/handlingdata_controller.dart';

class ViewAddressController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  List<AddressModel> data = [];
  late StatusRequest statusRequest;
  MyServices myServices = Get.find(); 

  
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await addressData.viewData(myServices.sharedPref.getString("id")!);
    print("=============================== Controller $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == "success") {
        List responseData = response['data'];
        data.addAll(responseData.map((e) => AddressModel.fromJson(e)));
        if (data.isEmpty) {
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  deleteAddress(String id) async {
    await addressData.deleteData(id);
    data.removeWhere((element) => element.addressId == id);
    update();
  }

}
