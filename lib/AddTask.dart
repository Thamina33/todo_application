import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/todo.dart';

class AddNewTaskModal extends StatefulWidget {
  const AddNewTaskModal({
    super.key,
    required this.onAddTap
  });
  final Function(Todo) onAddTap;


  @override
  State<AddNewTaskModal> createState() => _AddNewTaskModalState();
}

class _AddNewTaskModalState extends State<AddNewTaskModal> {
  final TextEditingController _todoTitleController = TextEditingController();
  final TextEditingController _todoSubTitleController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              // const SizedBox(height: 12,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: [
              //     Text("Add New Task" , style: Theme.of(context).textTheme.titleLarge,),
              //     IconButton(onPressed: (){
              //       Navigator.pop(context);
              //     }, icon: Icon(Icons.close))
              //   ],
              // ),
              const SizedBox(height: 12,),
              TextFormField(
                textInputAction: TextInputAction.next,
                controller: _todoTitleController,
                decoration: InputDecoration(
                  hintText: "Title",
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        width: 1, color: Colors.red,

                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        width: 1, color: Colors.green,

                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        width: 1, color: Colors.grey,

                      )
                  ),
                ),
                validator: (String? value){
                  if(value?.isEmpty ?? true){
                    return 'Enter a value';
                  }
                   return null;
                },
              ),
              const SizedBox(height: 6,),
              TextFormField(
                textInputAction: TextInputAction.done,
                controller: _todoSubTitleController,
                decoration: InputDecoration(
                  hintText: "Add details",
                  errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        width: 1, color: Colors.red,

                      )
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        width: 1, color: Colors.green,

                      )
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: const BorderSide(
                        width: 1, color: Colors.grey,

                      )
                  ),
                ),
                validator: (String? value){
                  if(value?.isEmpty ?? true){
                    return 'Enter a value';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8,),
              ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    Todo todo =Todo(title: _todoTitleController.text.trim(), details: _todoSubTitleController.text.trim(), createdDateTime: DateTime.now(), updatedDateTime: DateTime.now());
                    widget.onAddTap(todo);
                    //Navigator.pop(context);
                  }
                 _todoTitleController.clear();
                 _todoSubTitleController.clear();
                    FocusManager.instance.primaryFocus?.unfocus();

                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),), child: const Text("Add", style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14
              ),),

              )
            ],
          ),
        ),
      ),
    );
  }
}
