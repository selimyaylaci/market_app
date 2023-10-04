import 'package:carousel_slider/carousel_slider.dart';
import 'package:market_app/feature/note/domain/entities/same_food_down.dart';
import 'package:market_app/feature/note/domain/entities/same_food_up.dart';
import '../../../../core/_core_exports.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final RxInt activeIndex = 0.obs;
  final CarouselController controller = CarouselController();
  final getirYemekImages = [
    "assets/getiryemek1.jpeg",
    "assets/getiryemek2.jpeg",
    "assets/getiryemek3.webp",
    "assets/getiryemek4.jpeg",
    "assets/getiryemek5.webp",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 227, 227),
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 15,
              height: 57,
              color: Colors.white,
            ),
            Container(
              height: kToolbarHeight,
              width: 280,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: const Text(
                "skycity mh, 1234 Sokak,Bina no 2",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              height: kToolbarHeight,
              width: 50,
              color: Colors.white,
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future<void>.delayed(
            const Duration(seconds: 3),
          );
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CarouselSlider.builder(
                carouselController: controller,
                itemCount: getirYemekImages.length,
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  //viewportFraction: 1,
                  onPageChanged: (index, reason) => activeIndex.value = index,
                  enlargeCenterPage: true,
                ),
                itemBuilder: (context, index, realIndex) {
                  final getirYemekImage = getirYemekImages[index];
                  return buildYemekImage(getirYemekImage, index);
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: 398,
              height: 300,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(FoodTypeUp.values.length, (index) {
                  final FoodTypeUp foodTypeUp = FoodTypeUp.values[index];
                  final FoodTypeDown foodTypeDown = FoodTypeDown.values[index];
                  return buildFoodType(foodTypeUp, foodTypeDown);
                }),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                      ),
                      width: 200,
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Colors.deepPurple,
                          ),
                          hintText: "Canın ne çekiyor ?",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        height: 55,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: const [
                            Icon(
                              Icons.filter_list_rounded,
                              color: Colors.deepPurple,
                            ),
                            Text(
                              "Filtre",
                              style: TextStyle(
                                color: Colors.deepPurple,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 110,
              width: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.white,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "GetirYemek Müdavim",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildYemekImage(String getirYemekImage, int index) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.asset(
        getirYemekImage,
        fit: BoxFit.cover,
        width: 380,
      ),
    );
  }

  buildFoodType(FoodTypeUp foodTypeUp, FoodTypeDown foodTypeDown) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: 70,
                height: 70,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color.fromARGB(255, 213, 205, 239),
                ),
                child: foodTypeUp.toImage,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(foodTypeUp.toText),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Image.asset(
                    foodTypeDown.toImage,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(foodTypeDown.toText),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
