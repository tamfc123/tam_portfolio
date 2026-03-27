/// Project Model for Portfolio
class ProjectModel {
  final String id;
  final String title;
  final String description;
  // Image and project URL are intentionally not used in cards;
  // these properties were removed from the UI and may be
  // repurposed later for a dedicated "view" feature.
  final List<String> technologies;
  final String? githubUrl;
  final List<String> images;
  final String? youtubeUrl;

  ProjectModel({
    required this.id,
    required this.title,
    required this.description,
    required this.technologies,
    this.githubUrl,
    this.images = const [],
    this.youtubeUrl,
  });
}

/// Mock data for projects
final List<ProjectModel> projectsMockData = [
  ProjectModel(
    id: '1',
    title: 'E-Commerce Mobile App',
    description:
        'Ứng dụng bán quần áo xây dựng bằng Flutter, hỗ trợ thanh toán, quản lý sản phẩm.',
    technologies: ['Flutter', 'MongoDB', 'Cloudinary', 'Bloc'],
    githubUrl: 'https://github.com/tamfc123/fashion_fontend',
    images: [
      'assets/images/ecom1.png',
      'assets/images/ecom2.png',
      'assets/images/ecom3.png',
    ],
  ),
  ProjectModel(
    id: '2',
    title: 'English Learning Mobile App',
    description:
        'Ứng dụng học tiếng Anh cho sinh viên với các tính năng quiz, flashcards, vocabulary practice, và nhiều hơn nữa.',
    technologies: [
      'Flutter',
      'PostgreSQL',
      'Provider',
      'Cloudinary',
      'Azure Services',
    ],
    githubUrl: 'https://github.com/tamfc123/fontend_mobile',
    images: [
      'assets/images/english1.jpg',
      'assets/images/english2.jpg',
      'assets/images/english3.jpg',
    ],
    youtubeUrl: 'https://www.youtube.com/watch?v=i-_pA9Bj7t4&t=207s',
  ),
];
