import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/presentation/home/views/extras/home_category_view.dart';
import 'package:flutter_todo_simple/presentation/home/views/extras/home_header_view.dart';
import 'package:flutter_todo_simple/presentation/home/views/extras/home_todo_view.dart';
import 'package:flutter_todo_simple/resources/resource.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          color: const Color(COLOUR_GREY),
          tooltip: 'Open shopping cart',
          onPressed: () {
            // handle the press
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            color: const Color(COLOUR_GREY),
            tooltip: 'Search',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Search')));
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            color: const Color(COLOUR_GREY),
            tooltip: 'Notifications',
            onPressed: () {
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Notifications')));
            },
          ),
        ],
      ),
      body: Container(
        color: const Color(COLOUR_GREY_LIGHT),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            SizedBox(height: 16),
            HeaderView(),
            SizedBox(height: 16),
            HomeCategoryView(),
            SizedBox(height: 16),
            HomeTodoView(),
            SizedBox(height: 16),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        elevation: 4.0,
        icon: const Icon(Icons.add),
        label: const Text('Add a new task', maxLines: 1),
        onPressed: () {
          showModalCustomBottomSheet<Task>(
              context: context,
              builder: (BuildContext context) {
                // return new AnimatedPadding(
                //   padding: MediaQuery.of(context).viewInsets,
                //   duration: const Duration(milliseconds: 100),
                //   curve: Curves.decelerate,
                //   child: new Container(
                //     alignment: Alignment.bottomCenter,
                //     child: Wrap(
                //       children: <Widget>[
                //         AddTaskWidget(),
                //       ],
                //     ),
                //   ),
                // );
                return AddTaskWidget();
              }).then((newTask) {
            if (newTask == null || newTask.title.isNotEmpty)
              tasks.onNewTaskSave(newTask);
          });
        },
      ),
    );
  }
}
