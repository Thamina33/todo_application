import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/todo.dart';
import  'package:intl/intl.dart';

import 'AddTask.dart';
import 'UpdateTask.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  List<Todo> todoList = [];
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          actions: const [
            Icon(CupertinoIcons.search, color: Colors.blue,)
          ],
        ),
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
               // color: Colors.yellow,
                height: MediaQuery.of(context).size.height*.3,
                child: AddNewTaskModal(onAddTap: (Todo task) {

                  addTodo(task);
                },),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*.5,
                child: ListView.separated(
                  shrinkWrap: false,
                    itemBuilder: (context , index){
                      final Todo todo = todoList[index];
                      final String formattedDate =DateFormat('hh:mm a dd-MM-yy').format(todo.createdDateTime);
                      return  ListTile(
                        onLongPress: (){
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: const Text("Alert"),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  InkWell(
                                      onTap: (){
                                        Navigator.pop(context);
                                        showModalBottomSheet(context: context, builder: (context){
                                          return UpdateTaskModal(
                                            todo: todo,
                                            onTodoUpdate: (String updateTitle , String updateSubtitle){
                                              updateTodo(index, updateTitle, updateSubtitle);
                                            },
                                          );
                                        });
                                      },
                                      child: const Text("Edit" , style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                      ),)),
                                  InkWell(
                                      onTap: (){
                                        Navigator.pop(context);
                                        deleteTodo(index);

                                      },
                                      child: const Text("Delete",style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold
                                      ),))
                                ],),
                            );
                          });
                        },
                        isThreeLine: true,
                        leading: CircleAvatar(
                          backgroundColor: Colors.redAccent,
                            child: Text("${index+1}",style: const TextStyle(
                              color: Colors.white
                            ),)),
                        title: Row(
                          children: [
                            Text(todo.title, overflow: TextOverflow.fade,),
                            const SizedBox(width: 4,),
                            Text(formattedDate, style: Theme.of(context).textTheme.bodySmall,),

                          ],
                        ),
                        subtitle: Text(todoList[index].details),
                        trailing: IconButton(onPressed: (){
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: const Text("Alert"),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                    showModalBottomSheet(context: context, builder: (context){

                                      return UpdateTaskModal(
                                        todo: todo,
                                        onTodoUpdate: (String updateTitle , String updateSubtitle){
                                          updateTodo(index, updateTitle, updateSubtitle);
                                        },
                                      );
                                    });
                                  },
                                    child: const Text("Edit",style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                    ),)),
                                InkWell(
                                  onTap: (){
                                    Navigator.pop(context);
                                    deleteTodo(index);

                                  },
                                    child: const Text("Delete",style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold
                                    ),))
                              ],),
                            );
                          });
                        }, icon: const Icon(CupertinoIcons.forward)),
                      );
                    },
                     itemCount: todoList.length,
                    separatorBuilder: (BuildContext context, int index){
                      return const Divider(
                        height: 4,
                      );
                    } ),
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: (){
        //      showModalBottomSheet(context: context, builder: (context){
        //        return AddNewTaskModal(onAddTap: (Todo task) {
        //
        //                addTodo(task);
        //        },);
        //        });
        //
        //      },
        //   child: const Icon(Icons.add),
        // ),
      ),
    );
  }

  void addTodo(Todo todo) {
    todoList.add(todo);
    setState(() {});
  }
  void deleteTodo(int index) {
    todoList.removeAt(index);
    setState(() {});
  }
  void updateTodo(int index, String todoTitle , String todoDetails) {
    todoList[index].title = todoTitle;
    todoList[index].details = todoDetails;
    setState(() {});
  }

  void updateTodoStatus(int index, String status) {
    todoList[index].status = status;
    setState(() {});
  }
}




