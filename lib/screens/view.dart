import 'package:flutter/material.dart';
import 'package:flutter_application_6/Provider/products_provider.dart';
import 'package:flutter_application_6/screens/productitem.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import '../Provider/products_provider.dart';
import '../data/data.dart';
import '../model/fruits_vegtables.dart';
import '../screens/add_product.dart';
import '../screens/fresh_fruits.dart';
import '../screens/sign_in.dart';
import '../screens/product_details.dart';
import '../screens/my_account.dart';
import '../screens/view.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'cart.dart';

class view extends StatelessWidget {
  //static const routeName = '/view';
  final bool fav;

  const view(this.fav);
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Products>(context);
    final products = fav ? data.FavouriteItems : data.items;
    return products.isEmpty
        ? const Center(child: Text("No products"))
        : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //For Daily Fresh Text
                const Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 20),
                  child: Text('Daily Fresh',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 28)),
                ),
                //For List Displaying
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: products.length,
                  itemBuilder: (context, index) => ChangeNotifierProvider.value(
                    value: products[index],
                    child: ProductItems(),
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 1.0,
                      mainAxisSpacing: 1.0),
                ),
                //const FreshFruits(),
              ],
            ),
            //Fresh Fruits
          );
  }
  /*
        GridView.builder(
            padding: EdgeInsets.all(10),
            itemCount: products.length,
            itemBuilder: (context, index) => ChangeNotifierProvider.value(
              value: products[index],
              child: ProductItems(),
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
          );*/
}
