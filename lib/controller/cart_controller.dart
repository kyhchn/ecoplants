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
  final totalQuantity = 0.obs;
  final isLoading = false.obs;
  final isSelectAll = false.obs;

  @override
  void onInit() {
    calculateTotalPayment();
    super.onInit();
  }

  Cart? getSelectedProduct() {
    for (var i = 0; i < isChecked.length; i++) {
      if (isChecked[i]) {
        return carts.elementAt(i);
      }
    }
  }

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

  void calculateTotalPayment() {
    int result = 0;
    int quantity = 0;
    for (var i = 0; i < isChecked.length; i++) {
      if (isChecked[i]) {
        result +=
            carts.elementAt(i).product.price * carts.elementAt(i).quantity;
        quantity += carts.elementAt(i).quantity;
      }
    }
    totalPrice.value = result;
    totalQuantity.value = quantity;
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
