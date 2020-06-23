import 'package:flutter/material.dart';
import 'package:fluttertaladsod/components/back_button.dart';
import 'package:fluttertaladsod/model/post.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'dart:math' as math;

class FullProfilePostPage extends StatefulWidget {
  final List<Post> postList;
  final int initialIndex;

  FullProfilePostPage({@required this.postList, @required this.initialIndex});

  @override
  _FullProfilePostPageState createState() => _FullProfilePostPageState();
}

class _FullProfilePostPageState extends State<FullProfilePostPage> {
  AutoScrollController controller = AutoScrollController();

  final random = math.Random();

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => navigateToIndex());
  }

  navigateToIndex() {
    controller.scrollToIndex(
      widget.initialIndex,
      preferPosition: AutoScrollPosition.begin,
    );
  }

  buildPostListView() {
    List<List<int>> randomList = List.generate(widget.postList.length,
        (index) => <int>[index, (1000 * random.nextDouble()).toInt()]);

    return ListView(
      controller: controller,
      children: randomList.map((data) {
        final index = data[0];
        return AutoScrollTag(
          key: ValueKey(index),
          controller: controller,
          index: index,
          child: widget.postList[index],
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post',
          style: TextStyle(color: Colors.black54),
        ),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: MyBackButton(),
      ),
      body: SafeArea(
        child: buildPostListView(),
      ),
    );
  }
}
