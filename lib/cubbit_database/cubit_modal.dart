import 'package:bloc_cubit/cubbit_database/database_cubit.dart';

class CubitModal{
  int id;
  String title;
  String desc;
  CubitModal({this.id=0,required this.title,required this.desc});


  factory CubitModal.fromMap(Map<String,dynamic> map){
    return CubitModal(title:map[TodoDataBase.Table_Title],
        id: map[TodoDataBase.Table_ID],
        desc: map[TodoDataBase.Table_desc]);

  }


  Map<String,dynamic> toMap(){
    return{
      TodoDataBase.Table_Title:title,
      TodoDataBase.Table_desc:desc
    };


  }




}