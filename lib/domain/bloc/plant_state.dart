part of 'plant_bloc.dart';

abstract class PlantState extends Equatable {
  const PlantState();
}

class LoadingState extends PlantState {
  @override
  List<Object?> get props => [];
}

class HomeState extends PlantState {
  final List<Plant> plants;

  const HomeState(this.plants);

  @override
  List<Object?> get props => [plants];
}

class DetailState extends PlantState {
  final Plant plant;
  final List<WateringAction> wateringActions;

  const DetailState(this.plant, this.wateringActions);

  @override
  List<Object?> get props => [plant, wateringActions];
}

class PlantFormState extends PlantState {
  /// A 'template' plant to fill in the form with some defaults.
  final Plant template;

  /// Indicates if is currently modifying an existing plant
  /// or if is creating a new plant.
  final bool modify;

  const PlantFormState(this.template, this.modify);

  @override
  List<Object?> get props => [template, modify];
}
