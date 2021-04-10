// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestModel _$TestModelFromJson(Map<String, dynamic> json) {
  return TestModel(
    id: json['Id'] as int,
    value: (json['value'] as num).toDouble(),
    name: json['name'] as String,
    isValid: json['is_valid'] as bool? ?? false,
    listIds: (json['listIds'] as List<dynamic>).map((e) => e as int).toList(),
    smallTests: (json['smallTests'] as List<dynamic>?)
        ?.map((e) => MiniTest.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TestModelToJson(TestModel instance) => <String, dynamic>{
      'Id': instance.id,
      'value': instance.value,
      'name': instance.name,
      'is_valid': instance.isValid,
      'listIds': instance.listIds,
      'smallTests': instance.smallTests,
    };

MiniTest _$MiniTestFromJson(Map<String, dynamic> json) {
  return MiniTest(
    json['is_test'] as int,
  );
}

Map<String, dynamic> _$MiniTestToJson(MiniTest instance) => <String, dynamic>{
      'is_test': instance.idTest,
    };
