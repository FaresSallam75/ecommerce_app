// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DesignPage extends StatefulWidget {
  const DesignPage({super.key});

  @override
  State<DesignPage> createState() => _DesignPageState();
}

class _DesignPageState extends State<DesignPage> {
  int currentPage = 0;
  int currentPageTwo = 0;

  changeButton(int index) {
    currentPage = index;
  }

  changeButtonTwo(int index) {
    currentPageTwo = index;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List textPage = [
      "العروض",
      "اطارات",
      "روتات",
      "الغرف",
      "الملفات",
    ];

    List textPageTwo = [
      "سنه",
      "6 شهر",
      "3 شهر",
      "شهر",
    ];

    List cardTopText = [
      "ملف محمي مميز بخلفية",
      "ملف محمي عادي",
      "ملف ملكي عادي بدون خلفية",
      "ملف ملكي VIP مميز بخلفية",
      // "ملف ملكي عادي بدون خلفية",
    ];

    List uniqueText = [
      "ملف شخصي",
      "حالة تحت الأسم",
      "صورة شخصية بجانب الأسم",
      "إرسال الصور في العام والخاص",
      "Vip مجموعة من الشعارات",
      "اطارات الصورة الشخصية",
      "إسم مميز علي العام",
      "أكثر من 90 خلفية للإسم",
      "إختيار خلفية من جهازك",
    ];

    List listText = ["ملف شخصي", "ارسال الصور في العام والخاص", "بدون خلفية"];

    List iconCard = [
      Icon(
        Icons.countertops_outlined,
        color: Colors.cyan,
        size: 15,
      ),
      Icon(
        Icons.countertops_outlined,
        color: Colors.black,
        size: 15,
      ),
      Icon(
        Icons.king_bed,
        color: Colors.yellow,
        size: 15,
      ),
      Icon(
        Icons.king_bed,
        color: Colors.yellow,
        size: 15,
      ),
      /*   Icon(
        Icons.king_bed,
        color: Colors.orange.shade800,
        size: 15,
      ), */
    ];

    List cardColors = [
      Colors.black.withOpacity(0.5),
      Colors.white60,
      Colors.white60,
      Colors.red.shade200,
      // Colors.grey.shade300,
    ];

    List cardImages = [
      "assets/images/use.png",
      "assets/images/use.png",
      "assets/images/im1.png",
      "assets/images/im1.png",
    ];

    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ...List.generate(
                textPage.length,
                (index) => customPage(() {
                  changeButton(index);
                  setState(() {});
                }, textPage[index], currentPage == index ? true : false),
              )
            ],
          ),
          // const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: Row(
              children: [
                ...List.generate(
                  textPageTwo.length,
                  (ind) => customPage(() {
                    changeButtonTwo(ind);
                    setState(() {});
                  }, textPageTwo[ind], currentPageTwo == ind ? true : false),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: cardTopText.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.5,
                mainAxisSpacing: 30.0,
              ),
              itemBuilder: (context, index) => Card(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      CustomTopTextCard(topText: cardTopText[index]),
                      const SizedBox(height: 30),
                      CustomBodyTextCard(bodyText: listText[0]),
                      const SizedBox(height: 5),
                      CustomBodyTextCard(
                        bodyText: listText[1],
                      ),
                      const SizedBox(height: 5),
                      CustomBodyTextCard(bodyText: listText[2]),
                      const SizedBox(height: 15),
                      CustomCardBody(
                          color: cardColors[index],
                          colorIcon: Colors.black,
                          text: cardTopText[index],
                          icon: iconCard[index],
                          backgroundImage: AssetImage(cardImages[index])),
                      Container(
                        margin: const EdgeInsets.only(top: 15),
                        child: const Text(
                          "\$السعر: 50",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: "sans"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: MaterialButton(
                          height: 40,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          minWidth: MediaQuery.of(context).size.width,
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: () {},
                          child: const Text(
                            "شراء",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 15),
          GridView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.3,
            ),
            children: [
              Card(
                child: Container(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      CustomTopTextCard(topText: "ملف ملكي عادي بدون خلفية"),
                      const SizedBox(height: 50),
                      CustomBodyTextCard(bodyText: uniqueText[0]),
                      const SizedBox(height: 5),
                      CustomBodyTextCard(
                        bodyText: uniqueText[1],
                      ),
                      const SizedBox(height: 5),
                      CustomBodyTextCard(bodyText: uniqueText[2]),
                      const SizedBox(height: 5),
                      CustomBodyTextCard(bodyText: uniqueText[3]),
                      const SizedBox(height: 5),
                      CustomBodyTextCard(bodyText: uniqueText[4]),
                      const SizedBox(height: 5),
                      CustomBodyTextCard(bodyText: uniqueText[5]),
                      const SizedBox(height: 5),
                      CustomBodyTextCard(bodyText: uniqueText[6]),
                      const SizedBox(height: 5),
                      CustomBodyTextCard(bodyText: uniqueText[7]),
                      const SizedBox(height: 5),
                      CustomBodyTextCard(bodyText: uniqueText[8]),
                      const SizedBox(height: 15),
                      CustomCardBody(
                        color: Colors.grey.shade300,
                        colorIcon: Colors.black,
                        text: "ملف ملكي عادي بدون خلفية",
                        icon: Icon(
                          Icons.king_bed,
                          color: Colors.orange.shade800,
                          size: 15,
                        ),
                        backgroundImage: const AssetImage(
                          "assets/images/use.png",
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 25),
                        child: const Text(
                          "\$السعر: 50",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontFamily: "sans"),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 15),
                        child: MaterialButton(
                          height: 40,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          minWidth: MediaQuery.of(context).size.width,
                          color: Colors.orange,
                          textColor: Colors.white,
                          onPressed: () {},
                          child: const Text(
                            "شراء",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget customPage(void Function()? onPressed, String text, bool isActive) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: MaterialButton(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            side: BorderSide(color: Colors.orange),
          ),
          textColor: isActive ? Colors.white : Colors.orange,
          color: isActive ? Colors.orange : Colors.white,
          onPressed: onPressed,
          child: Text(
            text,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class CustomTopTextCard extends StatelessWidget {
  final String topText;
  const CustomTopTextCard({super.key, required this.topText});

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
      width: MediaQuery.of(context).size.width - 230,
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(12),
        ),
      ),
      child: Text(
        topText,
        style: const TextStyle(
            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CustomBodyTextCard extends StatelessWidget {
  final String bodyText;
  const CustomBodyTextCard({
    super.key,
    required this.bodyText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 230,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Text(
        bodyText,
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class CustomCardBody extends StatelessWidget {
  final Color color;
  final Color colorIcon;
  final String text;
  final ImageProvider<Object>? backgroundImage;
  final Icon icon;
  const CustomCardBody({
    super.key,
    required this.color,
    required this.text,
    required this.backgroundImage,
    required this.colorIcon,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.shade300,
      elevation: 10.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            Text(
              text,
              style: TextStyle(
                  shadows: [
                    Shadow(
                      color: Colors.yellowAccent.shade700,
                      blurRadius: 10.0,
                      offset: Offset.zero,
                    ),
                  ],
                  fontSize: 10,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            CircleAvatar(radius: 20, backgroundImage: backgroundImage),
          ],
        ),
      ),
    );
  }
}
