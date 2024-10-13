import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller= TextEditingController();
   List todoList=[];

   void checkBoxChanged(int index){
    setState(() {
      todoList [index][1]=!todoList[index][1];
    });
   }

   void saveNewTask(){
    setState(() {
      todoList.add([_controller.text,false]);
      _controller.clear();
    });
   }
   void deleteTask(int index){
    setState(() {
      todoList.removeAt(index);
    });
   }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 246, 245, 247),
      appBar: AppBar(
        title: const Text('Simple Todo'),
        backgroundColor: const Color.fromARGB(255, 22, 74, 99),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(itemCount: todoList.length,
      itemBuilder: (BuildContext context, index) {
        return TodoList(
          taskName: todoList[index][0],
          taskCompleted:todoList[index][1] ,
          onChanged: (value) => checkBoxChanged(index),
          deleteFunction:(contex)=> deleteTask(index),
        );
      }
      ),
      floatingActionButton:Padding(padding: const EdgeInsets.symmetric(horizontal:20 ),
       child:  Row(
        children: [
       Expanded(
        child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20,
        
        ),
       child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          hintText: 'Add a new todo item',
          filled: true,
          fillColor: const Color.fromARGB(255, 205, 214, 221),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 45, 89, 131),
            ),
            borderRadius: BorderRadius.circular(15)
          ),
           focusedBorder: OutlineInputBorder(
            borderSide:const BorderSide(
              color: Colors.deepPurple,
            ),
            borderRadius: BorderRadius.circular(15)
          )
        ),
       ),
        ) 
       ) ,
        FloatingActionButton(
        onPressed: saveNewTask,
      child:const Icon(Icons.add)
      ),
      ],)
      ) 
    );
  }
}