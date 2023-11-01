import 'package:flutter/material.dart';
import 'package:market_app/feature/note/domain/entities/getir_yemek_restaurant.dart';

class ChainItem extends StatelessWidget {
  const ChainItem({super.key, required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 70,
              left: 10,
              right: 10,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: Image.asset(
                restaurant.toImage,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 20,
            ),
            child: Container(
              width: restaurant == Restaurant.doner ? 180 : 150,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  restaurant == Restaurant.doner
                      ? const Icon(
                          Icons.card_giftcard,
                          color: Colors.deepPurple,
                        )
                      : const Icon(
                          Icons.diamond,
                          color: Colors.deepPurple,
                        ),
                  Text(
                    restaurant == Restaurant.doner
                        ? "Yerel Zincir Restoranlar"
                        : "Bu Ay Müdavim'de",
                    style: const TextStyle(
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 165,
            ),
            child: Container(
              width: 75,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on,
                  ),
                  Text(
                    restaurant.toLocation,
                    style: const TextStyle(
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  top: 220,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: 300,
                      child: Text(
                        restaurant.toText,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.deepPurple,
                          ),
                          Text(
                            restaurant.toStar,
                            style: const TextStyle(
                              color: Colors.deepPurple,
                            ),
                          ),
                          Text(
                            restaurant.toNumberOrders,
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 7,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 245),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.r_mobiledata_rounded,
                    ),
                    Text(
                      restaurant.toTimeAndMinPrice,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
