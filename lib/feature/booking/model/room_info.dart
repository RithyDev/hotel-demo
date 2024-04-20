class BookingRoomInfo {
  int room;
  int adults;
  int children;

  BookingRoomInfo(
      {required this.room, required this.adults, required this.children});
  
  void increaseRoom() {
    room ++;
  }
  void decreaseRoom() {
    room --;
  }
  
  void increaseAdults() {
    adults ++;
  }

  void decreaseAdults() {
    adults--;
  }

  void increaseChildren() {
    children ++;
  }

  void decreaseChildren() {
    children --;
  }
}
