import 'package:get/get.dart';
import 'package:jsonplaceholder_flutterconfig/controller/create_controller.dart';
import 'package:jsonplaceholder_flutterconfig/controller/edit_controller.dart';
import 'package:jsonplaceholder_flutterconfig/controller/home_controller.dart';




class ControllersBinding implements Bindings {

  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put<HomeController>(HomeController());
    Get.put<EditController>(EditController());
    Get.put<CreateController>(CreateController());
  }
}