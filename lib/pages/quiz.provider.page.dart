import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:question_reponse_provider/provider/quiz.state.dart';


class QuizProviderPage extends StatelessWidget{
  List<Question> questions = _getQuestions();
  int index=0;

  @override
  Widget build(BuildContext context) {
    QuizState quizState=Provider.of<QuizState>(context,listen: false);
    questions=_getQuestions();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Questions/Response'),
      ),
      backgroundColor: Colors.blueGrey,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200,
              width: 400,
              child: Image.asset('assets/photo.png')
            ),
            Consumer<QuizState>(
              builder: (context,QuizState qs,child){
                index= qs.questionIndex;
                return  Container(
                  height: 150,
                  width: 300,
                  decoration: new BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                  ),

                  child: Text(questions.elementAt(index).questionText,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold),),

                );
              },
            ),
            Container(
              height: 150,
              width: 300,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(onPressed: (){quizState.checkAnswer(true, questions.elementAt(index), questions.length);}, child: Text("VRAI"),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),),
                  ElevatedButton(onPressed: (){quizState.checkAnswer(false, questions.elementAt(index), questions.length);}, child: Text("FAUX"),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),),
                  ElevatedButton(onPressed: (){quizState.nextQuestion(questions.length);}, child: Icon(Icons.arrow_forward),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),)
                ],
              ),


            ),
            Consumer<QuizState>(
              builder: (context,QuizState qs,child){
                if(qs.responseStatus == true)
                return  Container(
                  child: Text('Reponse correcte'),
                );
                else
                  return Container(
                    child: Text('Reponse incorrecte'),
                  );
              },

           )

           //

          ],
        ),
      ),

    );
  }
  
}
List<Question> _getQuestions() {
  List<Question> listQuestions = [];
  listQuestions.addAll([
    Question(
        isCorrect: true,
        questionText: "La Loire est le plus long fleuve s'??coulant enti??rement sur le territoire fran??ais."),
    Question(
        isCorrect: false,
        questionText:
        "Auxerre est la pr??fecture de la Ni??vre."),
    Question(
        isCorrect: true,
        questionText: "Agen, la pr??fecture du Lot-et-Garonne, se trouve sur les rives de la Garonne."),
    Question(
        isCorrect: false,
        questionText:
        "C'est dans la cath??drale Notre-Dame d'Amiens qu'ont ??t?? sacr??s la plupart des rois de France."),
    Question(
        isCorrect: true,
        questionText:
        "Le Champsaur est une vall??e du d??partement des Hautes-Alpes, au nord de Gap."),

  ]);
  return listQuestions;
}
class Question{
  String questionText;
  bool isCorrect;

  Question({required this.questionText,required this.isCorrect});

}
