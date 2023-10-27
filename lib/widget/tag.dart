import 'package:deliveristo/extension/string_ext.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/collection.dart';

class TagWidget extends StatefulWidget {

  final List<KtPair<String, bool>> tags;
  final Function(int) onTap;
  const TagWidget(this.tags, this.onTap, {super.key});

  @override
  State<TagWidget> createState() => _TagWidgetState();
}

class _TagWidgetState extends State<TagWidget> {

  int selectedIndex = 0;

  void _selectTag(int index){
    widget.tags[selectedIndex] = KtPair(widget.tags[selectedIndex].first, false);
    widget.tags[index] = KtPair(widget.tags[index].first, true);
    selectedIndex = index;
    widget.onTap(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> tags = [];
    for (int index = 0; index < widget.tags.length; index++){
      tags.add(GestureDetector(
        onTap: () {
          _selectTag(index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
          margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          decoration: BoxDecoration(
              color: widget.tags[index].second ? Colors.green : Colors.black12,
              borderRadius: BorderRadius.circular(15)
          ),
          child: widget.tags[index].first.toText(color: widget.tags[index].second ? Colors.white: Colors.black),
        ),
      ));
    }

    return Wrap(
      children: tags
    );
  }
}