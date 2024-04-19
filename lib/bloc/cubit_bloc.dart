import 'package:bloc_cubit/bloc/cubit_state.dart';
import 'package:bloc_cubit/cubbit_database/cubit_modal.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubbit_database/database_cubit.dart';

class TodoProvider extends Cubit<TodoState>{

  TodoDataBase TodoBase;

  TodoProvider({required this.TodoBase}):super(intialState());




   addCubitbloc({required CubitModal addNote}) async {
    emit(LoadingState());

    var isadded = await TodoBase.AddDatabase(insertData: addNote);

    if(isadded !=null){
      var mData=await TodoBase.FetchDatabase();
      emit(LoadedState(allnotes: mData));
    }else{
      emit(ErrorState(errorMsg: "todo not added"));
    }
  }

  intialgetData() async {
     emit(LoadingState());
     var mData= await TodoBase.FetchDatabase();
     emit(LoadedState(allnotes: mData));
  }

  updateCubitbloc({required CubitModal updateNote}) async {
    emit(LoadingState());

    var isadded = await TodoBase.updateDatabase(updatedb: updateNote);

    if(isadded !=null){
      var mData=await TodoBase.FetchDatabase();
      emit(LoadedState(allnotes: mData));
    }else{
      emit(ErrorState(errorMsg: "todo not updated"));
    }
  }


  deleteCubitbloc({required int id}) async {
    emit(LoadingState());

    var isadded = await TodoBase.deleteData(id: id);

    if(isadded !=null){
      var mData=await TodoBase.FetchDatabase();
      emit(LoadedState(allnotes: mData));
    }else{
      emit(ErrorState(errorMsg: "todo not deleted"));
    }
  }

}