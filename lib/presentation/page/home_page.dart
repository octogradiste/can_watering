import 'package:can_watering/data/model/plant.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<Plant> plants;

  const HomePage({Key? key, required this.plants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Can Watering'),
      ),
      body: ListView.builder(
          itemCount: plants.length,
          itemBuilder: ((context, index) {
            return PlantTile(plant: plants[index]);
          })),
    );
  }
}

class PlantTile extends StatelessWidget {
  final Plant plant;

  const PlantTile({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(plant.name),
        subtitle: Text(plant.location),
      ),
    );
  }
}
