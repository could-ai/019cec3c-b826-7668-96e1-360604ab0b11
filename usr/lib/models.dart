class Topic {
  final String id;
  final String title;
  final String icon;
  final String summary;
  final String explanation;

  Topic({
    required this.id,
    required this.title,
    required this.icon,
    required this.summary,
    required this.explanation,
  });
}

class ChatMessage {
  final String text;
  final bool isUser;

  ChatMessage({
    required this.text,
    required this.isUser,
  });
}

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctIndex,
  });
}

// Mock Data
final List<Topic> mockTopics = [
  Topic(
    id: '1',
    title: 'Photosynthesis',
    icon: '🌿',
    summary: 'How plants make their food using sunlight.',
    explanation: 'Photosynthesis is the process used by plants, algae and certain bacteria to harness energy from sunlight and turn it into chemical energy.\n\nHere is how it works in simple terms:\n1. Plants take in carbon dioxide from the air.\n2. They absorb water from the soil.\n3. Using sunlight as energy, they convert these into glucose (sugar) for food and release oxygen into the air!',
  ),
  Topic(
    id: '2',
    title: 'Newton\'s Laws',
    icon: '🍎',
    summary: 'The three fundamental laws of motion.',
    explanation: 'Sir Isaac Newton formulated three laws of motion that describe the relationship between a body and the forces acting upon it.\n\n1. First Law (Inertia): An object at rest stays at rest, and an object in motion stays in motion unless acted upon by a force.\n2. Second Law (F=ma): The force acting on an object is equal to its mass times its acceleration.\n3. Third Law: For every action, there is an equal and opposite reaction.',
  ),
  Topic(
    id: '3',
    title: 'Intro to Python',
    icon: '🐍',
    summary: 'Basics of the Python programming language.',
    explanation: 'Python is a high-level, interpreted programming language known for its simplicity and readability.\n\nKey concepts:\n- Variables: Store data values (e.g., x = 5).\n- Loops: Repeat a block of code (e.g., for loop, while loop).\n- Functions: Reusable blocks of code that perform a specific task.\n\nIt is widely used in AI, web development, and data analysis!',
  ),
];

final List<QuizQuestion> mockQuiz = [
  QuizQuestion(
    question: 'What gas do plants absorb from the air during photosynthesis?',
    options: ['Oxygen', 'Carbon Dioxide', 'Nitrogen', 'Hydrogen'],
    correctIndex: 1,
  ),
  QuizQuestion(
    question: 'Which of Newton\'s laws is also known as the Law of Inertia?',
    options: ['First Law', 'Second Law', 'Third Law', 'Fourth Law'],
    correctIndex: 0,
  ),
  QuizQuestion(
    question: 'In Python, how do you assign the value 5 to a variable named x?',
    options: ['int x = 5;', 'x <- 5', 'x = 5', 'assign x = 5'],
    correctIndex: 2,
  ),
];
