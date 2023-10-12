enum Categories {
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

extension CategoriesExtension on Categories {
  String get toText {
    switch (this) {
      case Categories.kahveIcecek:
        return "Kahve & İcecek";
      case Categories.sokakLezzetleri:
        return "Sokak Lezzetleri";
      case Categories.tostSandvic:
        return "Tost & Sandviç";
      case Categories.burger:
        return "Burger";
      case Categories.tavuk:
        return "Tavuk";
      case Categories.doner:
        return "Döner";
      case Categories.kebap:
        return "Kebap";
      case Categories.pizza:
        return "Pizza";
      case Categories.pastaTatli:
        return "Pasta & Tatlı";
      case Categories.pastaneFirin:
        return "Pastane & Fırın";
      case Categories.kahvalti:
        return "Kahvaltı";
      case Categories.pideLahmacun:
        return "Pide & Lahmacun";
      case Categories.evYemekleri:
        return "Ev Yemekleri";
      case Categories.dunyaMutfagi:
        return "Dünya Mutfagı";
      case Categories.cigKofte:
        return "Çiğ Köfte";
    }
  }

  String get toImage {
    switch (this) {
      case Categories.kahveIcecek:
        return "assets/getirYemekIcecekRemove.png";
      case Categories.sokakLezzetleri:
        return "assets/getirYemekTantuniRemove.png";
      case Categories.tostSandvic:
        return "assets/getirYemekTostSandvicRemove.png";
      case Categories.burger:
        return "assets/getirYemekBurgerrRemove.png";
      case Categories.tavuk:
        return "assets/getirYemekTavukRemove.png";
      case Categories.doner:
        return "assets/getirYemekDonerrRemove.png";
      case Categories.kebap:
        return "assets/getirYemekKebapRemove.png";
      case Categories.pizza:
        return "assets/getirYemekPizzaRemove.png";
      case Categories.pastaTatli:
        return "assets/getirYemekPastaRemove.png";
      case Categories.pastaneFirin:
        return "assets/getirYemekPastaneRemove.png";
      case Categories.kahvalti:
        return "assets/getirYemekKahvaltiRemove.png";
      case Categories.pideLahmacun:
        return "assets/getirYemekPideRemove.png";
      case Categories.evYemekleri:
        return "assets/getirYemekEvYemekleriRemove.png";
      case Categories.dunyaMutfagi:
        return "assets/getirYemekDunyaMutfagiRemove.png";
      case Categories.cigKofte:
        return "assets/getirYemekCigKofteRemove.png";
    }
  }

  String get toStar {
    switch (this) {
      case Categories.kahveIcecek:
        return "4.0";
      case Categories.sokakLezzetleri:
        return "3.4";
      case Categories.tostSandvic:
        return "1.2";
      case Categories.burger:
        return "4.5";
      case Categories.tavuk:
        return "3.3";
      case Categories.doner:
        return "2.5";
      case Categories.kebap:
        return "4.9";
      case Categories.pizza:
        return "4.7";
      case Categories.pastaTatli:
        return "4.5";
      case Categories.pastaneFirin:
        return "2.7";
      case Categories.kahvalti:
        return "3.1";
      case Categories.pideLahmacun:
        return "2.8";
      case Categories.evYemekleri:
        return "4.7";
      case Categories.dunyaMutfagi:
        return "3.4";
      case Categories.cigKofte:
        return "4.1";
    }
  }

  String get toLocation {
    switch (this) {
      case Categories.kahveIcecek:
        return "6.4 km";
      case Categories.sokakLezzetleri:
        return "2.3 km";
      case Categories.tostSandvic:
        return "4.2 km";
      case Categories.burger:
        return "1.0 km";
      case Categories.tavuk:
        return "0.5 km";
      case Categories.doner:
        return "5.0 km";
      case Categories.kebap:
        return "3.3 km";
      case Categories.pizza:
        return "2.0 km";
      case Categories.pastaTatli:
        return "7.4 km";
      case Categories.pastaneFirin:
        return "3.2 km";
      case Categories.kahvalti:
        return "4.2 km";
      case Categories.pideLahmacun:
        return "1.9 km";
      case Categories.evYemekleri:
        return "8.7 km";
      case Categories.dunyaMutfagi:
        return "6.5 km";
      case Categories.cigKofte:
        return "4.5 km";
    }
  }

  String get toNumberOrders {
    switch (this) {
      case Categories.kahveIcecek:
        return "(600+)";
      case Categories.sokakLezzetleri:
        return "(1000+)";
      case Categories.tostSandvic:
        return "(300+)";
      case Categories.burger:
        return "(4000+)";
      case Categories.tavuk:
        return "(50+)";
      case Categories.doner:
        return "(300+)";
      case Categories.kebap:
        return "(400+)";
      case Categories.pizza:
        return "(500+)";
      case Categories.pastaTatli:
        return "(6000+)";
      case Categories.pastaneFirin:
        return "(1000+)";
      case Categories.kahvalti:
        return "(3000+)";
      case Categories.pideLahmacun:
        return "(9000+)";
      case Categories.evYemekleri:
        return "(400+)";
      case Categories.dunyaMutfagi:
        return "(700+)";
      case Categories.cigKofte:
        return "(60+)";
    }
  }

  String get toTimeAndMinPrice {
    switch (this) {
      case Categories.kahveIcecek:
        return "20 dk·Min 40 TL";
      case Categories.sokakLezzetleri:
        return "40 dk·Min 90 TL";
      case Categories.tostSandvic:
        return "50 dk·Min 140 TL";
      case Categories.burger:
        return "70 dk·Min 190 TL";
      case Categories.tavuk:
        return "60 dk·Min 200 TL";
      case Categories.doner:
        return "25 dk·Min 80 TL";
      case Categories.kebap:
        return "65 dk·Min 40 TL";
      case Categories.pizza:
        return "15 dk·Min 45 TL";
      case Categories.pastaTatli:
        return "40 dk·Min 300 TL";
      case Categories.pastaneFirin:
        return "80 dk·Min 250 TL";
      case Categories.kahvalti:
        return "45 dk·Min 250 TL";
      case Categories.pideLahmacun:
        return "35 dk·Min 70 TL";
      case Categories.evYemekleri:
        return "30 dk·Min 45 TL";
      case Categories.dunyaMutfagi:
        return "20 dk·Min 30 TL";
      case Categories.cigKofte:
        return "55 dk·Min 65 TL";
    }
  }
}
