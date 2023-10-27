import 'package:deliveristo/core/di/app_module.dart';
import 'package:deliveristo/core/routers/route.gr.dart';
import 'package:deliveristo/extension/string_ext.dart';
import 'package:deliveristo/extension/widget_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

Widget imageList(List<String> imgList) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: MasonryGridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 3,
        mainAxisSpacing: 3,
        itemCount: imgList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () => appRouter.push(ImageViewRoute(url: imgList[index])),
              child: imgList[index].toNetworkImage(borderRadius: 0, showLoadingIndicator: false)
          );
        })
).toFlexible;