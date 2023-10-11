import 'package:carousel_slider/carousel_slider.dart';
import 'package:market_app/feature/note/_note_exports.dart';
import 'package:market_app/feature/note/domain/entities/getir_yemek_mutfak.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
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
                  Container(
                    height: kToolbarHeight,
                    width: 330,
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
                    carouselController: controller,
                    itemCount: getirYemekImages.length,
                    options: CarouselOptions(
                      height: 200,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      onPageChanged: (index, reason) => activeIndex.value = index,
                      enlargeCenterPage: true,
                    ),
                    itemBuilder: (context, index, realIndex) {
                      final getirYemekImage = getirYemekImages[index];
                      return buildYemekImage(getirYemekImage, index);
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
                                      const Text(
                                        "GetirYemek Müdavim",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 185,
                                        ),
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: const Icon(
                                            Icons.keyboard_arrow_right,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Text("Her 3 siparişin ardından 75TL indirim!"),
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
                                          customStep: (index, color, _) => color == Colors.deepPurple
                                              ? Container(
                                                  margin: const EdgeInsets.only(
                                                    left: 5,
                                                    right: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Color.fromARGB(255, 223, 213, 249),
                                                        spreadRadius: 3,
                                                        offset: Offset(0, 10),
                                                      ),
                                                    ],
                                                  ),
                                                  child: const Icon(
                                                    Icons.diamond,
                                                    color: Colors.deepPurple,
                                                  ),
                                                )
                                              : Container(
                                                  margin: const EdgeInsets.only(
                                                    left: 5,
                                                    right: 5,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Color.fromARGB(255, 239, 234, 255),
                                                        spreadRadius: 3,
                                                        offset: Offset(0, 10),
                                                      ),
                                                    ],
                                                  ),
                                                  child: const Icon(
                                                    Icons.diamond,
                                                    color: Colors.grey,
                                                  ),
                                                ),
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
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              left: 18,
                            ),
                            child: Text(
                              "Müdavim Restoranları",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              left: 115,
                            ),
                            child: Text(
                              "Tümünü Gör (5)",
                              style: TextStyle(
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 280,
                        width: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Mudavim.values.length,
                          itemBuilder: (context, index) {
                            final Mudavim mudavim = Mudavim.values[index];
                            return buildMudavim(mudavim);
                          },
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              left: 18,
                            ),
                            child: Text(
                              "Limitsiz İndirimler",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              left: 140,
                            ),
                            child: Text(
                              "Tümünü Gör (5)",
                              style: TextStyle(
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 280,
                        width: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Mudavim.values.length,
                          itemBuilder: (context, index) {
                            final Mudavim mudavim = Mudavim.values[index];
                            return buildLimit(mudavim);
                          },
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              left: 18,
                            ),
                            child: Text(
                              "Zincir Restoranlar",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              left: 140,
                            ),
                            child: Text(
                              "Tümünü Gör (5)",
                              style: TextStyle(
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 280,
                        width: 400,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: Mudavim.values.length,
                          itemBuilder: (context, index) {
                            final Mudavim mudavim = Mudavim.values[index];
                            return buildZincir(mudavim);
                          },
                        ),
                      ),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              left: 18,
                            ),
                            child: Text(
                              "Mutfaklar",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 25,
                              left: 190,
                            ),
                            child: Text(
                              "Tümünü Gör (5)",
                              style: TextStyle(
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 25),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.keyboard_arrow_right,
                                color: Colors.deepPurple,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 150,
                        width: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: FoodKitchen.values.length,
                          itemBuilder: (context, index) {
                            final FoodKitchen foodKitchen = FoodKitchen.values[index];
                            return buildFoodKitchen(foodKitchen);
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

  Widget buildMudavim(Mudavim mudavim) {
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
                mudavim.toImage,
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
              child: Row(
                children: const [
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
                    mudavim.toLocation,
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
                        mudavim.toText,
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
                            mudavim.toStar,
                            style: const TextStyle(
                              color: Colors.deepPurple,
                            ),
                          ),
                          Text(
                            mudavim.toNumberOrders,
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
                      mudavim.toTimeAndMinPrice,
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

  Widget buildLimit(Mudavim mudavim) {
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
                mudavim.toImage,
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
              child: Row(
                children: const [
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
                    mudavim.toDiscount,
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
                    mudavim.toLocation,
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
                        mudavim.toText,
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
                            mudavim.toStar,
                            style: const TextStyle(
                              color: Colors.deepPurple,
                            ),
                          ),
                          Text(
                            mudavim.toNumberOrders,
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
                      mudavim.toTimeAndMinPrice,
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

  Widget buildZincir(Mudavim mudavim) {
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
                mudavim.toImage,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 20,
            ),
            child: Container(
              width: mudavim == Mudavim.doner ? 180 : 150,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  /* const Icon(
                   mudavim == Mudavim.doner ? Icons.abc : Icons.abc_outlined,
                    color: Colors.deepPurple,
                  ),  */
                  mudavim == Mudavim.doner
                      ? const Icon(
                          Icons.card_giftcard,
                          color: Colors.deepPurple,
                        )
                      : const Icon(
                          Icons.diamond,
                          color: Colors.deepPurple,
                        ),
                  Text(
                    mudavim == Mudavim.doner ? "Yerel Zincir Restoranlar" : "Bu Ay Müdavim'de",
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
                    mudavim.toLocation,
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
                        mudavim.toText,
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
                            mudavim.toStar,
                            style: const TextStyle(
                              color: Colors.deepPurple,
                            ),
                          ),
                          Text(
                            mudavim.toNumberOrders,
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
                      mudavim.toTimeAndMinPrice,
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

  Widget buildFoodKitchen(FoodKitchen foodKitchen) {
    return Container();
  }
}
