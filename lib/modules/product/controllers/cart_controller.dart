// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_rx/src/rx_types/rx_types.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
//
// import '../model/cart.dart';
//
//
// class CartGetxController extends GetxController {
//   RxList<Cart> cartItems = <Cart>[].obs ;
//   RxBool loading = false.obs;
//
//   static CartGetxController get to => Get.find<CartGetxController>();
//
//   @override
//   void onInit() {
//     read();
//     super.onInit();
//   }
//
//   final CartDbController _dbController = CartDbController();
//
//   final ProductGetxController productGetxController = ProductGetxController();
//
//   double total = 0;
//   double quantity = 0;
//
//   Future<ApiResponse> create(Cart cart) async {
//     int index =
//     cartItems.indexWhere((element) => element.productId == cart.productId);
//     if (index == -1) {
//       int newRowId = await _dbController.create(cart);
//       if (newRowId != 0) {
//         total += cart.total;
//         quantity += 1;
//         cart.id = newRowId;
//         cartItems.add(cart);
//       }
//       return getResponse(newRowId != 0);
//     } else {
//       int newCount = cartItems[index].count + 1;
//       return changeQuantity(index, newCount);
//     }
//   }
//
//   Future<ApiResponse> deleteItem(int index) async {
//     // loading = true.obs;
//     Cart cart = cartItems[index];
//     bool deleted = await _dbController.delete(cart.id);
//     print(deleted);
//     if (deleted) {
//       total -= cart.total;
//       quantity -= 1;
//       cartItems.removeAt(index);
//     }
//     return getResponse(deleted);
//
//   }
//
//   void read() async {
//     loading.value = true;
//     cartItems.value = await _dbController.read();
//     for (Cart cart in cartItems) {
//       total += cart.total;
//       quantity += cart.count;
//     }
//     loading.value = false;
//   }
//
//   Future<ApiResponse> changeQuantity(int index, int count) async {
//     bool isDelete = count == 0;
//     Cart cart = cartItems[index];
//     print(isDelete);
//     bool result = isDelete
//         ? await _dbController.delete(cart.id)
//         : await _dbController.update(cart);
//
//     if (result) {
//       if (isDelete) {
//         total -= cart.total;
//         quantity -= 1;
//         cartItems.removeAt(index);
//       } else {
//         cart.count = count;
//         cart.total = cart.price * cart.count;
//         print(cart.total);
//         total = cart.total;
//         quantity += 1;
//         cartItems[index] = cart;
//       }
//     }
//
//     return getResponse(result,message: 'Product has been increased successfully');
//   }
//
//   Future<ApiResponse> clear() async {
//     bool cleared = await _dbController.clear();
//     print(cleared);
//     if (cleared) {
//       total = 0;
//       quantity = 0;
//       cartItems.clear();
//     }
//     return getResponse(cleared);
//   }
//
//
//   double getTotla(){
//
//     double total=0.0;
//     for(Cart cart in cartItems.value){
//       total+=cart.total;
//     }
//     return total;
//   }
//
//   ApiResponse getResponse(bool success,{ String message='Operation completed successfully'}) {
//     return ApiResponse(
//       message:message,
//       success: success,
//     );
//   }
// }