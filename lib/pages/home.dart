import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodies/models/category_model.dart';
import 'package:foodies/models/diets_model.dart';
import 'package:foodies/models/popular_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> category = [];
  List<DietModel> diets = [];
  List<PopularDietsModel> popularDiets = [];

  void _getInitialInfo() {
    category = CategoryModel.getCategory();
    diets = DietModel.getDiets();
    popularDiets = PopularDietsModel.getPopularDiets();
  }

  @override
  void initState() {
    _getInitialInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          "Foodies",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {},
          child: Container(
            width: 30,
            height: 30,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF7F8F8),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              "assets/icons/Arrow - Left 2.svg",
              width: 20,
              height: 20,
            ),
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 37,
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFF7F8F8),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: SvgPicture.asset(
                "assets/icons/dots.svg",
                width: 5,
                height: 5,
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          _searchField(),
          const SizedBox(height: 40),
          _categoriesSection(),
          const SizedBox(height: 40),
          _dietSection(),
          const SizedBox(height: 40),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text(
                  "Popular",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
          const SizedBox(height: 40),
          ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsets.only(left: 25, right: 25),
            itemBuilder: (context, index) {
              return Container(
                height: 100,
                decoration: BoxDecoration(
                  color: popularDiets[index].boxIsSelected ? Colors.white : Colors.transparent,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: popularDiets[index].boxIsSelected
                      ? [
                          BoxShadow(
                            color: const Color(0xFF1D1617).withOpacity(0.07),
                            spreadRadius: 0.0,
                            blurRadius: 40,
                            offset: const Offset(0, 10),
                          ),
                        ]
                      : [],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      popularDiets[index].iconPath,
                      width: 65,
                      height: 65,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          popularDiets[index].name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "${popularDiets[index].level} | ${popularDiets[index].duration} | ${popularDiets[index].calorie}",
                          style: const TextStyle(
                            color: Color(0xFF7B6F72),
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: SvgPicture.asset("assets/icons/button.svg"),
                    )
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 25,
            ),
            itemCount: popularDiets.length,
          )
        ],
      ),
    );
  }

  Column _dietSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "Recommendation\nfor Diet",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 240,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            scrollDirection: Axis.horizontal,
            itemCount: diets.length,
            itemBuilder: (context, index) {
              return Container(
                width: 210,
                decoration: BoxDecoration(
                  color: diets[index].boxColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SvgPicture.asset(
                      diets[index].iconPath,
                    ),
                    Text(
                      diets[index].name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "${diets[index].level} | ${diets[index].duration} | ${diets[index].calorie}",
                      style: const TextStyle(
                        color: Color(0xFF7B6F72),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Container(
                      width: 130,
                      height: 45,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(colors: [
                            diets[index].viewIsSelected ? const Color(0xFF9DCEFF) : Colors.transparent,
                            diets[index].viewIsSelected ? const Color(0xFF92A3FD) : Colors.transparent,
                          ])),
                      alignment: Alignment.center,
                      child: Text(
                        "View",
                        style: TextStyle(
                          color: diets[index].viewIsSelected ? Colors.white : const Color(0xFFC58BF2),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text(
            "Categories",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            scrollDirection: Axis.horizontal,
            itemCount: category.length,
            itemBuilder: (context, index) {
              return Container(
                width: 100,
                decoration: BoxDecoration(
                  color: category[index].boxColor.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          category[index].iconPath,
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    Text(
                      category[index].name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Container _searchField() {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 40,
      ),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: const Color(0xFF1D1617).withOpacity(0.11),
          spreadRadius: 0.0,
          blurRadius: 40,
          offset: const Offset(0, 3),
        ),
      ]),
      child: TextField(
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.all(15),
            hintText: "Search for food",
            hintStyle: const TextStyle(
              color: Color(0xFFDDDADA),
              fontSize: 14,
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(12.0),
              child: SvgPicture.asset(
                "assets/icons/Search.svg",
                width: 20,
                height: 20,
              ),
            ),
            suffixIcon: SizedBox(
              width: 100,
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const VerticalDivider(
                      color: Colors.black,
                      indent: 10,
                      endIndent: 10,
                      thickness: 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        "assets/icons/Filter.svg",
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
