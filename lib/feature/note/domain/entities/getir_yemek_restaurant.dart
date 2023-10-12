enum Restaurant {
  hamburger,
  kofte,
  patso,
  kumru,
  doner,
  tomsBurger,
  cajun,
}

extension RestaurantExtension on Restaurant {
  String get toText {
    switch (this) {
      case Restaurant.hamburger:
        return "Burger King, Merkez(Altıntop Mah)";
      case Restaurant.kofte:
        return "Köfteci Yusuf, Merkezefendi(Kayalar)";
      case Restaurant.patso:
        return "Patsocu, Merkezefendi(Değirmenönü Mah.)";
      case Restaurant.kumru:
        return "Kumrucu Özgür, Merkezefendi";
      case Restaurant.doner:
        return "Hatay Antakya Dönercisi, Merkezefendi(Altıntop)";
      case Restaurant.tomsBurger:
        return "Tom's Burger House, Pamukkale (Yunus Emre)";
      case Restaurant.cajun:
        return "Cajun Corner, Pamukkale(Yunus Emre Mah.)";
    }
  }

  String get toImage {
    switch (this) {
      case Restaurant.hamburger:
        return "assets/getirYemekHamburger.jpeg";
      case Restaurant.kofte:
        return "assets/getirYemekKofte.png";
      case Restaurant.patso:
        return "assets/getirYemekPatso.png";
      case Restaurant.kumru:
        return "assets/getirYemekKumru.jpeg";
      case Restaurant.doner:
        return "assets/getirYemekDoner.jpeg";
      case Restaurant.tomsBurger:
        return "assets/getirYemekBayBurger.png";
      case Restaurant.cajun:
        return "assets/getirYemekCajun.png";
    }
  }

  String get toLocation {
    switch (this) {
      case Restaurant.hamburger:
        return "2.0 km";
      case Restaurant.kofte:
        return "4.3 km";
      case Restaurant.patso:
        return "2.0 km";
      case Restaurant.kumru:
        return "2.5 km";
      case Restaurant.doner:
        return "1.3 km";
      case Restaurant.tomsBurger:
        return "5.5 km";
      case Restaurant.cajun:
        return "5.4 km";
    }
  }

  String get toStar {
    switch (this) {
      case Restaurant.hamburger:
        return "4.0";
      case Restaurant.kofte:
        return "3.6";
      case Restaurant.patso:
        return "4.4";
      case Restaurant.kumru:
        return "4.2";
      case Restaurant.doner:
        return "4.1";
      case Restaurant.tomsBurger:
        return "5.0";
      case Restaurant.cajun:
        return "4.2";
    }
  }

  String get toNumberOrders {
    switch (this) {
      case Restaurant.hamburger:
        return "(6000+)";
      case Restaurant.kofte:
        return "(1250+)";
      case Restaurant.patso:
        return "(50+)";
      case Restaurant.kumru:
        return "(400+)";
      case Restaurant.doner:
        return "(3000+)";
      case Restaurant.tomsBurger:
        return "(9000+)";
      case Restaurant.cajun:
        return "(1000+)";
    }
  }

  String get toTimeAndMinPrice {
    switch (this) {
      case Restaurant.hamburger:
        return "50 dk·Min 140 TL";
      case Restaurant.kofte:
        return "45 dk·Min 100 TL";
      case Restaurant.patso:
        return "30 dk·Min 70 TL";
      case Restaurant.kumru:
        return "30 dk·Min 70 TL";
      case Restaurant.doner:
        return "40 dk·Min 90 TL";
      case Restaurant.tomsBurger:
        return "55 dk·Min 200 TL";
      case Restaurant.cajun:
        return "45 dk·Min 400 TL";
    }
  }

  String get toDiscount {
    switch (this) {
      case Restaurant.hamburger:
        return "%25 indirim! - Sınırsız";
      case Restaurant.kofte:
        return "%10 indirim! - Sınırsız";
      case Restaurant.patso:
        return "%20 indirim! - Sınırsız";
      case Restaurant.kumru:
        return "%35 indirim! - Sınırsız";
      case Restaurant.doner:
        return "%40 indirim! - Sınırsız";
      case Restaurant.tomsBurger:
        return "%5 indirim! - Sınırsız";
      case Restaurant.cajun:
        return "%15 indirim! - Sınırsız";
    }
  }
}
