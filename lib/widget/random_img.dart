import 'package:deliveristo/extension/string_ext.dart';
import 'package:deliveristo/extension/widget_ext.dart';
import 'package:flutter/material.dart';

Widget randomImg(String title, String url) => Container(
  color: Colors.black,
  width: double.infinity,
  margin: const EdgeInsets.only(bottom: 5),
  child: Stack(
    children: [
      url.toNetworkImage(showLoadingIndicator: false, height: 250, borderRadius: 0).toCenter,
      Container(
        margin: const EdgeInsets.only(left: 5,  top: 5),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.circular(5)
        ),
        child: title.toText(color: Colors.white, fontSize: 13),
      )
    ],
  ),
);