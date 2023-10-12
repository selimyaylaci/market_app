import 'package:market_app/core/_core_exports.dart';

enum FoodTypeUp {
  neYesem,
  mudavim,
  siparislerim,
  masa,
  indirimli,
  getirGetirsin,
  algida,
  yildiz,
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
      case FoodTypeUp.indirimli:
        return "  İndirimli\nRestoranlar";
      case FoodTypeUp.getirGetirsin:
        return "Getir Getirsin\n Restoranları";
      case FoodTypeUp.algida:
        return "  Algida\nLezzetleri";
      case FoodTypeUp.yildiz:
        return "    Yıldız\nRestoranlar";
    }
  }

  String? get toImage {
    switch (this) {
      case FoodTypeUp.indirimli:
        return "assets/getirindirimremove.png";
      case FoodTypeUp.getirGetirsin:
        return "assets/getirgetirsinremove.png";
      case FoodTypeUp.algida:
        return "assets/getiralgidaremove.png";
      case FoodTypeUp.yildiz:
        return "assets/getiryildizremove.png";

      case FoodTypeUp.neYesem:
        // TODO: Handle this case.
        break;
      case FoodTypeUp.mudavim:
        // TODO: Handle this case.
        break;
      case FoodTypeUp.siparislerim:
        // TODO: Handle this case.
        break;
      case FoodTypeUp.masa:
        // TODO: Handle this case.
        break;
    }
    return null;
  }

  Icon? get toIcons {
    switch (this) {
      case FoodTypeUp.neYesem:
        return const Icon(Icons.question_mark);
      case FoodTypeUp.mudavim:
        return const Icon(Icons.diamond);
      case FoodTypeUp.siparislerim:
        return const Icon(Icons.access_time_filled_rounded);
      case FoodTypeUp.masa:
        return const Icon(Icons.flatware);
      case FoodTypeUp.indirimli:
        // TODO: Handle this case.
        break;
      case FoodTypeUp.getirGetirsin:
        // TODO: Handle this case.
        break;
      case FoodTypeUp.algida:
        // TODO: Handle this case.
        break;
      case FoodTypeUp.yildiz:
        // TODO: Handle this case.
        break;
    }
    return null;
  }
}
