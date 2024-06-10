import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app2/controller/homepage/homepage_controller.dart';
import 'package:ecommerce_app2/core/function/translatedatabase.dart';
import 'package:ecommerce_app2/data/model/itemsmodel.dart';
import 'package:ecommerce_app2/linkapi.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class ListItemsSearch extends GetView<HomePageControllerImp> {
  final List<ItemsModel> listDataModel;
  const ListItemsSearch({super.key, required this.listDataModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: listDataModel.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            controller.goToPageProductDetails(listDataModel[index]);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Card(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: CachedNetworkImage(
                        imageUrl:
                            "${AppLink.imageItems}/${listDataModel[index].itemsImage}",
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: ListTile(
                        title: Text(
                            "${translateDatabase(listDataModel[index].itemsNameAr, listDataModel[index].itemsName)}"),
                        subtitle: Text(
                            "${translateDatabase(listDataModel[index].categoriesNameAr, listDataModel[index].categoriesName)}"),
                        // trailing: Text("${listDataModel[index].itemsPrice}"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
