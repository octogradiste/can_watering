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
        context.read<PlantBloc>().add(GoHomeEvent());
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title:
              Text(widget.modify ? 'Modify your plant' : 'Add your new plant'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.read<PlantBloc>().add(GoHomeEvent());
            },
          ),
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
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
                      ElevatedButton(
                        onPressed: () async {
                          path = await bloc.pickImage();
                        },
                        child: const Text('Pick Image'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          path = await bloc.choseImage();
                        },
                        child: const Text('Chose Image'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Plant plant = Plant(
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
      ),
    );
  }
}
