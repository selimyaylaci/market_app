import 'package:market_app/core/_core_exports.dart';

enum FoodTypeUp {
  neYesem,
  mudavim,
  siparislerim,
  masa,
}

extension FoodTypeUpExtension on FoodTypeUp {
  String get toText {
    switch (this) {
      case FoodTypeUp.neYesem:
        return "Ne Yesem?";
      case FoodTypeUp.mudavim:
        return "Müdavim";
      case FoodTypeUp.siparislerim:
        return "Siparişlerim";
      case FoodTypeUp.masa:
        return "Masa";
    }
  }

  Icon get toImage {
    switch (this) {
      case FoodTypeUp.neYesem:
        return  const Icon(Icons.question_mark);
      case FoodTypeUp.mudavim:
        return const Icon(Icons.diamond);
      case FoodTypeUp.siparislerim:
        return const Icon(Icons.access_time_filled_rounded);
      case FoodTypeUp.masa:
        return const Icon(Icons.flatware);
    }
  }
}
