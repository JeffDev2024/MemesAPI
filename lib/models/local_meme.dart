import 'package:hive/hive.dart';

part "local_meme.g.dart";

@HiveType(typeId:0)
class LocalMeme extends HiveObject{

  @HiveField(0)
  num? id;

  @HiveField(1)
  String? description;

  @HiveField(2)
  String? url;
}
