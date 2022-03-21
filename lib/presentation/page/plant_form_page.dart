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

  late String name;
  late String location;
  late String? imagePath;

  @override
  void initState() {
    super.initState();
    name = widget.template.name;
    location = widget.template.location;
    imagePath = widget.template.imagePath;
  }

  @override
  Widget build(BuildContext context) {
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
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              TextButton(
                                onPressed: () async {
                                  final path = await bloc.takePicture();
                                  setState(() => imagePath = path);
                                },
                                child: const Text('Take Picture'),
                              ),
                              TextButton(
                                onPressed: () async {
                                  final path = await bloc.choseImage();
                                  setState(() => imagePath = path);
                                },
                                child: const Text('Chose Image'),
                              ),
                            ],
                          ),
                          // const SizedBox(height: 6),
                          Text(
                            imagePath != null
                                ? 'Image selected!'
                                : 'No image selected...',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
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
                        imagePath: imagePath,
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
