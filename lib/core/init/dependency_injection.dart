import 'package:market_app/feature/credential/controller/food_controller.dart';
import '../../feature/_feature_exports.dart';
import '../_core_exports.dart';

final serviceLocator = GetIt.instance;
//GetIt serviceLocator = GetIt.instance();

Future<void> initialize() async {
  // Controllers
  CredentialController credentialController = Get.put(CredentialController());
  serviceLocator
      .registerLazySingleton<CredentialController>(() => credentialController);

  FoodController foodController = Get.put(FoodController());
  serviceLocator.registerLazySingleton<FoodController>(() => foodController);
}
