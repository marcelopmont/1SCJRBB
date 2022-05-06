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
          question: 'Qual é o país que mais produz café no mundo?',
          options: ['Canadá', 'Índia', 'Argentina', 'Brasil', 'Etiópia'],
          answer: 3),
      QuestionModel(
          question: 'País conhecido por ser o mais fechado do mundo',
          options: ['Myanmar', 'Coréia do Norte', 'Armênia', 'Iêmen', 'Vietnã'],
          answer: 1),
      QuestionModel(
          question: 'País que possui a Groelândia como território',
          options: [
            'Finlândia',
            'Canadá',
            'Reino Unido',
            'Estados Unidos',
            'Dinamarca'
          ],
          answer: 4),
      QuestionModel(
          question: 'País com a maior média de qi',
          options: ['China', 'Alemanha', 'Japão', 'Coréia do Sul', 'Noruega'],
          answer: 3),
      QuestionModel(
          question: 'País com maior IDH (índice de desenvolvimento humano)',
          options: ['Noruega', 'Reino Unido', 'Canadá', 'Holanda', 'México'],
          answer: 0),
      QuestionModel(
          question: 'Continente menos industrializado',
          options: ['África', 'Ásia', 'Oceania'],
          answer: 0),
      QuestionModel(
          question: 'País com maior comunidade japonesa fora do Japão',
          options: ['Estados Unidos', 'Brasil', 'Coréia do Sul'],
          answer: 1),
    ];
  }
}
