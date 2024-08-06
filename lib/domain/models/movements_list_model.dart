import 'package:json_annotation/json_annotation.dart';
import 'movements_model.dart';

part 'movements_list_model.g.dart';

@JsonSerializable()
class MovementsListModel {
  List<MovementsModel> movements;

  MovementsListModel({required this.movements});

  factory MovementsListModel.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<MovementsModel> movementsList =
        list.map((i) => MovementsModel.fromJson(i)).toList();
    return MovementsListModel(movements: movementsList);
  }
}
