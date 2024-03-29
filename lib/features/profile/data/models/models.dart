class CalendarModel {
  final String title;
  final String? description;
  final String icon;
  final DateTime startTime;
  final DateTime endTime;

  CalendarModel({
    required this.title,
    this.description,
    required this.icon,
    required this.startTime,
    required this.endTime,
  });

  factory CalendarModel.fromJson(Map<String, dynamic> json) {
    return CalendarModel(
      title: json['title'],
      icon: json['icon'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      description: json['description']?? '',
    );
  }
}
