enum FoodTypeDown {
  indirimli,
  getirGetirsin,
  algida,
  yildiz,
}

extension FoodTypeExtension on FoodTypeDown {
  String get toText {
    switch (this) {
      case FoodTypeDown.indirimli:
        return "  İndirimli\nRestoranlar";
      case FoodTypeDown.getirGetirsin:
        return "Getir Getirsin\n Restoranları";
      case FoodTypeDown.algida:
        return "  Algida\nLezzetleri";
      case FoodTypeDown.yildiz:
        return "    Yıldız\nRestoranlar";
    }
  }

  String get toImage {
    switch (this) {
      case FoodTypeDown.indirimli:
        return "assets/getirindirimremove.png";
      case FoodTypeDown.getirGetirsin:
        return "assets/getirgetirsinremove.png";
      case FoodTypeDown.algida:
        return "assets/getiralgidaremove.png";
      case FoodTypeDown.yildiz:
        return "assets/getiryildizremove.png";
    }
  }
}
