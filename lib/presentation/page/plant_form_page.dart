import 'dart:io';

import 'package:can_watering/data/model/plant.dart';
import 'package:can_watering/domain/bloc/plant_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

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

  Future<String?> _pickImage() async {
    final picker = ImagePicker();
    final image = await picker.getImage(source: ImageSource.camera);
    return image?.path;
  }

  @override
  Widget build(BuildContext context) {
    late String name;
    late String location;
    late String? path;

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
                    initialValue: widget.template.name,
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
                    initialValue: widget.template.location,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    onSaved: (value) => location = value!,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      path = await _pickImage();
                    },
                    child: const Text('Pick image'),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        if (path != null) {
                          final dir = await getApplicationSupportDirectory();
                          final image = File(path!);
                          final saveAt = '${dir.path}/${path!.split('/').last}';
                          await image.copy(saveAt);
                        }
                        Plant plant = Plant(
                          name: name,
                          location: location,
                          imagePath: path,
                          created: widget.modify
                              ? widget.template.created
                              : DateTime.now(),
                          modified: DateTime.now(),
                        );
                        context.read<PlantBloc>().add(SaveEvent(plant));
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
