class CreateSnackParams {
  final String id;
  final String name;
  final String price;
  //RxInt quantity;
  int quantity;

  CreateSnackParams({
    required this.id,
    required this.name,
    required this.price,
    required this.quantity,
  });

  /* Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": title,
      "price": price,
      "image": image,
      // dısarı veri yollarken
    };
  } */
}
