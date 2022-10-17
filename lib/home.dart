import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shrine_app/model/ProductRepo.dart';
import 'package:shrine_app/model/product.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              semanticLabel: 'Menu',
            ),
            onPressed: () {
              print('Menu Button');
            },
          ),
          title: Text('SHRINE'),
          actions: [
            IconButton(
                onPressed: () {
                  print('Search Button');
                },
                icon: Icon(
                  Icons.search,
                  semanticLabel: 'Search',
                )),
            IconButton(
                onPressed: () {
                  print('filter Button');
                },
                icon: Icon(
                  Icons.tune,
                  semanticLabel: 'Filter',
                ))
          ],
        ),
        body: GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 8 / 9,
            padding: EdgeInsets.all(16),
            children: _buildGridCards(context)));
  }

  List<Card> _buildGridCards(BuildContext context) {
    List<Product> products = ProductRepo.loadProducts(Category.all);

    if (products.isEmpty) {
      return <Card>[];
    }
    final ThemeData themeData = Theme.of(context);

    final NumberFormat format = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.asset(
                product.assetName,
                package: product.assetPackage,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: themeData.textTheme.headline6,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    format.format(product.price),
                    style: themeData.textTheme.subtitle2,
                  )
                ],
              ),
            )
          ],
        ),
      );
    }).toList();
  }
}
