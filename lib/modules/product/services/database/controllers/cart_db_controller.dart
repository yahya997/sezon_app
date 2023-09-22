
// import 'package:get/get.dart';
//
// class CartDbController extends DbOperations<Cart> {
//   String userId = SharedPrefController().getValueFor<String>(PrefKeys.id.name)!;
//   // static CartDbController get to => Get.find();
//
//   @override
//   Future<int> create(Cart model) async {
//     // User add new Item for the first time to the cart
//     return await database.insert(Cart.tableName, model.toMap());
//   }
//
//   @override
//   Future<bool> delete(int id) async {
//     print(database);
//     int countOfDeletedRows = await database.delete(
//       Cart.tableName,
//       where: 'id = ? AND user_id = ?',
//       whereArgs: [id, userId],
//     );
//     return countOfDeletedRows == 1;
//   }
//
//   @override
//   Future<List<Cart>> read() async {
//     List<Map<String, dynamic>> rowsMap = await database.query(
//       Cart.tableName,
//       where: 'user_id = ?',
//       whereArgs: [userId],
//     );
//     return rowsMap.map((rowMap) => Cart.fromMap(rowMap)).toList();
//   }
//
//   @override
//   Future<Cart?> show(int id) {
//     // TODO: implement show
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<bool> update(Cart model) async {
//     int countOfUpdatedRows = await database.update(
//       Cart.tableName,
//       model.toMap(),
//       where: 'id = ? AND user_id = ?',
//       whereArgs: [model.id, userId],
//     );
//     print(countOfUpdatedRows);
//     return countOfUpdatedRows == 1;
//   }
//
//   @override
//   Future<bool> clear() async {
//     int countOfDeletedRows = await database.delete(
//       Cart.tableName,
//       where: 'user_id = ?',
//       whereArgs: [userId],
//     );
//     return countOfDeletedRows > 0;
//   }
// }
