import 'package:can_watering/data/model/plant.dart';
import 'package:can_watering/domain/bloc/plant_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlantFormPage extends StatefulWidget {
  final Plant template;
  final bool modify;

  const PlantFormPage({
    Key? key,
    required this.template,
    required this.modify,
  }) : super(key: key);

  @override
  State<PlantFormPage> createState() => _PlantFormPageState();
}

class _PlantFormPageState extends State<PlantFormPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    String name = widget.template.name;
    String location = widget.template.location;
    String? path = widget.template.imagePath;

    final bloc = context.read<PlantBloc>();

    return WillPopScope(
      onWillPop: () async {
        context.read<PlantBloc>().add(HomeEvent());
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title:
              Text(widget.modify ? 'Modify your plant' : 'Add your new plant'),
        ),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Name'),
                              helperText: "What's the name of your plant?",
                            ),
                            initialValue: name,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onSaved: (value) => name = value!,
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Location'),
                              helperText: 'Where in your home is your plant?',
                            ),
                            initialValue: location,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            onSaved: (value) => location = value!,
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  path = await bloc.pickImage();
                                },
                                child: const Text('Pick Image'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  path = await bloc.choseImage();
                                },
                                child: const Text('Chose Image'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 48),
                        ],
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      Plant plant = Plant(
                        id: widget.template.id,
                        name: name,
                        location: location,
                        imagePath: path,
                        created: widget.modify
                            ? widget.template.created
                            : DateTime.now(),
                        modified: DateTime.now(),
                      );
                      bloc.add(SaveEvent(plant));
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
