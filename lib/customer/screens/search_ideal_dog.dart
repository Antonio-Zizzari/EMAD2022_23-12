import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:justpet/customer/components/widget/ideal_dog_result.dart';
import 'package:justpet/customer/screens/ListaVeterinari.dart';
import 'package:justpet/customer/screens/favorite_dogs_race_screen.dart';
import 'package:justpet/global/components/appbar.dart';
import 'package:justpet/customer/models/utils_functions.dart';
import 'package:survey_kit/survey_kit.dart';
import '../../global/components/SideMenu.dart';
import '../../customer/models/dog_race_class.dart';


class SearchIdealDog extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final user = FirebaseAuth.instance.currentUser!;
  var steps = [
    InstructionStep(
      title: 'Benvenuto al test\nper capire quale\nanimale fa per te!',
      text: 'Rispondi al nostro breve test per scegliere il cane ideale più compatibile',
      buttonText: 'Procediamo!',
      showAppBar: false,
    ),
    QuestionStep(
      buttonText: "Successivo",
      title: 'Domanda #1',
      text: 'Inserisci il luogo nel quale il tuo nuovo cane vivrà',
      isOptional: false,
      answerFormat: const SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(text: 'Casa con giardino', value: 'Casa con giardino'),
          TextChoice(text: 'Casa spaziosa', value: 'Casa spaziosa'),
          TextChoice(text: 'Casa piccola', value: 'Casa piccola'),
        ],
      ),
    ),
    QuestionStep(
      buttonText: "Successivo",
      title: 'Domanda #2',
      text: 'Ok, ci siamo....ora, cosa vuoi che il tuo cane faccia con te?',
      isOptional: false,
      answerFormat: SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(text: 'Passegiate e giochi', value: 'Passegiate e giochi'),
          TextChoice(text: 'Guardia alla casa', value: 'Guardia alla casa'),
          TextChoice(text: 'Frequenti sport con me', value: 'Frequenti sport con me'),
        ],
      ),
    ),
    QuestionStep(
      buttonText: "Successivo",
      title: 'Domanda #3',
      text: 'Perfetto, vorrei sapere ora con chi starà il tuo cane, ovvero chi lo accudirà...',
      isOptional: false,
      answerFormat: SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(text: 'Da solo o in coppia', value: 'Da solo o in coppia'),
          TextChoice(text: 'Coppia con bambini', value: 'Coppia con bambini'),
          TextChoice(text: 'Amico di tutti', value: 'Amico di tutti'),
        ],
      ),
    ),
    QuestionStep(
      buttonText: "Successivo",
      title: 'Domanda #4',
      text: 'Mhh...okay...ora mi interessa sapere, quanto tempo passerai con lui?',
      isOptional: false,
      answerFormat: SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(text: 'Sarà curato in tutto', value: 'Sarà curato in tutto'),
          TextChoice(text: 'Ho tempo di stare con lui, ma non per le toelettature', value: 'Ho tempo di stare con lui, ma non per le toelettature'),
          TextChoice(text: 'Poche ore al giorno', value: 'Poche ore al giorno'),
        ],
      ),
    ),
    QuestionStep(
      buttonText: "Successivo",
      title: 'Domanda #5',
      text: 'Altra domanda...hai già esperienza con i cani?',
      isOptional: false,
      answerFormat: SingleChoiceAnswerFormat(
        textChoices: [
          TextChoice(text: 'Si, ho già avuto cani ma non ne ho più nessuno', value: 'Si, ho già avuto cani ma non ne ho più nessuno'),
          TextChoice(text: 'Si, ne ho già in casa e ne voglio un altro', value: 'Si, ne ho già in casa e ne voglio un altro'),
          TextChoice(text: 'No, è la mia prima esperienza con un cane', value: 'No, è la mia prima esperienza con un cane'),
        ],
      ),
    ),
    QuestionStep(
      content: Container(
        height: 300,
      ),
      buttonText: "Finisci test",
      title: 'Domanda #6\n(Opzionale)',
      text: 'Okay, ultima domanda...descrivi come vorresti il cane con una breve descrizione, questo potrebbe aiutare a migliorare la risposta...',
      isOptional: true,
      answerFormat: TextAnswerFormat(
        hint: 'es. Il mio cane deve essere piccolo',
        maxLines: 5,
      ),
    ),
    CompletionStep(
      stepIdentifier: StepIdentifier(id: '321'),
      title: 'Fine',
      text: 'Hai terminato il sondaggio!\nCliccando su \"Trova il mio cane\", troveremo il cane giusto per te, procedi!',
      buttonText: 'Trova il mio cane',
    ),
  ];

  //Tema del widget
  ThemeData data = ThemeData(
    textTheme: const TextTheme(
      //NUMERO DELLA DOMANDA
      headline2: TextStyle(
        fontSize: 30,
        letterSpacing: 1.5,
        color: Colors.red,
        fontWeight: FontWeight.w500
      ),
      //TITOLO DELLA DOMANDA
      bodyText2: TextStyle(
          fontSize: 20,
          color: Colors.black54
      ),
      //RISPOSTE
      headline5: TextStyle(
        fontSize: 18,
        color: Colors.black54
      ),
    ),
    primaryTextTheme: const TextTheme(
      bodyLarge: TextStyle(
          fontSize: 15,
          color: Colors.red
      ),
    ),
    backgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      foregroundColor: Colors.red,
    ),
    buttonTheme: ButtonThemeData(
        padding: EdgeInsets.all(100)
    )
  );

  SearchIdealDog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MainAppBar(_scaffoldKey),
      drawer: SideMenu(),
      body: SurveyKit(
        themeData: data,
        showProgress: true,
        surveyController: SurveyController(
          onCloseSurvey: (context, resultFunction) => {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
              builder: (BuildContext context){
                return const FavoriteDogsRace();
              }
              ),(r){
                return false;
              }
            )
          }
        ),
        localizations: {
          "cancel": "CHIUDI",
          "NEXT": "successivo"
        },
        onResult: (SurveyResult result) async{
          String query="", res="";
          //Prendiamo le risposte
          for(int i = 1; i < result.results.length - 1; i++){
            for(int j = 0; j < result.results[i].results.length; j++){
              print(result.results[i].results[j].valueIdentifier);
              query+=result.results[i].results[j].valueIdentifier!+". ";
            }
          }
          final response = LuisQuery(query);
          await response.then((value) => {print(value),print(value['prediction']['topIntent']), res=value['prediction']['topIntent']});
          List<DogRace> razza = [allRaces[""+res]!];
          //Evaluate the results
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => IdealDogResult(razza: razza),
              )
          );
        },
        task: OrderedTask(steps: steps, id: TaskIdentifier()),
      ),
    );
  }
}


