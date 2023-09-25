enum SnackType {
  chips,
  nuts,
  cake,
  biscuit,
  chocolate,
  iceCream,
  sweet,
  coffee,
  tea,
  water,
}

extension SnackTypeExtension on SnackType {
  int get toId {
    switch (this) {
      case SnackType.chips:
        return 1;
      case SnackType.nuts:
        return 2;
      case SnackType.cake:
        return 3;
      case SnackType.biscuit:
        return 4;
      case SnackType.chocolate:
        return 5;
      case SnackType.iceCream:
        return 6;
      case SnackType.sweet:
        return 7;
      case SnackType.coffee:
        return 8;
      case SnackType.tea:
        return 9;
      case SnackType.water:
        return 10;
    }
  }

  String get toText {
    switch (this) {
      case SnackType.chips:
        return "Chips";
      case SnackType.nuts:
        return "Nuts";
      case SnackType.cake:
        return "Cake";
      case SnackType.biscuit:
        return "Biscuit";
      case SnackType.chocolate:
        return "Chocolate";
      case SnackType.iceCream:
        return "IceCream";
      case SnackType.sweet:
        return "Sweet";
      case SnackType.coffee:
        return "Coffee";
      case SnackType.tea:
        return "Tea";
      case SnackType.water:
        return "Water";
    }
  }

  int get toPrice {
    switch (this) {
      case SnackType.chips:
        return 24;
      case SnackType.nuts:
        return 35;
      case SnackType.cake:
        return 100;
      case SnackType.biscuit:
        return 11;
      case SnackType.chocolate:
        return 5;
      case SnackType.iceCream:
        return 40;
      case SnackType.sweet:
        return 20;
      case SnackType.coffee:
        return 80;
      case SnackType.tea:
        return 100;
      case SnackType.water:
        return 13;
    }
  }

  String get toImage {
    switch (this) {
      case SnackType.chips:
        return "assets/chips.jpeg";
      case SnackType.nuts:
        return "assets/nuts.jpeg";
      case SnackType.cake:
        return "assets/cake.jpeg";
      case SnackType.biscuit:
        return "assets/biscuit.jpeg";
      case SnackType.chocolate:
        return "assets/chocolate.jpeg";
      case SnackType.iceCream:
        return "assets/iceCream.jpeg";
      case SnackType.sweet:
        return "assets/sweet.jpeg";
      case SnackType.coffee:
        return "assets/coffee.jpeg";
      case SnackType.tea:
        return "assets/tea.jpeg";
      case SnackType.water:
        return "assets/water.jpeg";
    }
  }

  int get toDiscount {
    switch (this) {
      case SnackType.chips:
        return 0;
      case SnackType.nuts:
        return 0;
      case SnackType.cake:
        return toPrice.toInt() * 10 ~/ 100;
      case SnackType.biscuit:
        return 0;
      case SnackType.chocolate:
        return 0;
      case SnackType.iceCream:
        return 0;
      case SnackType.sweet:
        return 0;
      case SnackType.coffee:
        return 0;
      case SnackType.tea:
        return toPrice.toInt() * 25 ~/ 100;
      case SnackType.water:
        return 0;
    }
  }
}
