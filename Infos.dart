import 'package:snappfood_app/Info.dart';

class Infos{

  static List<Info> information=List.empty(growable: true);

  static void add(Info info){
  information.add(info);
  }

  static List<Info> getInfos(){
    return information;
  }

}