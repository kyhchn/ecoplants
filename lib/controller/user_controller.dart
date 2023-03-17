import 'package:ecoplants/controller/cart_controller.dart';
import 'package:ecoplants/model/cart.dart';
import 'package:ecoplants/model/user.dart';
import 'package:ecoplants/services/user_service.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  static UserController get i => Get.find();
  late Rx<User> user;
  final isLoading = false.obs;
  @override
  void onInit() {
    fetchUser();
    super.onInit();
  }

  void fetchUser() async {
    isLoading(true);
    final data = await UserService().getUserById();
    if (data != null) {
      user = data.obs;
      final cartController = CartController.i;
      cartController.fetch();
    }
    isLoading(false);
  }
}

RxList<Map<String, dynamic>> convert(List<Cart> list) {
  final res = <Map<String, dynamic>>[];
  for (var element in list) {
    final map = {'cart': element.obs, 'isChecked': false.obs};
    res.add(map);
  }
  return res.obs;
}
