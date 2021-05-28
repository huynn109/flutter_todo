import 'package:flutter/material.dart';
import 'package:flutter_todo_simple/presentation/home/controllers/add_todo_controller.dart';
import 'package:get/get.dart';

class HomeAddTodoView extends GetView<AddTodoController> {
  final TextEditingController _controller = TextEditingController();
  final DateTime? date;

  HomeAddTodoView({Key? key, this.date}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(10.0),
          topRight: const Radius.circular(10.0),
        ),
      ),
      child: Form(
        key: controller.addTodoFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: TextFormField(
                controller: _controller,
                autofocus: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Input todo',
                ),
                autocorrect: false,
                keyboardType: TextInputType.text,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.date_range_outlined,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: date ?? DateTime.now(),
                      firstDate:
                          (date ?? DateTime.now()).subtract(Duration(days: 30)),
                      lastDate:
                          (date ?? DateTime.now()).add(Duration(days: 365)),
                    ).then((value) {
                      if (value == null) return;
                      print("Date: ${value.toIso8601String()}");
                    }).catchError((error) {
                      print(error.toString());
                    });
                  },
                ),
                Text(DateTime.now().toString()),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: TextButton(
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
