import 'package:flutter/material.dart';
import 'package:store_app/Models/product_model.dart';

class CustomCard extends StatelessWidget {
  CustomCard({required this.product});
  ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    blurRadius: 40,
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    offset: const Offset(10, 10)),
              ],
            ),
            child: Card(
              elevation: 10, //Shadow around the Container
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        product.title.substring(0, 10),
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            r'$' '${product.price.toString()}',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          )
                        ],
                      )
                    ]),
              ),
            ),
          ),
          Positioned(
            right: 32,
            top: -50,
            child: Image.network(product.image),
            height: 100,
            width: 100,
          )
        ],
      ),
    );
  }
}
