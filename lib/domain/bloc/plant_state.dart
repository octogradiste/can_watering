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

class DetailUpdateState extends PlantState {
  final Plant plant;
  final List<Watering> waterings;

  const DetailUpdateState(this.plant, this.waterings);

  @override
  List<Object?> get props => [plant, waterings];
}
