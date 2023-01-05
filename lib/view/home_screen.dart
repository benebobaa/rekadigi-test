// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_rekadigi/view/home_widget.dart';
import 'package:flutter_rekadigi/view/top_screen.dart';
import 'package:provider/provider.dart';

import 'package:flutter_rekadigi/model/wheater.dart';
import 'package:flutter_rekadigi/viewmodel/home_viewmodel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late HomeViewModel vm;
  @override
  void initState() {
    vm = Provider.of<HomeViewModel>(context, listen: false);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await vm.getLocation();
      vm.getWheater();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child: Consumer<HomeViewModel>(builder: (context, value, child) {
        if (value.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Home();
        }
      }),
    ));
  }
}
