import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'group.g.dart';

@JsonSerializable()
class Group extends Equatable {
  final int id;
  @JsonKey(name: 'name')
  final String name;
  // final List<UserShort> users;

  const Group({
    required this.id,
    required this.name,
    // required this.users,
  });

  @override
  List<Object?> get props => [name, id]; //, users id,

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);

  Map<String, dynamic> toJson() => _$GroupToJson(this);
}
