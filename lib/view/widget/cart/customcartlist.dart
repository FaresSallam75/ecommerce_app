import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app2/core/constant/colors.dart';
import 'package:ecommerce_app2/linkapi.dart';
import 'package:flutter/material.dart';

class CustomCartList extends StatelessWidget {
  final String nameProduct;
  final String priceProduct;
  final String numberProduct;
  final String iamgeName;
  final void Function()? onPressedAdd;
  final void Function()? onPressedRemove;
  const CustomCartList(
      {super.key,
      required this.nameProduct,
      required this.priceProduct,
      required this.numberProduct,
      required this.iamgeName,
      required this.onPressedAdd,
      required this.onPressedRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: CachedNetworkImage(
              imageUrl: "${AppLink.imageItems}/$iamgeName",
              height: 75,
            ),
          ),
          Expanded(
            flex: 3,
            child: ListTile(
              title: Text(
                nameProduct,
                style: const TextStyle(
                    fontSize: 17,
                    fontFamily: "sans",
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Container(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  priceProduct,
                  style: const TextStyle(
                    fontFamily: "sans",
                    fontSize: 20,
                    color: AppColor.secondColor,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                  child: IconButton(
                    onPressed: onPressedAdd,
                    icon: const Icon(Icons.add),
                  ),
                ),
                SizedBox(
                  height: 20,
                  child: Text(
                    numberProduct,
                    style: const TextStyle(
                        fontFamily: "sans", fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: IconButton(
                    onPressed: onPressedRemove,
                    icon: const Icon(Icons.remove),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
