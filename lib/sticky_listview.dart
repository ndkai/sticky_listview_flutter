import 'package:flutter/material.dart';


class StickyListView extends StatefulWidget {
  final double height;
  final int pickedIndex;
  final int itemCount;
  final NullableIndexedWidgetBuilder builder;
  final Widget pickedItem;
  const StickyListView({super.key, required this.height, required this.pickedIndex,  required this.pickedItem, required this.builder, required this.itemCount,});

  @override
  State<StickyListView> createState() => _StickyListViewState();
}

class _StickyListViewState extends State<StickyListView> {
  late int pickedIndex;
  late double height;
  late bool show = false;
  bool firstCheck = true;
  Alignment alignment = Alignment.bottomCenter;
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    height = widget.height;
    pickedIndex = widget.pickedIndex;
    //process scrolling
    scrollController.addListener(() {
      double itemSize = (height + scrollController.position.maxScrollExtent) / widget.itemCount;
      double itemDes = itemSize * (pickedIndex + 1);
      print(itemSize);
      if(scrollController.position.pixels> itemSize * pickedIndex){
        print('1');
        setState(() {
          alignment = Alignment.topCenter;
          show = true;
        });
      } else
      if(scrollController.position.pixels + height > itemDes){
        print('2');
        setState(() {
          show = false;
          alignment = Alignment.bottomCenter;
        });
      } else
      if(scrollController.position.pixels + height < itemDes){
        print('3');
        setState(() {
          alignment = Alignment.bottomCenter;
          show = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if(firstCheck){
      WidgetsBinding.instance!.addPostFrameCallback((_) {
        scrollController.jumpTo(0.01);
        firstCheck = false;
      });
    }
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          ListView.builder(
            controller: scrollController,
            itemCount: widget.itemCount,
            itemBuilder: widget.builder,
          ),
          show ? Align(
            alignment: alignment,
            child: widget.pickedItem,
          ) : const SizedBox()
        ],
      ),
    );
  }
}
