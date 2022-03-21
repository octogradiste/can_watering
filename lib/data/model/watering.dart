import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

part 'watering.g.dart';

@Collection()
class Watering extends Equatable {
  @Id()
  final int? id;
  @Index(type: IndexType.value)
  final int plantId;

  /// The amount of water given to the plant in ml.
  final int amount;
  final DateTime date;

  const Watering({
    this.id,
    required this.plantId,
    required this.amount,
    required this.date,
  });

  @override
  List<Object?> get props => [id, plantId, amount, date];
}
