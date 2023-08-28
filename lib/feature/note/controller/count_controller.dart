import 'package:market_app/feature/note/domain/entities/arguments/create_snack_params.dart';
import '../../../core/_core_exports.dart';
import '../domain/entities/snack_type.dart';

class CountController extends GetxController {
  // list
  List<CreateSnackParams> snackList = [];
  //List<CreateSnackParams> snacks = [];
  //final List<CreateSnackParams> snack = [];
  //RxList<CreateSnackParams> snack = <CreateSnackParams>[].obs;
  RxList<CreateSnackParams> selectedSnackList = <CreateSnackParams>[].obs;

  @override
  void onInit() {
    super.onInit();
    snackList = List.generate(
      SnackType.values.length,
      (index) {
        final SnackType snackType = SnackType.values[index];
        return CreateSnackParams(
          id: snackType.toId.toString(),
          name: snackType.toText,
          price: snackType.toPrice.toString(),
          quantity: 0.obs,
        );
      },
    );
  }

  // count
  //RxInt count = 0.obs;
  void countAdd(CreateSnackParams createSnackParams) {
    final index = snackList.indexWhere((element) => element.id == createSnackParams.id);
    snackList[index].quantity++;



    final indexTwo = selectedSnackList.indexWhere((element) => element.id == createSnackParams.id);
    bool isExists = selectedSnackList.any((element) => element.id == createSnackParams.id);

    if (isExists) {
      selectedSnackList[indexTwo].quantity.value++;
    } else {
      selectedSnackList.add(createSnackParams);
    }
  }

  void countRemove(final String snackId) {
    final index = snackList.indexWhere((element) => element.id == snackId);

    final int count = snackList[index].quantity.value;
    if (count > 0) {
      snackList[index].quantity.value--;
    }

    bool isExists = selectedSnackList.any((element) => element.id == snackId);
    if (isExists) {
      final int isExistsIndex = selectedSnackList.indexWhere((element) => element.id == snackId);

      if (selectedSnackList[isExistsIndex].quantity.value > 1) {
        selectedSnackList[isExistsIndex].quantity.value--;
      } else if (selectedSnackList[isExistsIndex].quantity.value == 1) {
        selectedSnackList.removeAt(isExistsIndex);
      }
    }
  }
}
