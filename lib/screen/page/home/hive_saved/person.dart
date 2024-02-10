import 'package:hive/hive.dart';

part 'person.g.dart';

@HiveType(typeId: 1)
class Person extends HiveObject {
  @HiveField(0)
  String nameUserName;

  @HiveField(1)
  String age;

  @HiveField(2)
  String year;

  @HiveField(3)
  String desciption;

  @HiveField(4)
  String? image;

  Person({
    required this.image,
    required this.nameUserName,
    required this.age,
    required this.year,
    required this.desciption,
  });
}
