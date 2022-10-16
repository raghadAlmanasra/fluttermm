import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override



  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Student App',


    home: Scaffold(
        appBar: AppBar(title: Text("Student list"),),
        body: ListView.builder(
            itemCount: students.length,
            itemBuilder: (BuildContext context, int index){

              return studentItem(

                  image: students[index].image,
                  id: students[index].id,
                  name: students[index].name,
                  grade: students[index].grade,
                i:index

              );
            }),



        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {

          },
          label: const Text('ADD New Student'),
          icon: const Icon(Icons.add),
          backgroundColor: Colors.blue ,
        ),


      ) ,
    );
  }
}




class student {
  String id;
  String name;
  String image;
  double grade;

  student(this.id, this.name, this.image, this.grade);
}

List<student> students = [
  student("111", "ali", "m2.jpg", 8.7),
  student("222", "mohmmad", "m3.jpg", 7.5),
  student("333", "ahmad", "m1.jpg", 9.3),
  student("444", "sara", "m2.jpg", 8.7),

];



class studentItem extends StatelessWidget{

  final String id;
  final String name;
  final String image;
  final double grade;
  final int i ;


  studentItem({required this.image, required this.name,required this.id ,required this.grade ,required this.i });


  void remove (int index){
    students.removeAt(index);

  }

  void add (student s){
    students.add(s);
  }

  @override
  Widget build(BuildContext context) {


    return Container(

      padding: EdgeInsets.all(4),
      height: 120,
      child: Card(
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 35.0,
              backgroundImage:
              AssetImage('assets/images/' + this.image),
            //  AssetImage('assets/images/' + student.image),
            ),


            Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 5, 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("ID:" +id, style: TextStyle(fontWeight: FontWeight.bold),),
                      Text("Name:"+this.name),

                      Text(this.grade.toString()),


                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {

                          remove(i);

                        },
                      ),



                    ],
                  ),
                )
            )
          ],
        ),

      ),

    );



  }


}



