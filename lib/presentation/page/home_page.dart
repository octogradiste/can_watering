import 'dart:io';

import 'package:can_watering/data/model/plant.dart';
import 'package:can_watering/domain/bloc/plant_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  final List<Plant> plants;

  const HomePage({Key? key, required this.plants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Plants'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 64),
        itemCount: plants.length,
        itemBuilder: ((context, index) {
          return PlantTile(plant: plants[index]);
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<PlantBloc>().add(AddEvent());
        },
        label: const Text('Add Plant'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class PlantTile extends StatelessWidget {
  final Plant plant;

  const PlantTile({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 6,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (plant.imagePath != null)
                  Hero(
                    tag: plant.id!,
                    child: Image.file(
                      File(plant.imagePath!),
                      height: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  child: Text(
                    plant.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                )
              ],
            ),
            Positioned.fill(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    context.read<PlantBloc>().add(DetailEvent(plant));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
