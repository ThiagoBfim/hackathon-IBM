import 'package:rxdart/rxdart.dart';


class BlocRoot{

  var selectPage = BehaviorSubject<bool>.seeded(false);
  bool scroll;

  BlocRoot(){
    scroll = false;
  }

}