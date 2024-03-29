class CalendarEntities {
  final String title;
  final String? description;
  final String icon;
  final DateTime startTime;
  final DateTime endTime;
  CalendarEntities({
    required this.title,
    this.description,
    required this.icon,
    required this.startTime,
    required this.endTime,
  });

}
