import 'package:flutter/widgets.dart';

class EmptyView extends StatelessWidget {
  final String content;

  const EmptyView({
    Key? key,
    this.content = "No data",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(content),
    );
  }
}
