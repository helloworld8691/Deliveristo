import 'package:auto_route/auto_route.dart';
import 'package:deliveristo/base/base_view.dart';
import 'package:deliveristo/core/di/app_module.dart';
import 'package:deliveristo/core/routers/route.gr.dart';
import 'package:deliveristo/extension/string_ext.dart';
import 'package:deliveristo/ui/dashboard/viewmodel.dart';
import 'package:flutter/material.dart';

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
  _Content(this.viewModel);

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dashboard'),),
    );
  }
}

