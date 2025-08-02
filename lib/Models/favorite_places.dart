import 'package:uuid/uuid.dart';

var uuid = Uuid();

class FavoritePlaces {
  FavoritePlaces({required this.title});
  //:id = uuid.v4()String id;
  String title;
}
