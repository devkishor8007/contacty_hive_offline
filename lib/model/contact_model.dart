import "package:hive/hive.dart";

part 'contact_model.g.dart';

@HiveType(typeId: 1)
enum Relation {
  @HiveField(0)
  family,
  @HiveField(1)
  friend,
  @HiveField(2)
  teacher,
  @HiveField(3)
  staff,
  @HiveField(4)
  owner,
}

const relationshipString = <Relation, String>{
  Relation.family: "Family",
  Relation.friend: "Friend",
  Relation.owner: "Owner",
  Relation.staff: "Staff",
  Relation.teacher: "Teacher",
};

@HiveType(typeId: 0)
class Contact {
  @HiveField(0)
  late final String name;
  @HiveField(1)
  late final String age;
  @HiveField(2)
  late final String phone;
  @HiveField(3)
  late Relation relation;
  Contact({
    required this.name,
    required this.age,
    required this.phone,
    required this.relation,
  });
}
