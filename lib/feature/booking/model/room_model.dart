class RoomModel {
  String roomId;
  String title;
  String subtitle;
  String? description;

  RoomModel(
      {required this.roomId,
      required this.title,
      required this.subtitle,
      this.description});
}
