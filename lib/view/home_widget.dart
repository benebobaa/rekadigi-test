import 'package:flutter/material.dart';
import 'package:flutter_rekadigi/view/top_screen.dart';
import 'package:flutter_rekadigi/viewmodel/home_viewmodel.dart';
import 'package:provider/provider.dart';



class Home extends StatelessWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 350,
          child: Consumer<HomeViewModel>(builder: ((context, value, child) {
            final datas = value.wheater;
            return TopScreen(
              data: datas,
            );
          })),
        ),
        SizedBox(height: 80),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.only(left: 10, bottom: 10),
                  child: Text('Hari ini', style: TextStyle(fontSize: 20))),
              // SizedBox(height: 30),
              Container(
                  height: 250,
                  child: Consumer<HomeViewModel>(
                    builder: ((context, value, child) {
                      final datas = value.wheater;
                      return ListView.builder(
                          itemCount: datas.length,
                          shrinkWrap: true,
                          // This next line does the trick.
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final data = datas[index];
                            return Container(
                              width: 160.0,
                              color: Colors.white,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      data.jamCuaca!,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      data.cuaca!,
                                      style: TextStyle(fontSize: 15),
                                    ),
                                    Text(
                                      '${data.tempC!} °C',
                                      style: TextStyle(fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
                  )),
            ],
          ),
        )
      ],
    );
  }
}
