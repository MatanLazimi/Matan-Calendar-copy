import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_model.freezed.dart';
part 'add_model.g.dart';

// model class for add form
@freezed
class AddModel with _$AddModel {
  const AddModel._();
  const factory AddModel({
    required String from,
    required String to,
    required String price,
    required DateTime date,
  }) = _AddModel;

  factory AddModel.fromJson(Map<String, Object?> json) =>
      _$AddModelFromJson(json);

  factory AddModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return AddModel.fromJson(data);
  }

  Map<String, dynamic> toDocument() => toJson();
}
