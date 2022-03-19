import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

part 'plant.g.dart';

@Collection()
class Plant extends Equatable {
  @Id()
  final int? id;
  final String name;
  final String location;
  final String imagePath;
  final DateTime created;
  final DateTime modified;

  const Plant({
    required this.id,
    required this.name,
    required this.location,
    required this.imagePath,
    required this.created,
    required this.modified,
  });

  @override
  List<Object?> get props => [id, name, location, imagePath, created, modified];
}
