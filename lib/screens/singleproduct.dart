import 'package:flutter/material.dart';
import 'package:flutter_application_6/Provider/products_provider.dart';
import 'package:provider/provider.dart';

class singleproduct extends StatelessWidget {
  const singleproduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final loadedProduct =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(loadedProduct.title),
              background: Hero(
                tag: loadedProduct.id,
                child: Image.asset(loadedProduct.imagename, fit: BoxFit.cover),
              ),
            ),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              [
                //SizedBox(height: 10),
                Text(
                  '\$${loadedProduct.price}',
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: size.width,
                  child: Text(loadedProduct.description,
                      textAlign: TextAlign.center, softWrap: true),
                ),
              ];
            }),
          ),
        ],
      ),
    );
  }
}
