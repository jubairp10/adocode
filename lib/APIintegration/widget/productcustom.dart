import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/product_model.dart';

class ProductCustom extends StatelessWidget{
  final Product productList;
  ProductCustom(this.productList);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height*.8,
      child: Padding(
        padding: EdgeInsets.all(8),
        child:Column(
          children: [
            Container(
              height:30,
              width: double.infinity,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(borderRadius:BorderRadius.circular(5) ),
              child: CachedNetworkImage(imageUrl: productList.image,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              productList.title,
              maxLines: 2,
              style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            if (productList.rating != null)
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  // borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      productList.rating!.rate.toString(),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Icon(
                      Icons.star,
                      size: 16,
                      color: Colors.white,
                    )
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

}