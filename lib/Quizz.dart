import 'package:flutter/material.dart';

import 'class/Question.dart';

class Quizz extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new _QuizzState();
  }
}

class _QuizzState extends State<Quizz>{
  var index = 0;
  var score = 0;
  var list_lenght = 0;

  @override
  Widget build(BuildContext context) {


    List<Question> listeQuestions = [
      new Question('La devise de la belgique est : "L\'union fait la force"', true, '', 'images/belgique.JPG'),
      new Question('La lune vas finir par tomber sur la Terre à cause de la gravitée', false, 'Au contraire, elle s\'éloigne de la Terre', 'images/lune.jpg'),
      new Question('La Russie à une plus grande supperficie que Ploton', true, ' ', 'images/russie.jpg'),
      new Question('Nyctalope est une rare espèce naine d\'antilopes', false, 'C\'est une abtitude à voir dans le noir' , 'images/nyctalope.jpg'),
      new Question('Le Commodore 64 est l\’oridnateur de bureau le plus vendu', true, '', 'images/commodore.jpg'),
      new Question('Le nom du drapeau des pirates est black skull', false, 'Il est appelé Jolly Roger', 'images/pirate.png'),
      new Question('Haddock est le nom du chien de Tintin', false, 'C\'est Milou', 'images/tintin.jpg'),
      new Question('La barbe des pharaons était fausse', true, 'A l\'époque déjà ils utilisaient des postiches', 'images/pharaon.jpg'),
      new Question('Au Québec tire toi une bûche veut dire : "viens viens t\'asseoir"', true, 'La bûche, fameuse chaise de bucheron', 'images/buche.jpg'),
      new Question('Le module lunaire Eagle de possédait de 4Ko de Ram', true, 'Dire que je me plains avec mes 8GO de ram sur PC', 'images/eagle.jpg'),
    ];


    int rangQuestion;
    String imagePath;
    String question;

    return new Scaffold(
      appBar: AppBar(
        title: Text('Le Quizz'),
      ),
      body: Center(
        child: pagesQuestion(listeQuestions),
      ),
    );
  }

  Column pagesQuestion(List<Question> listeQuestions){
    Question questionEnCours = listeQuestions[index];
    setState(() {
      list_lenght = listeQuestions.length;
    });
    var device_width = MediaQuery.of(context).size.width;


    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('Question numero ${index + 1}'),
        Text('Score $score / $index'),
        Container(
          width: device_width * 0.9,
          height: device_width * 0.9,
          child: Card(
            child: Image.asset(
              questionEnCours.imagePath,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Text(questionEnCours.question),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            RaisedButton(onPressed: () => reponseDialogue(questionEnCours, true),
              child: Text('Vrai'),
              color: Colors.green,
              textColor: Colors.white,
            ),
            RaisedButton(onPressed: () => reponseDialogue(questionEnCours, false),
              child: Text('Faux'),
              color: Colors.red[400],
              textColor: Colors.white,
            )
          ],
        )
      ],
    );
  }

  Future<Null> reponseDialogue (Question question, bool user_response) {
    bool good_answer = (user_response == question.reponse) ? true : false;

    return showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
        return new SimpleDialog(
          title: (good_answer) ? Text('Bonne réponse', textScaleFactor: 1.5 ,style: TextStyle(color: Colors.green),) : Text('Mauvaise réponse', textScaleFactor: 2.0 ,style: TextStyle(color: Colors.red)),
          contentPadding: EdgeInsets.all(10),
          children: [
            Container(
              child: Image.asset((good_answer) ? 'images/vrai.jpg' : 'images/faux.jpg'),
            ),
            Text(question.explication),
            RaisedButton(
                onPressed: () => nextQuestion(good_answer),
              child: Text('Question Suivante'),
              color: Colors.teal,
              textColor: Colors.white,
            )
          ],
        );
      }
    );
  }

  void nextQuestion(good_answer) {
    setState(() {
      if(index+1 < list_lenght){
        index++;
      }else{
        Navigator.pop(context);
      }
      if (good_answer) {
        score++;
      }
    });
    Navigator.pop(context);
  }
}