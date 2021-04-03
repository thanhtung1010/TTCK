class CourseInfo {
  final int Id;
  final String name;
  final String iconImage;
  final String description;

  CourseInfo(
    this.Id, {
    this.name,
    this.iconImage,
    this.description,
  });
}

List<CourseInfo> courseInfos = [
  CourseInfo(
    1,
    name: 'Word',
    iconImage: 'assets/mercury.png',
    description: "Text and word",
  ),
  CourseInfo(
    2,
    name: 'Excel',
    iconImage: 'assets/venus.png',
    description: "Sheet and table",
  ),
  CourseInfo(
    3,
    name: 'PowerPoint',
    iconImage: 'assets/earth.png',
    description: "Slide",
  ),
  CourseInfo(
    4,
    name: 'Computer',
    iconImage: 'assets/mars.png',
    description: "Setting and setup",
  ),
  CourseInfo(
    5,
    name: 'PhotoShop',
    iconImage: 'assets/jupiter.png',
    description: "Design and retouch",
  ),
  CourseInfo(
    6,
    name: 'CorelDraw',
    iconImage: 'assets/saturn.png',
    description: "Draw and pain",
  ),
  CourseInfo(
    7,
    name: 'Illustrator',
    iconImage: 'assets/uranus.png',
    description: "Illustrator and 2D",
  ),
  CourseInfo(
    8,
    name: 'Manager',
    iconImage: 'assets/neptune.png',
    description: "Manager",
  ),
  CourseInfo(
    9,
    name: 'Web',
    iconImage: 'assets/neptune.png',
    description: "Design and developer",
  ),
];

class Account {
  final int Id;
  final String username;
  final String password;
  final String description;

  Account(
    this.Id, {
    this.username,
    this.password,
    this.description,
  });
}
