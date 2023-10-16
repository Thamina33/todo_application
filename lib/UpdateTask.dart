import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_application/todo.dart';

class UpdateTaskModal extends StatefulWidget {
  const UpdateTaskModal({super.key,
  required this.todo,
  required this.onTodoUpdate});

  final Todo todo;
  final Function(String, String) onTodoUpdate;


  @override
  State<UpdateTaskModal> createState() => _UpdateTaskModalState();
}

class _UpdateTaskModalState extends State<UpdateTaskModal> {
  late TextEditingController _todoTitleController ;
  late TextEditingController _todoSubTitleController ;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _todoTitleController = TextEditingController(text: widget.todo.title);
    _todoSubTitleController = TextEditingController(text: widget.todo.details);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
              top: 50, bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 12,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("Update Task" , style: Theme.of(context).textTheme.titleLarge,),
                    IconButton(onPressed: (){
                      Navigator.pop(context);
                    }, icon: const Icon(Icons.close))
                  ],
                ),
                const SizedBox(height: 12,),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: _todoTitleController,
                  decoration: InputDecoration(
                    hintText: "Update Title",
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          width: 1, color: Colors.grey,

                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          width: 1, color: Colors.grey,

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
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: "Update details",
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          width: 1, color: Colors.grey,

                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: const BorderSide(
                          width: 1, color: Colors.grey,

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
                         widget.onTodoUpdate(
                           _todoTitleController.text.trim(),
                           _todoSubTitleController.text.trim()

                         );
                       }
                       Navigator.pop(context);
                    },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),),
                   child: const Text("Edit Done" , style: TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.bold,
                     fontSize: 14
                   ),),

                ),
                //SizedBox(height:MediaQuery.of(context).viewInsets.bottom),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
