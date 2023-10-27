import 'package:auto_route/auto_route.dart';
import 'package:deliveristo/base/base_view.dart';
import 'package:deliveristo/extension/string_ext.dart';
import 'package:deliveristo/extension/widget_ext.dart';
import 'package:deliveristo/ui/dashboard/viewmodel.dart';
import 'package:deliveristo/utils/utils.dart';
import 'package:deliveristo/widget/image_list.dart';
import 'package:deliveristo/widget/random_img.dart';
import 'package:deliveristo/widget/tag.dart';
import 'package:flutter/material.dart';
import 'package:kt_dart/collection.dart';
import 'package:kt_dart/standard.dart';
import 'package:provider/provider.dart';

@RoutePage()
class DashboardScreen extends BaseScreen<DashboardViewModel> {
  DashboardScreen({super.key}): super(params: []);

  @override
  Widget buildContent(BuildContext context) {
    return _Content(viewModel);
  }
}

class _Content extends StatefulWidget {
  final DashboardViewModel viewModel;
  const _Content(this.viewModel);

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {

  @override
  void dispose() {
    widget.viewModel.dispose();
    super.dispose();
  }

  void menuSelected(Menu? item){
    item?.let((value) {
      setState(() {
        widget.viewModel.selectMenu(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: DropdownButton(
            value: widget.viewModel.selectedMenu,
            underline: const SizedBox(),
            items: Menu.values.map((item) {
              return DropdownMenuItem(
                  value: item,
                  child: Utils.getMenuTitle(item).toText(fontSize: 14)
              );
            }).toList(),
            onChanged: (newValue) {
              menuSelected(newValue);
            }).toCenter,
      ),
      body: IndexedStack(
        index: widget.viewModel.selectedMenu.index,
        children: [
          byBreed(),
          bySubBreed()
        ],
      )
    );
  }

  // 1- Random image by breed
  // 2- Images list by breed
  Widget byBreed() => Column(
    children: [
      randomImageByBreed,
      imageListByBreed,
    ],
  );

  final imageListByBreed = Selector<DashboardViewModel, List<String>>(
      builder: (context, value, _) {
        return imageList(value);
      },
      selector: (_, viewModel) => viewModel.imageListByBreed
  );

  final randomImageByBreed = Selector<DashboardViewModel, String>(
      builder: (context, value, _) {
        return randomImg('Random image by breed', value);
      },
      selector: (_, viewModel) => viewModel.randomImage
  );

  //3- Random image by breed and sub breed
  // 4- Images list by breed and sub breed
  Widget bySubBreed() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      subBreedList(),
      randomImgBySubBreed,
      imageListBySubBreed
    ],
  );

  Widget subBreedList() => Selector<DashboardViewModel, List<KtPair<String, bool>>>(
      builder: (context, value, _) {
        return TagWidget(value, (value) {
          widget.viewModel.selectSubBreed(value);
        });
      } ,
      selector: (_, viewModel) => viewModel.subBreedList);

  final randomImgBySubBreed = Selector<DashboardViewModel, String>(
      builder: (context, value, _) {
        return randomImg('Random image by breed and sub breed', value);
      },
      selector: (_, viewModel) => viewModel.randomImgBySubBreed
  );

  final imageListBySubBreed = Selector<DashboardViewModel, List<String>>(
      builder: (context, value, _) {
        return imageList(value);
      },
      selector: (_, viewModel) => viewModel.imgListBySubBreed
  );
}
