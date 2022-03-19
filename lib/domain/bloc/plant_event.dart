part of 'plant_bloc.dart';

abstract class PlantEvent extends Equatable {
  const PlantEvent();
}

class GoHomeEvent extends PlantEvent {
  @override
  List<Object?> get props => [];
}

class AddEvent extends PlantEvent {
  @override
  List<Object?> get props => [];
}

class SaveEvent extends PlantEvent {
  final Plant plant;

  const SaveEvent(this.plant);

  @override
  List<Object?> get props => [plant];
}

class DetailEvent extends PlantEvent {
  final Plant plant;

  const DetailEvent(this.plant);

  @override
  List<Object?> get props => [plant];
}

class DeleteEvent extends PlantEvent {
  final Plant plant;

  const DeleteEvent(this.plant);

  @override
  List<Object?> get props => [plant];
}

class ModifyEvent extends PlantEvent {
  final Plant plant;

  const ModifyEvent(this.plant);

  @override
  List<Object?> get props => [plant];
}

class WateringEvent extends PlantEvent {
  final WateringAction action;

  const WateringEvent(this.action);

  @override
  List<Object?> get props => [action];
}
