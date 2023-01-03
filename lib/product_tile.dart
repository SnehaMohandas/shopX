import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopx/models/product.dart';

class ProductTile extends StatelessWidget {
  Product products = Product();

  ProductTile({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(4)),
                  child: Image.network(
                    products.imageLink!,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    right: 0,
                    child: Obx(() {
                      return CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                            onPressed: () {
                              products.isFav.toggle();
                            },
                            icon: products.isFav.value
                                ? const Icon(
                                    Icons.favorite_rounded,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_border,
                                    color: Colors.black,
                                  )),
                      );
                    })),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              products.name!,
              maxLines: 2,
              style: const TextStyle(
                fontFamily: 'avenir',
                fontWeight: FontWeight.w800,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            if (products.rating != null)
              Container(
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        products.rating.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Text(
                  '\$${products.price}',
                  style: const TextStyle(fontFamily: 'avenir', fontSize: 32),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
