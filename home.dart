import 'package:first_flutter_app/model/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name("kishanis hewre", true),
    Question.name("kishanisnot hewre", false),

    ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset("images/flag.png",
             width:250,
                height: 180,),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                      color: Colors.blueGrey.shade700,style: BorderStyle.solid,
                    )
                  ),
                  height: 120.0,
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(questionBank[_currentQuestionIndex].questionText,style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),),
                  )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(onPressed: () => _checkAns(true,context),
                  color: Colors.blueGrey.shade700,
                  child: Text("TRUE"),),

                  RaisedButton(onPressed: () => _checkAns(false,context),
                    color: Colors.blueGrey.shade700,
                    child: Text("FALSE"),),

                  RaisedButton(onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade700,
                    child: Icon(Icons.arrow_forward),),

                ],
              ),
              Spacer(),

            ],
          ),
        ),
      ),
    );
  }
  _checkAns(bool userChoice, BuildContext context){

   if(userChoice == questionBank[_currentQuestionIndex].isCorrect){

     final snackbar = SnackBar(backgroundColor: Colors.green,
         duration: Duration(milliseconds: 500),
         content: Text("Correct"));
     Scaffold.of(context).showSnackBar(snackbar);

     setState(() {
       _currentQuestionIndex++;
     });

   }else{


     final snackbar = SnackBar(backgroundColor: Colors.redAccent,
         duration: Duration(milliseconds: 500),content: Text("wrong"));
     Scaffold.of(context).showSnackBar(snackbar);
   }
  }
  _nextQuestion(){
   setState(() {
     _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
   });
  }
}

