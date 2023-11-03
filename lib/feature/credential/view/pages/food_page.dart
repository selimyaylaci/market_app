///////////// TODO: Export edilmeli.
import 'package:carousel_slider/carousel_slider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../../core/_core_exports.dart';
import '../../../_feature_exports.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  /// TODO: Yeni bir controller oluşturup, onun içerisinden döndürmen lazım.
  final RxInt activeIndex = 0.obs;
  //final FoodController foodController = Get.put(FoodController());
  final CarouselController carouselController = CarouselController();
  final getirFoodImages = [
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
        backgroundColor: Colors.deepPurple,
        title: Padding(
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Image.asset(
            "assets/getiryemekAppBar.png",
            height: 25,
            width: 200,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future<void>.delayed(
            const Duration(seconds: 1),
          );
        },
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              titleSpacing: -20,
              backgroundColor: Colors.white,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Text(
                      "İş,",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),

                  ////////// TODO: 330 ekrana göre değişebilir. Düzenle.
                  Expanded(
                    child: Container(
                      height: kToolbarHeight,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                      ),
                      child: const Text(
                        "skycity mh, 1234 Sokak,Bina no 2 kat: 18",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
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
            SliverAppBar(
              leading: Container(),
              backgroundColor: Colors.transparent,
              expandedHeight: 230,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CarouselSlider.builder(
                    carouselController:
                        // serviceLocator<FoodController>().carouselController,
                        carouselController,
                    itemCount:
                        //serviceLocator<FoodController>().getirFoodImages.length,
                        getirFoodImages.length,
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),

                      ////////// TODO: Sistem genelinde bütün yapıların tiplerini başlarında belirt.
                      ////////// TODO: Sistem geneli bütün ifadeler İNGİLİZCE olmak zorunda.
                      // onPageChanged: (index, reason) => activeIndex.value = index,
                      onPageChanged: (final int index,
                          final CarouselPageChangedReason reason) {
                        return activeIndex.value = index;
                      },
                      enlargeCenterPage: true,
                    ),
                    itemBuilder:
                        (BuildContext context, int index, int realIndex) {
                      final getirFoodImage = getirFoodImages[index];
                      //serviceLocator<FoodController>().getirFoodImages[index];
                      return CarouselImageItem(
                        image: getirFoodImage,
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        height: 300,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            FoodTypeUp.values.length,
                            (index) {
                              /// TODO: Burası yanlış. Tek tipte toplanacak.
                              final FoodTypeUp foodTypeUp =
                                  FoodTypeUp.values[index];
                              final FoodTypeDown foodTypeDown =
                                  FoodTypeDown.values[index];
                              return buildFoodType(foodTypeUp, foodTypeDown);
                              /*  FoodSuggestionsItem(
                                icons: foodTypeUp.toIcons,
                                image: foodTypeUp.toImage,
                                text: foodTypeUp.toText,
                              ); */
                            },
                          ),
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
                                      borderSide: const BorderSide(
                                          color: Colors.transparent),
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
                                  child: const Column(
                                    children: [
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
                        height: 135,
                        width: 400,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Expanded(
                                        child: Text(
                                          "GetirYemek Müdavim",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(
                                          Icons.keyboard_arrow_right,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text(
                                      "Her 3 siparişin ardından 75TL indirim!"),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: StepProgressIndicator(
                                          totalSteps: 3,
                                          currentStep: 2,
                                          selectedColor: Colors.deepPurple,
                                          unselectedColor: Colors.grey,

                                          /////// TODO: Kontrolü index üzerinden yapman lazım.
                                          //////// Widgetları iki kere oluşturmak yerine sadece renkleri kontrol et.
                                          customStep: (int index, color, _) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                left: 5,
                                                right: 5,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                boxShadow: const [
                                                  BoxShadow(
                                                    color: Color.fromARGB(
                                                        255, 223, 213, 249),
                                                    spreadRadius: 3,
                                                    offset: Offset(0, 10),
                                                  ),
                                                ],
                                              ),
                                              child: Icon(
                                                Icons.diamond,
                                                color:
                                                    color == Colors.deepPurple
                                                        ? Colors.deepPurple
                                                        : Colors.grey,
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Text(
                                          "2/3",
                                          style: TextStyle(
                                            color: Colors.deepPurple,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const TypeTitlesItem(
                        title: "Müdavim Restoranları",
                        title2: null,
                        title3: null,
                        title4: null,
                      ),
                      SizedBox(
                        height: 280,
                        width: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Restaurant.values.length,
                          itemBuilder: (context, index) {
                            //final Restaurant restaurant =Restaurant.values[index];
                            return RegularItem(
                              restaurant: Restaurant.values[index],
                              discount: null,
                            );
                          },
                        ),
                      ),
                      const TypeTitlesItem(
                        title: null,
                        title2: "Limitsiz İndirimler",
                        title3: null,
                        title4: null,
                      ),
                      SizedBox(
                        height: 280,
                        width: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Restaurant.values.length,
                          itemBuilder: (context, index) {
                            final Restaurant restaurant =
                                Restaurant.values[index];
                            return RegularItem(
                              restaurant: Restaurant.values[index],
                              discount: restaurant.hashCode,
                            );
                          },
                        ),
                      ),
                      const TypeTitlesItem(
                        title: null,
                        title2: null,
                        title3: "Zincir Restoranlar",
                        title4: null,
                      ),
                      SizedBox(
                        height: 280,
                        width: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Restaurant.values.length,
                          itemBuilder: (context, index) {
                            //final Restaurant restaurant =Restaurant.values[index];
                            return ChainItem(
                              restaurant: Restaurant.values[index],
                            );
                          },
                        ),
                      ),
                      const TypeTitlesItem(
                        title: null,
                        title2: null,
                        title3: null,
                        title4: "Mutfaklar",
                      ),
                      SizedBox(
                        height: 150,
                        width: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Categories.values.length,
                          itemBuilder: (context, index) {
                            //final Categories categories =Categories.values[index];
                            return FoodKitchenItem(
                              categories: Categories.values[index],
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text(
                              "Tüm Restoranlar (7)",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          Text(
                            "Görünüm",
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              ////////// TODO: app_icon_button
                              AppIconButton(),
                              SizedBox(
                                width: 5,
                              ),
                              AppIconButtonTwo(),
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 500,
                        width: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: Restaurant.values.length,
                          itemBuilder: (context, index) {
                            //final Restaurant restaurant = Restaurant.values[index];
                            return AllRestaurants(
                              restaurant: Restaurant.values[index],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
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
                child: foodTypeUp.toIcons,
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
