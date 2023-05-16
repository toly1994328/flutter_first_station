class MeritRecord {
  final String id;
  final int timestamp;
  final int value;
  final String image;
  final String audio;

  MeritRecord(this.id, this.timestamp, this.value, this.image, this.audio);

  Map<String, dynamic> toJson() => {
    "id":id,
    "timestamp": timestamp,
    "value": value,
    "image": image,
    "audio": audio,
  };
}
