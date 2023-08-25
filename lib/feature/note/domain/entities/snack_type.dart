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
        return "chips";
      case SnackType.nuts:
        return "nuts";
      case SnackType.cake:
        return "cake";
      case SnackType.biscuit:
        return "biscuit";
      case SnackType.chocolate:
        return "chocolate";
      case SnackType.iceCream:
        return "iceCream";
      case SnackType.sweet:
        return "sweet";
      case SnackType.coffee:
        return "coffee";
      case SnackType.tea:
        return "tea";
      case SnackType.water:
        return "water";
    }
  }

  int get toPrice {
    switch (this) {
      case SnackType.chips:
        return 24;
      case SnackType.nuts:
        return 35;
      case SnackType.cake:
        return 7;
      case SnackType.biscuit:
        return 11;
      case SnackType.chocolate:
        return 70;
      case SnackType.iceCream:
        return 40;
      case SnackType.sweet:
        return 250;
      case SnackType.coffee:
        return 80;
      case SnackType.tea:
        return 10;
      case SnackType.water:
        return 5;
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
}


class Product1{
  final List<SnackType> createSnack = [SnackType.values.single];

  void addSnack1(SnackType snack){
    //createSnack.add(snack);
    SnackType.values.add(snack);
  }
}