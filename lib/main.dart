import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/controllers/product_controller.dart';
import 'package:shopx/product_tile.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
            color: Colors.black,
          )
        ],
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  'ShopX',
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'avenir'),
                ),
              ),
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.view_list_rounded)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.grid_view))
            ],
          ),
        ),
        Expanded(
          child: Obx(() {
            if (productController.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return StaggeredGridView.countBuilder(
                  itemCount: productController.productList.length,
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  itemBuilder: (context, index) {
                    return ProductTile(
                      products: productController.productList[index],
                    );
                  },
                  staggeredTileBuilder: (index) {
                    return const StaggeredTile.fit(1);
                  });
            }
          }),
        )
      ]),
    );
  }
}
