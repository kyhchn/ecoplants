import 'package:ecoplants/controller/user_controller.dart';
import 'package:ecoplants/model/cart.dart';
import 'package:ecoplants/services/cart_service.dart';
import 'package:ecoplants/utils.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get i => Get.find();
  var carts = <Cart>[].obs;
  var isChecked = <bool>[].obs;
  final totalPrice = 0.obs;
  final isLoading = false.obs;

  final isSelectAll = false.obs;

  Future<void> deleteItem(int id) async {
    isLoading(true);
    bool isSuccess = await CartService().removeCartItem(id);
    if (!isSuccess) {
      Get.showSnackbar(Utils.getSnackBar('gagal menghapus produk'));
    } else {
      final usercontroller = UserController.i;
      usercontroller.onInit();
      await fetch();
    }
    isLoading(false);
  }

  Future<void> fetch() async {
    isLoading(true);
    final userController = UserController.i;
    carts = List<Cart>.from(userController.user.value.carts).obs;
    var tempList = <bool>[];
    for (var element in carts) {
      tempList.add(false);
    }
    isChecked = tempList.obs;
    isLoading(false);
  }

  Future<bool> addToCart(int productId) async {
    isLoading(true);
    final isSuccess = await CartService().addToCart(productId);
    if (isSuccess) {
      final usercontroller = UserController.i;
      usercontroller.onInit();
      await fetch();
    }
    isLoading(false);
    return isSuccess;
  }
}
