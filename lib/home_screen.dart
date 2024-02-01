import 'package:flutter/material.dart';
import 'package:simple_todoapp/style.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List todoList= [];
  String item= "";
  inputOnChanged(content){
    item= content;
  }
  addItem(){
    todoList.add({"item": item});
    setState(() {});
  }
  removeItem(index){
    todoList.removeAt(index);
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do App"),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 70,
                  child: TextFormField(
                    onChanged: (content){
                      inputOnChanged(content);
                    },decoration: AppInputDecoration("List Item"),
                  ),
                ),
                Expanded(
                  flex: 30,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ElevatedButton(
                      onPressed: (){
                        if(item.isNotEmpty){
                          addItem();
                        }
                      },
                      child: Text("Add"),
                      style: AppButtonStyle(),
                    ),
                  ),
                )
              ],
            ),
            Expanded(
              flex: 85,
              child: ListView.builder(
                itemCount: todoList.length,
                itemBuilder: (context,index){
                  return Card(
                    child: SizedBox50(
                      Row(
                        children: [
                          Expanded(
                            flex: 80,
                            child: Text(todoList[index]["item"]),
                          ),
                          Expanded(
                            flex: 20,
                            child: TextButton(onPressed: (){
                              removeItem(index);
                            }, child: Icon(Icons.delete),
                            ),
                          ),
                        ],
                      )
                    ),
                  );
                },),
            ),
          ],
        ),
      ),
    );
  }
}
