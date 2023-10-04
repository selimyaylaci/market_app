import 'package:market_app/core/_core_exports.dart';

enum FoodTypeUp {
  neYesem,
  mudavim,
  siparislerim,
  masa,
  /*  indirimli,
  getirGetirsin,
  algida,
  yildiz, */
}

extension FoodTypeExtension on FoodTypeUp {
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
      /*  case FoodType.indirimli:
        return "İndirimli Restoranlar";
      case FoodType.getirGetirsin:
        return "Getir Getirsin Restoranları";
      case FoodType.algida:
        return "Algida Lezzetleri";
      case FoodType.yildiz:
        return "Yıldız Restoranlar"; */
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
      /* case FoodType.indirimli:
        return "assets/getirindirimremove.png";
      case FoodType.getirGetirsin:
        return "assets/getirgetirsinremove.png";
      case FoodType.algida:
        return "assets/getiralgidaremove.png";
      case FoodType.yildiz:
        return "assets/getiryildizremove.png"; */
    }
  }
}
