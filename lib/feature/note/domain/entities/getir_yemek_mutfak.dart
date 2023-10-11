enum FoodKitchen {
  kahveIcecek,
  sokakLezzetleri,
  tostSandvic,
  burger,
  tavuk,
  doner,
  kebap,
  pizza,
  pastaTatli,
  pastaneFirin,
  kahvalti,
  pideLahmacun,
  evYemekleri,
  dunyaMutfagi,
  cigKofte,
}

extension FoodKitchenExtension on FoodKitchen {
  String get toText {
    switch (this) {
      case FoodKitchen.kahveIcecek:
        return "Kahve & İcecek";
      case FoodKitchen.sokakLezzetleri:
        return "Sokak Lezzetleri";
      case FoodKitchen.tostSandvic:
        return "Tost & Sandviç";
      case FoodKitchen.burger:
        return "Burger";
      case FoodKitchen.tavuk:
        return "Tavuk";
      case FoodKitchen.doner:
        return "Döner";
      case FoodKitchen.kebap:
        return "Kebap";
      case FoodKitchen.pizza:
        return "Pizza";
      case FoodKitchen.pastaTatli:
        return "Pasta & Tatlı";
      case FoodKitchen.pastaneFirin:
        return "Pastane & Fırın";
      case FoodKitchen.kahvalti:
        return "Kahvaltı";
      case FoodKitchen.pideLahmacun:
        return "Pide & Lahmacun";
      case FoodKitchen.evYemekleri:
        return "Ev Yemekleri";
      case FoodKitchen.dunyaMutfagi:
        return "Dünya Mutfagı";
      case FoodKitchen.cigKofte:
        return "Çiğ Köfte";
    }
  }

  String get toImage {
    switch (this) {
      case FoodKitchen.kahveIcecek:
        return "assets/getirYemekIcecekRemove.png";
      case FoodKitchen.sokakLezzetleri:
        return "assets/getirYemekIcecekRemove.png";
      case FoodKitchen.tostSandvic:
        return "assets/getirYemekTostSandvicRemove.png";
      case FoodKitchen.burger:
        return "assets/getirYemekBurgerrRemove.png";
      case FoodKitchen.tavuk:
        return "assets/getirYemekTavukRemove.png";
      case FoodKitchen.doner:
        return "assets/getirYemekDonerrRemove.png";
      case FoodKitchen.kebap:
        return "assets/getirYemekKebapRemove.png";
      case FoodKitchen.pizza:
        return "assets/getirYemekPizzaRemove.png";
      case FoodKitchen.pastaTatli:
        return "assets/getirYemekPastaRemove.png";
      case FoodKitchen.pastaneFirin:
        return "assets/getirYemekPastaneRemove.png";
      case FoodKitchen.kahvalti:
        return "assets/getirYemekKahvaltiRemove.png";
      case FoodKitchen.pideLahmacun:
        return "assets/getirYemekPideRemove.png";
      case FoodKitchen.evYemekleri:
        return "assets/getirYemekEvYemekleriRemove.png";
      case FoodKitchen.dunyaMutfagi:
        return "assets/getirYemekDunyaMutfagiRemove.png";
      case FoodKitchen.cigKofte:
        return "assets/getirYemekCigKofteRemove.png";
    }
  }
}
