import 'package:bloc_cubit/bloc/cubit_bloc.dart';
import 'package:bloc_cubit/cubbit_database/cubit_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddUpdatePage extends StatelessWidget {
  bool isupdate;
  CubitModal? cubitModal;
  AddUpdatePage({this.isupdate=false,this.cubitModal});

  var titleController=TextEditingController();
  var descController=TextEditingController();

  @override
  Widget build(BuildContext context) {
   if(cubitModal!=null){
     titleController.text=cubitModal!.title;
     descController.text=cubitModal!.desc;
   }



    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(11.0),
        child: Column(
          children: [
            SizedBox(height: 10),
            Text(isupdate ? "update Todo":'Add Todo'),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Enter Title'),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              controller: titleController,
              autofocus: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(23),
                )
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text('Enter description'),
              ],
            ),
            SizedBox(height: 10),
            TextField(
              autofocus: true,
              controller: descController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(23),
                  )
              ),
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){
                  if(isupdate != true){
                    context.read<TodoProvider>().addCubitbloc(addNote: CubitModal(
                        title:titleController.text.toString(),
                        desc: descController.text.toString()));
                    Navigator.pop(context);
                  }else{
                    context.read<TodoProvider>().updateCubitbloc(updateNote: CubitModal(
                        title:titleController.text.toString(),
                        id:cubitModal!.id,
                        desc: descController.text.toString()));
                    Navigator.pop(context);

                  }




                }, child: Text(isupdate ? "update Todo":'Add Todo')),
                ElevatedButton(onPressed: (){
                  Navigator.pop(context);
                }, child: Text("Cancel")),

              ],
            )
          ],
        ),
      ),
    );
  }
}
