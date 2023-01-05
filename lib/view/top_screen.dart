import 'package:flutter/material.dart';
import 'package:flutter_rekadigi/model/wheater.dart';

class TopScreen extends StatelessWidget {
  final List<WheaterModel> data;
  const TopScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          final dataw = data[1];
          return Container(
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  GestureDetector(
                    child: Text(
                      'DKI JAKARTA',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        isDismissible: true,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16))),
                        builder: (context) => DraggableScrollableSheet(
                          initialChildSize: 0.4,
                          minChildSize: 0.2,
                          maxChildSize: 0.75,
                          expand: false,
                          builder: (_, controller) => Column(
                            children: [
                              Icon(
                                Icons.remove,
                                color: Colors.grey[600],
                              ),
                              Expanded(
                                child: ListView.builder(
                                  controller: controller,
                                  itemCount: 100,
                                  itemBuilder: (_, index) {
                                    return Card(
                                      child: Padding(
                                        padding: EdgeInsets.all(8),
                                        child: Text("Element at index($index)"),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Text('Kota Jakarta Barat'),
                  SizedBox(height: 30),
                  Text(
                    '${dataw.tempC} °C',
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 30),
                  Text('Jumat, 31 juli  90:00'),
                  Text(
                    dataw.cuaca!,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Image.network(
                      'https://ibnux.github.io/BMKG-importer/icon/2.png')
                ],
              ),
            ),
          );
        });
  }
}
