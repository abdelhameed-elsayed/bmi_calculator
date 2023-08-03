import 'package:flutter/material.dart';
import '../../../models/Categorries.dart';
import '../../../models/Product.dart';
import '../../../services/fetchCategories.dart';
import '../../../services/fetchProducts.dart';
import '../../../size_config.dart';
import 'categories.dart';
import 'recommond_products.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    // It enables scrolling
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(defaultSize! * 2), //20
              child: const Text(
                "Browse by Categories",
              ),
            ),
            FutureBuilder(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(
                      categories: [
                        Category(
                          id: "1",
                          title: "Armchair",
                          image: "https://i.imgur.com/JqKDdxj.png",
                          numOfProducts: 100,
                        )
                      ],
                    )
                  : Center(child: Image.asset("assets/ripple.gif")),
            ),
            Divider(height: 5),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2), //20
              child: const Text("Recommands For You"),
            ),
            // Right Now product is our demo product
            FutureBuilder(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? RecommandProducts(products: [
                        Product(
                          id: "1",
                          price: 1600,
                          title: "Wood Frame",
                          image: "https://i.imgur.com/sI4GvE6.png",
                          category: "Chair",
                          subTitle: "Tieton Armchair",
                          description: description,
                        )
                      ])
                    : Center(child: Image.asset('assets/ripple.gif'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
