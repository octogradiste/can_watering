import 'dart:io';
import 'dart:math';

import 'package:can_watering/data/model/plant.dart';
import 'package:can_watering/data/model/watering_action.dart';
import 'package:can_watering/domain/bloc/plant_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class DetailPage extends StatelessWidget {
  final Plant plant;
  final List<WateringAction> wateringActions;

  const DetailPage({
    Key? key,
    required this.plant,
    required this.wateringActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    PlantBloc bloc = context.read<PlantBloc>();
    return WillPopScope(
      onWillPop: () async {
        bloc.add(HomeEvent());
        return true;
      },
      child: BlocBuilder<PlantBloc, PlantState>(
        bloc: bloc,
        builder: (context, state) {
          if (state is DetailUpdateState) {
            return DetailScreen(
              plant: state.plant,
              wateringActions: state.wateringActions,
            );
          }
          return DetailScreen(plant: plant, wateringActions: wateringActions);
        },
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    Key? key,
    required this.plant,
    required this.wateringActions,
  }) : super(key: key);

  final Plant plant;
  final List<WateringAction> wateringActions;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    PlantBloc bloc = context.read<PlantBloc>();

    return Scaffold(
      appBar: AppBar(
        title: Text(plant.name),
        actions: [PopupMenu(plant: plant)],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await showDialog(
            context: context,
            builder: (context) {
              return WateringActionDialog(onWatering: (amount) {
                bloc.add(WateringEvent(plant, amount));
                Navigator.of(context).pop();
              });
            },
          );
        },
        label: const Text('Give Water'),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (plant.imagePath != null)
            Hero(
              tag: plant.id!,
              child: Image(
                height: 250,
                fit: BoxFit.cover,
                image: FileImage(File(plant.imagePath!)),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress != null) {
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  }
                  return child;
                },
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  plant.name,
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  plant.location,
                  style: textTheme.titleMedium,
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            height: 2,
            color: Theme.of(context).primaryColorLight,
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 64),
              itemCount: wateringActions.length,
              itemBuilder: (((_, i) {
                return WateringActionTile(wateringAction: wateringActions[i]);
              })),
            ),
          ),
        ],
      ),
    );
  }
}

class WateringActionTile extends StatelessWidget {
  const WateringActionTile({
    Key? key,
    required this.wateringAction,
  }) : super(key: key);

  final WateringAction wateringAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 6,
        child: ListTile(
          title: Text('${wateringAction.amount} ml'),
          subtitle: Text(
            DateFormat.yMMMMEEEEd().add_Hm().format(wateringAction.date),
          ),
        ),
      ),
    );
  }
}

class WateringActionDialog extends StatefulWidget {
  final void Function(int) onWatering;
  const WateringActionDialog({
    Key? key,
    required this.onWatering,
  }) : super(key: key);

  @override
  State<WateringActionDialog> createState() => _WateringActionDialogState();
}

class _WateringActionDialogState extends State<WateringActionDialog> {
  int amount = 100;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('How much water?'),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () => setState(() => amount = max(amount - 50, 0)),
            icon: const Icon(Icons.remove),
          ),
          Text(
            '$amount ml',
            style: Theme.of(context).textTheme.headline5,
          ),
          IconButton(
            onPressed: () => setState(() => amount += 50),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: (() => widget.onWatering(amount)),
          child: const Text('Give'),
        ),
      ],
    );
  }
}

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    Key? key,
    required this.plant,
  }) : super(key: key);

  final Plant plant;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
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
    );
  }
}
