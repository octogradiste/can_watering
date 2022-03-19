import 'dart:io';

import 'package:can_watering/data/model/plant.dart';
import 'package:can_watering/domain/bloc/plant_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatelessWidget {
  final Plant plant;

  const DetailPage({Key? key, required this.plant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<PlantBloc>().add(GoHomeEvent());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(plant.name),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.read<PlantBloc>().add(GoHomeEvent());
            },
          ),
          actions: [
            PopupMenuButton<int>(
              onSelected: ((value) {
                PlantBloc bloc = context.read<PlantBloc>();
                switch (value) {
                  case 0:
                    bloc.add(DeleteEvent(plant));
                    break;
                  case 1:
                    bloc.add(ModifyEvent(plant));
                    break;
                }
              }),
              itemBuilder: (_) {
                return [
                  const PopupMenuItem(value: 0, child: Text('Delete')),
                  const PopupMenuItem(value: 1, child: Text('Modify')),
                ];
              },
            )
          ],
        ),
        body: Center(
          child: Column(
            children: [
              if (plant.imagePath != null) Image.file(File(plant.imagePath!)),
              Text(plant.name),
              Text(plant.location),
              Text(plant.imagePath ?? 'No image path...'),
            ],
          ),
        ),
      ),
    );
  }
}
