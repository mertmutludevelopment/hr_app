class Task {
  final String task;
  final String departments;
  final DateTime deadline;
  final String description;

  const Task({
    required this.description,
    required this.deadline,
    required this.departments,
    required this.task,
  });

  factory Task.fromMap(Map<String, dynamic> map) {
    final properties = map['properties'] as Map<String, dynamic>;
    final dateStr = properties['Deadline']?['date']?['start'];
    return Task(
      description:
          properties['Description']?['rich_text']?[0]?['plain_text'] ?? '?',
      deadline: dateStr != null ? DateTime.parse(dateStr) : DateTime.now(),
      departments: properties['Department']?['select']?['name'] ?? '?',
      task: properties['Task']?['title']?[0]?['plain_text'] ?? '?',
    );
  }
}
