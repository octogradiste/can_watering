import 'package:can_watering/data/model/plant.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Plant plant;

  const DetailPage({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(plant.name),
    );
  }
}
