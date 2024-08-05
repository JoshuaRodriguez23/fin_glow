class Event {
  final String icon;
  final String title;
  final String description;

  Event({
    required this.icon,
    required this.title,
    required this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      icon: json['icon'] ?? 'default_icon', // Valor por defecto
      title: json['title'] ?? 'Sin título', // Valor por defecto
      description:
          json['description'] ?? 'Sin descripción', // Valor por defecto
    );
  }
}
