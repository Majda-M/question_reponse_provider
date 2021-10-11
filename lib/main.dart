import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:question_reponse_provider/bloc/quiz.cubit.dart';
import 'package:question_reponse_provider/pages/quiz.cubit.page.dart';
import 'package:question_reponse_provider/pages/quiz.provider.page.dart';
import 'package:question_reponse_provider/provider/quiz.state.dart';

void main()=> runApp(MyApp());

//pour utiliser Cubit
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MultiBlocProvider(
     providers: [
       BlocProvider(create: (context)=>QuizCubit())
     ],
     child: MaterialApp(
       title: 'Question/Reponse',
       theme: ThemeData(
         primarySwatch: Colors.blueGrey,
       ),
       routes: {
         "/":(context)=>QuizCubitPage()
       },
     ),
   );
  }

}
//pour utiliser Provider
class MyApp1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>QuizState())
      ],
      child: MaterialApp(
        title: 'Question/Reponse',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        routes: {
          "/":(context)=>QuizProviderPage()
        },
      ),
    );
  }

}