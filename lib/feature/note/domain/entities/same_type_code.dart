enum SameCodeType {
  getirsepet,
  getirYemek,
  getirCarsi,
  getirSu,
  getirBuyuk,
  getirIs,
  getirN11,
}

extension SameCodeTypeExtension on SameCodeType {
  String get toText {
    switch (this) {
      case SameCodeType.getirsepet:
        return "getir";
      case SameCodeType.getirYemek:
        return "getiryemek";
      case SameCodeType.getirCarsi:
        return "getirçarşı";
      case SameCodeType.getirSu:
        return "getirsu";
      case SameCodeType.getirBuyuk:
        return "getirbüyük";
      case SameCodeType.getirIs:
        return "getiriş";
      case SameCodeType.getirN11:
        return "n11";
    }
  }

  String get toImage {
    switch (this) {
      case SameCodeType.getirsepet:
        return "assets/getirsepetremove.png";
      case SameCodeType.getirYemek:
        return "assets/getiryemekremove.png";
      case SameCodeType.getirCarsi:
        return "assets/getircarsiremove.png";
      case SameCodeType.getirSu:
        return "assets/getirsuremove.png";
      case SameCodeType.getirBuyuk:
        return "assets/getirbuyukremove.png";
      case SameCodeType.getirIs:
        return "assets/getirisremove.png";
      case SameCodeType.getirN11:
        return "assets/getirn11remove.png";
    }
  }
}
