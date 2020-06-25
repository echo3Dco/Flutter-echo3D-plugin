class EchoARHologram {
  String filename;
  String storageID;
  List<dynamic> textureFilenames;
  List<dynamic> textureStorageIDs;
  String materialFilename;
  String materialStorageID;
  String id;
  String type;
  String targetID;

  EchoARHologram({
    this.id,
    this.type,
    this.filename,
    this.materialFilename,
    this.materialStorageID,
    this.storageID,
    this.targetID,
    this.textureFilenames,
    this.textureStorageIDs,
  });

  factory EchoARHologram.fromJson(Map<String, dynamic> json) {
    return EchoARHologram(
      filename: json['filename'],
      storageID: json['storageID'],
      textureFilenames: json['textureFilenames'],
      textureStorageIDs: json['textureStorageIDs'],
      materialFilename: json['materialFilename'],
      materialStorageID: json['materialStorageID'],
      id: json['id'],
      type: json['type'],
      targetID: json['targetID'],
    );
  }
}
