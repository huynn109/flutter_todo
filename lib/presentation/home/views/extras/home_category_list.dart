import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/presentation/home/controllers/home_controller.dart';
import 'package:flutter_todo_simple/presentation/home/views/extras/home_category_item.dart';
import 'package:get/get.dart';

class HomeCategoryList extends GetView<HomeController> {
  const HomeCategoryList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: controller.categoryList.length,
        itemBuilder: (BuildContext context, int index) => HomeCategoryItem(
          categoryItem: controller.categoryList.elementAt(index),
        ),
      );
    });
  }
}
