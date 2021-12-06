import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:testing_mobile_project/data/data.dart';
import 'package:testing_mobile_project/model/fruits_vegtables.dart';
import 'package:testing_mobile_project/screen/freshfruits.dart';
import 'package:testing_mobile_project/screen/test.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: const Padding(
          padding: EdgeInsets.only(),
          child: Icon(
            Icons.short_text_rounded,
            color: Colors.black,
            size: 28,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Test()),
                  );
                },
                icon: const Icon(Icons.logout, color: Colors.black)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //For Search Bar

            Material(
              elevation: 10.0,
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.red,
            ),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 50 * 0.75,
                  horizontal: 50,
                ),
                fillColor: Colors.white,
                hintText: 'Search here....',
                suffixIcon:
                    Icon(Icons.search_rounded, size: 25, color: Colors.black),
              ),
            ),
            //For Daily Fresh Text
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: Text('Daily Fresh',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
            ),
            //For List Displaying
            ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: dailyFreshList.length,
                itemBuilder: (context, index) {
                  return _buildDailyFresh(context, index);
                }),
            const FreshFruits(),
          ],
        ),
        //Fresh Fruits
      ),
    );
  }

  Widget _buildDailyFresh(BuildContext context, int index) {
    Size size = MediaQuery.of(context).size;
    FruitsAndVegs fruitsAndVegs = dailyFreshList[index];
    return Stack(children: [
      Padding(
        padding: const EdgeInsets.only(left: 100, right: 48 / 2, bottom: 48),
        child: Container(
          width: size.width * 0.55,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: const Offset(5, 5),
                blurRadius: 10,
              )
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(50 / 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  fruitsAndVegs.imagename,
                  height: size.height * 0.23,
                  fit: BoxFit.contain,
                ),
                Text(
                  fruitsAndVegs.name,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  fruitsAndVegs.description,
                  style: const TextStyle(
                      fontSize: 12, fontWeight: FontWeight.w300),
                ),
                Text(
                  fruitsAndVegs.price.toStringAsFixed(2) + 'EGP',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
      Positioned(
        right: 45 * 2,
        bottom: 110 / 2,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(3, 3),
                blurRadius: 3,
              )
            ],
          ),
          child: Row(
            children: const [
              Icon(Icons.favorite_rounded),
              Text('Save'),
            ],
          ),
        ),
      )
    ]);
  }
}
