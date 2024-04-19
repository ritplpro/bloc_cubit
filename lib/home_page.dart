import 'package:bloc_cubit/bloc/cubit_bloc.dart';
import 'package:bloc_cubit/bloc/cubit_state.dart';
import 'package:bloc_cubit/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<TodoProvider>().intialgetData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("bloc cubit"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocBuilder<TodoProvider,TodoState>(builder:(context,state){
        if(state is LoadingState){
          return Center(child: CircularProgressIndicator());
        }else if (state is ErrorState){
          return Center(child: Text(state.errorMsg));
        }else if(state is LoadedState){
          var mData=state.allnotes;
          return mData.isNotEmpty ? ListView.builder(
          itemCount:mData.length,
              itemBuilder: (context, index){
            return ListTile(
              onTap: (){

                Navigator.push(context,MaterialPageRoute(builder: (context)
                =>AddUpdatePage(isupdate: true,cubitModal: mData[index],)));


              },
              leading: Text('${index+1}'),
              title: Text(mData[index].title),
              subtitle: Text(mData[index].desc),
              trailing: IconButton(onPressed: (){
                context.read<TodoProvider>().deleteCubitbloc(id:mData[index]
                    .id);
              },icon: Icon(Icons.delete),),
            );
          }):Center(child: Text('No Todo avlaible '));

        }
        return Container();
      }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context,MaterialPageRoute(builder: (context)
          =>AddUpdatePage()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
