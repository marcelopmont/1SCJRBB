import 'package:example_blocs/screens/quiz/components/question_button.dart';
import 'package:example_blocs/screens/quiz/finished_quiz_screen.dart';
import 'package:example_blocs/screens/quiz/model/question_model.dart';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  static const String id = 'quiz';

  const QuizScreen({Key? key}) : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<QuestionModel> questions = [];
  var questionIndex = 0;
  var score = 0;

  @override
  void initState() {
    super.initState();
    questions = loadQuestions();
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[questionIndex];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(currentQuestion.question),
              const SizedBox(height: 32),
              ListView.separated(
                itemCount: currentQuestion.options.length,
                shrinkWrap: true,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return QuestionButton(
                    text: currentQuestion.options[index],
                    onPressed: () {
                      onOptionPressed(index);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onOptionPressed(int selectedOption) {
    final currentQuestion = questions[questionIndex];

    if (selectedOption == currentQuestion.answer) {
      score++;
    }

    goToNextQuestion();
  }

  void goToNextQuestion() {
    if (questionIndex == questions.length - 1) {
      Navigator.pushReplacementNamed(
        context,
        FinishedQuizScreen.id,
        arguments: FinishedQuizScreenArguments(
          score: score,
        ),
      );
    } else {
      setState(() {
        questionIndex++;
      });
    }
  }

  List<QuestionModel> loadQuestions() {
    return [
      QuestionModel(
          question: 'Qual ?? o pa??s que mais produz caf?? no mundo?',
          options: ['Canad??', '??ndia', 'Argentina', 'Brasil', 'Eti??pia'],
          answer: 3),
      QuestionModel(
          question: 'Pa??s conhecido por ser o mais fechado do mundo',
          options: ['Myanmar', 'Cor??ia do Norte', 'Arm??nia', 'I??men', 'Vietn??'],
          answer: 1),
      QuestionModel(
          question: 'Pa??s que possui a Groel??ndia como territ??rio',
          options: [
            'Finl??ndia',
            'Canad??',
            'Reino Unido',
            'Estados Unidos',
            'Dinamarca'
          ],
          answer: 4),
      QuestionModel(
          question: 'Pa??s com a maior m??dia de qi',
          options: ['China', 'Alemanha', 'Jap??o', 'Cor??ia do Sul', 'Noruega'],
          answer: 3),
      QuestionModel(
          question: 'Pa??s com maior IDH (??ndice de desenvolvimento humano)',
          options: ['Noruega', 'Reino Unido', 'Canad??', 'Holanda', 'M??xico'],
          answer: 0),
      QuestionModel(
          question: 'Continente menos industrializado',
          options: ['??frica', '??sia', 'Oceania'],
          answer: 0),
      QuestionModel(
          question: 'Pa??s com maior comunidade japonesa fora do Jap??o',
          options: ['Estados Unidos', 'Brasil', 'Cor??ia do Sul'],
          answer: 1),
    ];
  }
}
