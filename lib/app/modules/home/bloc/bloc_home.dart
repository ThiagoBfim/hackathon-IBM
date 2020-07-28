import 'package:rxdart/rxdart.dart';

class BlocHome{

  var positionPage = BehaviorSubject<int>.seeded(0);

  void pageChange({int index}){
    positionPage.sink.add(index);
  }


  dispose(){
    positionPage.close();
  }


}