import 'package:hive/hive.dart';
part 'cat_facts_object.g.dart';

@HiveType(typeId: 0)
class CatsFactsObject extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String user;

  @HiveField(2)
  String text;

  CatsFactsObject(this.id, this.user, this.text);
}