import 'package:market_app/feature/note/domain/entities/arguments/create_snack_params.dart';
import '../../../core/_core_exports.dart';
import '../domain/entities/snack_type.dart';

class CountController extends GetxController {
  /// Lists
  RxList<CreateSnackParams> snackList = <CreateSnackParams>[].obs;
  RxList<CreateSnackParams> selectedSnackList = <CreateSnackParams>[].obs;
  RxList<SnackType> snackTypeGet = SnackType.values.obs;

  @override
  void onInit() {
    super.onInit();
    final List<CreateSnackParams> generatedList = List.generate(
      SnackType.values.length,
      (index) {
        final SnackType snackType = SnackType.values[index];
        return CreateSnackParams(
          id: snackType.toId.toString(),
          name: snackType.toText,
          price: snackType.toPrice.toString(),
          quantity: 0,
        );
      },
    );
    snackList.addAll(generatedList);
  }

  // add
  void countAdd(final String snackId) {
    final index = snackList.indexWhere((element) => element.id == snackId);
    snackList[index].quantity++;
    debugPrint("=== Increased quantity: ${snackList[index].quantity}");

    final int indexTwo = selectedSnackList.indexWhere((element) => element.id == snackId);
    bool isExists = selectedSnackList.any((element) => element.id == snackId);

    if (isExists) {
      selectedSnackList[indexTwo].quantity++;
    } else {
      selectedSnackList.add(
        CreateSnackParams(
          id: snackList[index].id,
          name: snackList[index].name,
          price: snackList[index].price,
          quantity: 1,
        ),
      );
    }

    update(["snackList", "selectedSnackList"]);
  }

  // remove
  void countRemove(final String snackId) {
    final index = snackList.indexWhere((element) => element.id == snackId);

    final int count = snackList[index].quantity;
    if (count > 0) {
      snackList[index].quantity--;
    }

    bool isExists = selectedSnackList.any((element) => element.id == snackId);
    if (isExists) {
      final int isExistsIndex = selectedSnackList.indexWhere((element) => element.id == snackId);

      if (selectedSnackList[isExistsIndex].quantity > 1) {
        selectedSnackList[isExistsIndex].quantity--;
      } else if (selectedSnackList[isExistsIndex].quantity == 1) {
        selectedSnackList.removeAt(isExistsIndex);
      }
    }
    update(["snackList", "selectedSnackList"]);
  }

  // all total
  int totalSnackType() {
    int allTotalPrice = 0;
    for (CreateSnackParams snackParams in selectedSnackList) {
      int quantity = snackParams.quantity;
      int price = int.tryParse(snackParams.price) ?? 0;
      allTotalPrice += (quantity * price);
    }
    return allTotalPrice;
  }

  // change color
  Color selectedBasket(final String snackId) {
    bool isExists = selectedSnackList.any((element) => element.id == snackId);

    if (isExists) {
      return Colors.deepPurple;
    } else {
      return Colors.transparent;
    }
  }

  // change icon
  Widget iconChange(final String snackId) {
    bool isExists = selectedSnackList.any((element) => element.id == snackId);
    final index = snackList.indexWhere((element) => element.id == snackId);
    final snackType = snackTypeGet.indexWhere((element) => element.toId.toString() == snackId);

    return Align(
      alignment: const Alignment(1.40, 0.0),
      child: Column(
        children: [
          FloatingActionButton.small(
            onPressed: () {
              countAdd(
                snackTypeGet[snackType].toId.toString(),
              );
            },
            backgroundColor: Colors.white,
            heroTag: null,
            shape: const RoundedRectangleBorder(),
            child: const Icon(
              Icons.add,
              color: Colors.deepPurple,
            ),
          ),
          if (isExists) ...[
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurple),
                borderRadius: BorderRadius.circular(1),
                shape: BoxShape.rectangle,
                color: Colors.deepPurple,
              ),
              alignment: Alignment.center,
              child: Text(
                snackList[index].quantity.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            FloatingActionButton.small(
              onPressed: () {
                countRemove(
                  snackTypeGet[snackType].toId.toString(),
                );
              },
              backgroundColor: Colors.white,
              heroTag: null,
              shape: const RoundedRectangleBorder(),
              child: const Icon(
                Icons.remove,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
/**
 * void'i bir şey return etmiyorsak kullanırız eğer return ediyorsak o fonksiyonun yaoısına bakarız
 */
