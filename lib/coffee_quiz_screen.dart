import 'package:flutter/material.dart';
import 'coffee_result_screen.dart';
import 'coffee_data.dart';

class CoffeeQuizScreen extends StatefulWidget {
  const CoffeeQuizScreen({super.key});

  @override
  _CoffeeQuizScreenState createState() => _CoffeeQuizScreenState();
}

class _CoffeeQuizScreenState extends State<CoffeeQuizScreen> {
  int _questionIndex = 0;
  List<String> _selectedAnswers = [];

  final List<Map<String, Object>> _questions = [
    {
      'questionText': 'Nasıl bir kahve tadı tercih edersiniz?',
      'answers': [
        {'text': 'Tatlı', 'score': 'Mocha'},
        {'text': 'Bitter', 'score': 'Espresso'},
        {'text': 'Hafif', 'score': 'Latte'},
        {'text': 'Yoğun', 'score': 'Turkish Coffee'}
      ]
    },
    {
      'questionText': 'Kahvenizin sıcaklığını nasıl seversiniz?',
      'answers': [
        {'text': 'Sıcak', 'score': 'Americano'},
        {'text': 'Soğuk', 'score': 'Cold Brew'},
        {'text': 'Ilık', 'score': 'Latte Macchiato'},
        {'text': 'Buzlu', 'score': 'Frappe'}
      ]
    },
    {
      'questionText': 'Kahvenizde süt kullanır mısınız?',
      'answers': [
        {'text': 'Evet', 'score': 'Flat White'},
        {'text': 'Hayır', 'score': 'Espresso Con Panna'},
        {'text': 'Biraz', 'score': 'Cappuccino'},
        {'text': 'Yoğun', 'score': 'Ca Phe Sua Da'}
      ]
    },
    {
      'questionText': 'Alkol içeren kahveleri sever misiniz?',
      'answers': [
        {'text': 'Evet', 'score': 'Irish Coffee'},
        {'text': 'Hayır', 'score': 'Turkish Coffee'},
        {'text': 'Denemek isterim', 'score': 'Affogato'},
        {'text': 'Pek tercih etmem', 'score': 'Filtre Kahve'}
      ]
    },
    {
      'questionText': 'Kahvenizde tatlandırıcı kullanır mısınız?',
      'answers': [
        {'text': 'Şeker', 'score': 'Turkish Coffee'},
        {'text': 'Tatlandırıcı', 'score': 'Caffè Misto'},
        {'text': 'Bal', 'score': 'Marocchino'},
        {'text': 'Şurup', 'score': 'Latte'}
      ]
    },
    {
      'questionText': 'Kahvenizin ne kadar yoğun olmasını istersiniz?',
      'answers': [
        {'text': 'Çok yoğun', 'score': 'Espresso'},
        {'text': 'Orta', 'score': 'Cappuccino'},
        {'text': 'Hafif', 'score': 'Flat White'},
        {'text': 'Değişken', 'score': 'Latte'}
      ]
    },
    {
      'questionText': 'Hangi ülkeden kahve tercih edersiniz?',
      'answers': [
        {'text': 'İtalya', 'score': 'Espresso'},
        {'text': 'Fransa', 'score': 'Caffè Misto'},
        {'text': 'Vietnam', 'score': 'Ca Phe Sua Da'},
        {'text': 'Endonezya', 'score': 'Kopi Luwak'}
      ]
    },
    {
      'questionText': 'Kahvenizde farklı tatlar denemek ister misiniz?',
      'answers': [
        {'text': 'Evet', 'score': 'Mocha'},
        {'text': 'Hayır', 'score': 'Filtre Kahve'},
        {'text': 'Bazen', 'score': 'Latte Macchiato'},
        {'text': 'Kararsızım', 'score': 'Affogato'}
      ]
    },
    {
      'questionText': 'Kahvenizi nasıl içmeyi tercih edersiniz?',
      'answers': [
        {'text': 'Hızlı', 'score': 'Espresso'},
        {'text': 'Yavaşça', 'score': 'Turkish Coffee'},
        {'text': 'Keyifle', 'score': 'Latte'},
        {'text': 'Arkadaşlarla', 'score': 'Cappuccino'}
      ]
    },
  ];

  void _answerQuestion(String score) {
    _selectedAnswers.add(score);
    setState(() {
      _questionIndex++;
    });
    if (_questionIndex < _questions.length) {
      print('Daha fazla soru var!');
    } else {
      print('Test tamamlandı!');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CoffeeResultScreen(coffeeType: _selectedAnswers.last),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kahve Testi'),
      ),
      body: Center(
        child: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : const Center(
                child: Text('Quiz tamamlandı!'),
              ),
      ),
    );
  }
}

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function(String) answerQuestion;

  const Quiz({
    super.key,
    required this.questions,
    required this.questionIndex,
    required this.answerQuestion,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          questions[questionIndex]['questionText'] as String,
          style: const TextStyle(fontSize: 28),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        ...(questions[questionIndex]['answers'] as List<Map<String, Object>>).map((answer) {
          return ElevatedButton(
            onPressed: () => answerQuestion(answer['score'] as String),
            child: Text(answer['text'] as String),
          );
        }).toList()
      ],
    );
  }
}
