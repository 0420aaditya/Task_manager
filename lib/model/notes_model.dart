// class Note {
//   String id;
//   String subtitle;
//   String title;
//   String time;
//   int image;
//   bool isDon;
//   Note(this.id, this.subtitle, this.time, this.image, this.title, this.isDon);
// }

class Note {
  String id;
  String subtitle;
  String title;
  String time;
  int image;
  bool isDon;
  DateTime? notiDate; // New field for notification date

  Note(this.id, this.subtitle, this.time, this.image, this.title, this.isDon,
      {this.notiDate});
}
