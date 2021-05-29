import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/presentation/home/views/extras/home_add_todo_view.dart';
import 'package:flutter_todo_simple/presentation/home/views/extras/home_category_view.dart';
import 'package:flutter_todo_simple/presentation/home/views/extras/home_header_view.dart';
import 'package:flutter_todo_simple/presentation/home/views/extras/home_todo_view.dart';
import 'package:flutter_todo_simple/resources/resource.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        leading: iconButtonProfile(),
        actions: iconButtonActions(),
      ),
      body: Container(
        color: const Color(COLOUR_GREY_LIGHT),
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: IntrinsicHeight(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(height: 16),
                    HeaderView(),
                    SizedBox(height: 16),
                    HomeCategoryView(),
                    SizedBox(height: 16),
                    Expanded(child: HomeTodoView()),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FabAddTodoWidget(),
    );
  }

  List<Widget> iconButtonActions() {
    return [
      iconButtonSearch(),
      iconButtonNotification(),
    ];
  }

  IconButton iconButtonNotification() {
    return IconButton(
      icon: const Icon(Icons.notifications_outlined),
      color: const Color(COLOUR_GREY),
      tooltip: 'Notifications',
      onPressed: () => Get.snackbar(
        "Notifications",
        "Building",
      ),
    );
  }

  IconButton iconButtonSearch() {
    return IconButton(
      icon: const Icon(Icons.search_outlined),
      color: const Color(COLOUR_GREY),
      tooltip: 'Search',
      onPressed: () => Get.snackbar(
        "Search",
        "Building",
      ),
    );
  }

  IconButton iconButtonProfile() {
    return IconButton(
      icon: Icon(Icons.account_circle),
      color: const Color(COLOUR_GREY),
      tooltip: 'Profile',
      onPressed: () => Get.snackbar(
        "Profile",
        "Building",
      ),
    );
  }
}

class FabAddTodoWidget extends StatelessWidget {
  const FabAddTodoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      elevation: 4.0,
      icon: const Icon(Icons.add),
      label: const Text('Add a new task', maxLines: 1),
      onPressed: () => createBottomSheetWidget(context),
    );
  }

  void createBottomSheetWidget(BuildContext context) {
    Get.bottomSheet(
      animatedInputTodoWidget(context),
      isScrollControlled: true,
    );
  }

  AnimatedPadding animatedInputTodoWidget(BuildContext context) {
    return AnimatedPadding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: HomeAddTodoView(),
    );
  }
}
