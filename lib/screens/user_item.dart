import 'package:flutter/material.dart';
import 'package:flutter_application_6/Provider/products_provider.dart';
import 'package:flutter_application_6/screens/edit_product.dart';
import 'package:provider/provider.dart';

class UserProductItem extends StatelessWidget {
  //static const routeName = '/user-item';
  final String id;
  final String title;
  final String image;
  const UserProductItem(
    this.id,
    this.title,
    this.image,
  );

  @override
  Widget build(BuildContext context) {
    final scaffold = Scaffold.of(context);
    return ListTile(
      title: Text(title),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(image),
      ),
      trailing: Container(
          width: 100,
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditProduct(id: id)),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  try {
                    await Provider.of<Products>(context, listen: false)
                        .deleteProduct(id);
                  } catch (e) {
                    scaffold.showSnackBar(
                      const SnackBar(
                          content: Text(
                        'Deleting failed!',
                        textAlign: TextAlign.center,
                      )),
                    );
                  }
                },
                color: Theme.of(context).errorColor,
              ),
            ],
          )),
    );
  }
}
