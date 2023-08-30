import 'package:market_app/feature/note/domain/entities/arguments/create_snack_params.dart';
import '../../../core/_core_exports.dart';
import '../domain/entities/snack_type.dart';

class CountController extends GetxController {
  /// Lists
  RxList<CreateSnackParams> snackList = <CreateSnackParams>[].obs;
  RxList<CreateSnackParams> selectedSnackList = <CreateSnackParams>[].obs;

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
}
