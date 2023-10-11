import 'package:market_app/core/_core_exports.dart';

enum Mudavim {
  hamburger,
  kofte,
  patso,
  kumru,
  doner,
  tomsBurger,
  cajun,
}

extension MudavimExtension on Mudavim {
  String get toText {
    switch (this) {
      case Mudavim.hamburger:
        return "Burger King, Merkez(Altıntop Mah)";
      case Mudavim.kofte:
        return "Köfteci Yusuf, Merkezefendi(Kayalar)";
      case Mudavim.patso:
        return "Patsocu, Merkezefendi(Değirmenönü Mah.)";
      case Mudavim.kumru:
        return "Kumrucu Özgür, Merkezefendi";
      case Mudavim.doner:
        return "Hatay Antakya Dönercisi, Merkezefendi(Altıntop)";
      case Mudavim.tomsBurger:
        return "Tom's Burger House, Pamukkale (Yunus Emre)";
      case Mudavim.cajun:
        return "Cajun Corner, Pamukkale(Yunus Emre Mah.)";
    }
  }

  String get toImage {
    switch (this) {
      case Mudavim.hamburger:
        return "assets/getirYemekHamburger.jpeg";
      case Mudavim.kofte:
        return "assets/getirYemekKofte.png";
      case Mudavim.patso:
        return "assets/getirYemekPatso.png";
      case Mudavim.kumru:
        return "assets/getirYemekKumru.jpeg";
      case Mudavim.doner:
        return "assets/getirYemekDoner.jpeg";
      case Mudavim.tomsBurger:
        return "assets/getirYemekBayBurger.png";
      case Mudavim.cajun:
        return "assets/getirYemekCajun.png";
    }
  }

  String get toLocation {
    switch (this) {
      case Mudavim.hamburger:
        return "2.0 km";
      case Mudavim.kofte:
        return "4.3 km";
      case Mudavim.patso:
        return "2.0 km";
      case Mudavim.kumru:
        return "2.5 km";
      case Mudavim.doner:
        return "1.3 km";
      case Mudavim.tomsBurger:
        return "5.5 km";
      case Mudavim.cajun:
        return "5.4 km";
    }
  }

  String get toStar {
    switch (this) {
      case Mudavim.hamburger:
        return "4.0";
      case Mudavim.kofte:
        return "3.6";
      case Mudavim.patso:
        return "4.4";
      case Mudavim.kumru:
        return "4.2";
      case Mudavim.doner:
        return "4.1";
      case Mudavim.tomsBurger:
        return "5.0";
      case Mudavim.cajun:
        return "4.2";
    }
  }

  String get toNumberOrders {
    switch (this) {
      case Mudavim.hamburger:
        return "(6000+)";
      case Mudavim.kofte:
        return "(1250+)";
      case Mudavim.patso:
        return "(50+)";
      case Mudavim.kumru:
        return "(400+)";
      case Mudavim.doner:
        return "(3000+)";
      case Mudavim.tomsBurger:
        return "(9000+)";
      case Mudavim.cajun:
        return "(1000+)";
    }
  }

  String get toTimeAndMinPrice {
    switch (this) {
      case Mudavim.hamburger:
        return "50 dk·Min 140 TL";
      case Mudavim.kofte:
        return "45 dk·Min 100 TL";
      case Mudavim.patso:
        return "30 dk·Min 70 TL";
      case Mudavim.kumru:
        return "30 dk·Min 70 TL";
      case Mudavim.doner:
        return "40 dk·Min 90 TL";
      case Mudavim.tomsBurger:
        return "55 dk·Min 200 TL";
      case Mudavim.cajun:
        return "45 dk·Min 400 TL";
    }
  }
}
