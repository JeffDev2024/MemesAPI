import 'package:hive/hive.dart';

import 'models/local_meme.dart';

class Boxes{
  static Box<LocalMeme> getFavoritesMemes() => Hive.box<LocalMeme>('favorites_memes');
}