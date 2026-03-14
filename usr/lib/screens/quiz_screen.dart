import 'package:flutter/material.dart';
import '../models.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentIndex = 0;
  int _score = 0;
  bool _hasAnswered = false;
  int? _selectedIndex;

  void _submitAnswer(int index) {
    if (_hasAnswered) return;

    setState(() {
      _hasAnswered = true;
      _selectedIndex = index;
      if (index == mockQuiz[_currentIndex].correctIndex) {
        _score++;
      }
    });
  }

  void _nextQuestion() {
    if (_currentIndex < mockQuiz.length - 1) {
      setState(() {
        _currentIndex++;
        _hasAnswered = false;
        _selectedIndex = null;
      });
    } else {
      _showResults();
    }
  }

  void _showResults() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Quiz Completed! 🎉'),
        content: Text('You scored $_score out of ${mockQuiz.length}.', style: const TextStyle(fontSize: 18)),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.pop(context); // Go back to topic
            },
            child: const Text('Done'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = mockQuiz[_currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Practice Quiz'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: LinearProgressIndicator(
            value: (_currentIndex + 1) / mockQuiz.length,
            backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Question ${_currentIndex + 1} of ${mockQuiz.length}',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              question.question,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            ...List.generate(question.options.length, (index) {
              bool isCorrect = index == question.correctIndex;
              bool isSelected = index == _selectedIndex;
              
              Color getButtonColor() {
                if (!_hasAnswered) return Theme.of(context).colorScheme.surface;
                if (isCorrect) return Colors.green.shade100;
                if (isSelected && !isCorrect) return Colors.red.shade100;
                return Theme.of(context).colorScheme.surface;
              }

              Color getBorderColor() {
                if (!_hasAnswered) return Theme.of(context).colorScheme.outlineVariant;
                if (isCorrect) return Colors.green;
                if (isSelected && !isCorrect) return Colors.red;
                return Theme.of(context).colorScheme.outlineVariant;
              }

              return Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: InkWell(
                  onTap: () => _submitAnswer(index),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: getButtonColor(),
                      border: Border.all(color: getBorderColor(), width: 2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            question.options[index],
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        if (_hasAnswered && isCorrect)
                          const Icon(Icons.check_circle, color: Colors.green),
                        if (_hasAnswered && isSelected && !isCorrect)
                          const Icon(Icons.cancel, color: Colors.red),
                      ],
                    ),
                  ),
                ),
              );
            }),
            const Spacer(),
            if (_hasAnswered)
              ElevatedButton(
                onPressed: _nextQuestion,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Theme.of(context).colorScheme.onPrimary,
                ),
                child: Text(_currentIndex < mockQuiz.length - 1 ? 'Next Question' : 'See Results', style: const TextStyle(fontSize: 18)),
              ),
          ],
        ),
      ),
    );
  }
}
