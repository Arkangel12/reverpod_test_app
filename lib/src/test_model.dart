import 'package:json_annotation/json_annotation.dart';

part 'test_model.g.dart'; // Debe ser el mismo nombre  que la clase (it must be the same filename)

@JsonSerializable()
class TestModel {
  @JsonKey(name: 'Id')
  final int id;

  final double value;

  final String name;

  @JsonKey(name: 'is_valid', defaultValue: false)
  final bool isValid;

  final List<int> listIds;

  final List<MiniTest>? smallTests;

  TestModel({
    required this.id,
    required this.value,
    required this.name,
    required this.isValid,
    required this.listIds,
    this.smallTests,
  });

  factory TestModel.fromJson(Map<String, dynamic> json) =>
      _$TestModelFromJson(json);

  Map<String, dynamic> toJson() => _$TestModelToJson(this);

  @override
  String toString() => 'TestModel{id: $id, ...}';
}

@JsonSerializable()
class MiniTest {
  @JsonKey(name: 'is_test')
  final int idTest;

  MiniTest(this.idTest);

  factory MiniTest.fromJson(Map<String, dynamic> json) =>
      _$MiniTestFromJson(json);

  Map<String, dynamic> toJson() => _$MiniTestToJson(this);
}
