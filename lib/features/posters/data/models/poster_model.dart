
import '../../domain/entitis/poster_entiti.dart';

const String tableName = 'poster';
const String columnId = 'id';
const String columnNumberPlates = 'numberPlates';
const String columnSerialNumber = 'serialNumber';

class PosterModel extends Poster {
  PosterModel(
      {required super.numberPlates,
      required super.serialNumber,
      required super.id});



  factory PosterModel.fromJson(Map<dynamic, dynamic> json) {
    return PosterModel(
        numberPlates: json[columnNumberPlates],
        serialNumber: json[columnSerialNumber],
        id: json[columnId]);
  }
  Map<String, dynamic> toJson() {
    return {
      columnNumberPlates: numberPlates,
      columnSerialNumber: serialNumber,
      columnId: id
    };
  }
}
