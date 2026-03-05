/// Project Model for Portfolio
class ProjectModel {
  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final String? projectUrl;
  final String? githubUrl;

  ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    this.projectUrl,
    this.githubUrl,
  });
}

/// Mock data for projects
final List<ProjectModel> projectsMockData = [
  ProjectModel(
    id: '1',
    title: 'E-Commerce Mobile App',
    description:
        'A comprehensive e-commerce application built with Flutter supporting iOS and Android with payment integration and real-time product updates.',
    imageUrl: 'assets/images/ecommerce.png',
    technologies: ['Flutter', 'Firebase', 'Stripe', 'GetX'],
    projectUrl: 'https://example.com/ecommerce',
    githubUrl: 'https://github.com/example/ecommerce',
  ),
  ProjectModel(
    id: '2',
    title: 'Social Media Feed',
    description:
        'Real-time social media feed application with user authentication, post creation, and social interactions built with Flutter and Firestore.',
    imageUrl: 'assets/images/social.png',
    technologies: ['Flutter', 'Firebase', 'Riverpod', 'Firestore'],
    projectUrl: 'https://example.com/social',
    githubUrl: 'https://github.com/example/social',
  ),
  ProjectModel(
    id: '3',
    title: 'Task Management Dashboard',
    description:
        'Productive task management dashboard with drag-and-drop support, team collaboration features, and real-time synchronization.',
    imageUrl: 'assets/images/taskboard.png',
    technologies: ['Flutter', 'Supabase', 'Provider', 'WebSockets'],
    projectUrl: 'https://example.com/taskboard',
    githubUrl: 'https://github.com/example/taskboard',
  ),
  ProjectModel(
    id: '4',
    title: 'Weather Forecast App',
    description:
        'Modern weather application with beautiful animations, location-based forecasts, and offline support using local caching.',
    imageUrl: 'assets/images/weather.png',
    technologies: ['Flutter', 'OpenWeather API', 'Hive', 'Animations'],
    projectUrl: 'https://example.com/weather',
    githubUrl: 'https://github.com/example/weather',
  ),
  ProjectModel(
    id: '5',
    title: 'Fitness Tracking App',
    description:
        'Comprehensive fitness tracking application with workout logging, progress analytics, and personalized recommendations powered by machine learning.',
    imageUrl: 'assets/images/fitness.png',
    technologies: ['Flutter', 'Dart', 'Health API', 'Charts'],
    projectUrl: 'https://example.com/fitness',
    githubUrl: 'https://github.com/example/fitness',
  ),
  ProjectModel(
    id: '6',
    title: 'Learning Management System',
    description:
        'Educational platform for online learning with video streaming, quizzes, progress tracking, and interactive lessons.',
    imageUrl: 'assets/images/lms.png',
    technologies: ['Flutter', 'Node.js', 'MongoDB', 'WebRTC'],
    projectUrl: 'https://example.com/lms',
    githubUrl: 'https://github.com/example/lms',
  ),
];