///////////// TODO: Export edilmeli.
import 'package:carousel_slider/carousel_slider.dart';
import 'package:market_app/feature/credential/view/widgets/regular_item.dart';
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
                      //width: 330,
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
                        // width: 398,
                        height: 300,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                        ),
                        child: /* Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: FoodTypeUp.values.map((foodTypeUp) {
                              return FoodSuggestionsItem(
                                icons: foodTypeUp.toIcons,
                                image: foodTypeUp.toImage,
                                text: foodTypeUp.toText,
                              );
                            }).toList(),
                          ) */

                            Row(
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
                                          //size: 50,
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
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const Expanded(
                            child: Text(
                              "Müdavim Restoranları",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const Text(
                            "Tümünü Gör (5)",
                            style: TextStyle(
                              color: Colors.deepPurple,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
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
                            );
                            //buildMudavim(restaurant);
                          },
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const Expanded(
                            child: Text(
                              "Limitsiz İndirimler",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const Text(
                            "Tümünü Gör (5)",
                            style: TextStyle(
                              color: Colors.deepPurple,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
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
                            return buildLimit(restaurant);
                          },
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const Expanded(
                            child: Text(
                              "Zincir Restoranlar",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const Text(
                            "Tümünü Gör (5)",
                            style: TextStyle(
                              color: Colors.deepPurple,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
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
                            return buildZincir(restaurant);
                          },
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 15,
                          ),
                          const Expanded(
                            child: Text(
                              "Mutfaklar",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const Text(
                            "Tümünü Gör (5)",
                            style: TextStyle(
                              color: Colors.deepPurple,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.keyboard_arrow_right,
                              color: Colors.deepPurple,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 150,
                        width: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Categories.values.length,
                          itemBuilder: (context, index) {
                            final Categories categories =
                                Categories.values[index];
                            return buildFoodKitchen(categories);
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
                              /// TODO: app_icon_button
                              AppIconButton(),
                              /*  Container(
                                height: 40,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(10),
                                    topLeft: Radius.circular(10),
                                  ),
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.line_style,
                                    color: Colors.grey,
                                  ),
                                ),
                              ), */
                              SizedBox(
                                width: 5,
                              ),
                              AppIconButtonTwo(),
                              /*  Container(
                                height: 40,
                                decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                  ),
                                  color: Colors.white,
                                ),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.line_weight,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                              ), */
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
                            final Restaurant restaurant =
                                Restaurant.values[index];
                            return buildTumRestoranlar(restaurant);
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

  // Widget buildYemekImage(String getirYemekImage, int index) {
  //   return ClipRRect(
  //     borderRadius: BorderRadius.circular(16.0),
  //     child: Image.asset(
  //       getirYemekImage,
  //       fit: BoxFit.cover,
  //       width: 380,
  //     ),
  //   );
  // }

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

  Widget buildMudavim(Restaurant restaurant) {
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
              width: 90,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.diamond,
                    color: Colors.deepPurple,
                  ),
                  Text(
                    "Müdavim",
                    style: TextStyle(
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

  Widget buildLimit(Restaurant restaurant) {
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
              width: 90,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.diamond,
                    color: Colors.deepPurple,
                  ),
                  Text(
                    "Müdavim",
                    style: TextStyle(
                      color: Colors.deepPurple,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 120,
              top: 20,
            ),
            child: Container(
              width: 180,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.yellow,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.discount,
                    color: Colors.deepPurple,
                  ),
                  Text(
                    restaurant.toDiscount,
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

  Widget buildZincir(Restaurant restaurant) {
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

  Widget buildFoodKitchen(Categories categories) {
    return Container(
      width: 150,
      height: 75,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16.0),
            child: Image.asset(categories.toImage),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 12,
              top: 120,
            ),
            child: Text(
              categories.toText,
              style: const TextStyle(
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTumRestoranlar(Restaurant restaurant) {
    return Container(
      margin: const EdgeInsets.only(
        top: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 209, 197, 197),
                  ),
                  width: 100,
                  height: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      restaurant.toImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 210, 202, 202),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.diamond,
                        color: Colors.deepPurple,
                      ),
                      Text(
                        "Müdavim",
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 120,
                    ),
                    child: SizedBox(
                      width: 140,
                      child: Text(
                        restaurant.toText,
                        style: const TextStyle(fontSize: 20),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 10,
                    ),
                    child: Container(
                      width: 115,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star_rate,
                            color: Colors.deepPurple,
                          ),
                          Text(
                            restaurant.toStar,
                            style: const TextStyle(
                                color: Colors.deepPurple,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Text(
                              restaurant.toNumberOrders,
                              style: const TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 100, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      restaurant.toLocation,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  right: 30,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.r_mobiledata,
                    ),
                    Text(
                      restaurant.toTimeAndMinPrice,
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
