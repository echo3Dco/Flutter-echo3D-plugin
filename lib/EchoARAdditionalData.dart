class EchoARAdditionalData {
  String qrWebXRStorageID;
  String shortURL;
  String qrARjsStorageFilename;
  String qrARjsTargetStorageFilename;
  String glbHologramStorageID;
  String qrARjsMarkerStorageFilename;
  String qrARjsTargetStorageID;
  String qrARjsStorageID;
  String qrWebARStorageID;
  String accessHistory;
  String createdAt;
  String qrWebXRStorageFilename;
  String originalTexture0StorageID;
  String lastAccessed;
  String qrARjsMarkerStorageID;
  String glbHologramStorageFilename;
  String gltfHologramStorageFilename;
  String qrWebARStorageFilename;
  String usdzHologramStorageID;
  String usdzHologramStorageFilename;
  String compressedImageStorageID;
  String compressedImageStorageFilename;
  String vuforiaHologramStorageFilename;
  String videoHeight;
  String videoWidth;

  EchoARAdditionalData({
    this.qrWebXRStorageID,
    this.shortURL,
    this.qrARjsStorageFilename,
    this.qrARjsTargetStorageFilename,
    this.glbHologramStorageID,
    this.gltfHologramStorageFilename,
    this.qrARjsMarkerStorageFilename,
    this.qrARjsTargetStorageID,
    this.qrARjsStorageID,
    this.qrWebARStorageID,
    this.accessHistory,
    this.createdAt,
    this.glbHologramStorageFilename,
    this.lastAccessed,
    this.originalTexture0StorageID,
    this.qrARjsMarkerStorageID,
    this.qrWebARStorageFilename,
    this.qrWebXRStorageFilename,
    this.usdzHologramStorageID,
    this.usdzHologramStorageFilename,
    this.compressedImageStorageID,
    this.compressedImageStorageFilename,
    this.vuforiaHologramStorageFilename,
    this.videoHeight,
    this.videoWidth,
  });

  factory EchoARAdditionalData.fromJson(Map<String, dynamic> json) {
    return EchoARAdditionalData(
      qrWebXRStorageID: json['qrWebXRStorageID'],
      shortURL: json['shortURL'],
      qrARjsStorageFilename: json['qrARjsStorageFilename'],
      qrARjsTargetStorageFilename: json['qrARjsTargetStorageFilename'],
      glbHologramStorageID: json['glbHologramStorageID'],
      qrARjsMarkerStorageFilename: json['qrARjsMarkerStorageFilename'],
      qrARjsTargetStorageID: json['qrARjsTargetStorageID'],
      qrARjsStorageID: json['qrARjsStorageID'],
      qrWebARStorageID: json['qrWebARStorageID'],
      accessHistory: json['accessHistory'],
      createdAt: json['createdAt'],
      glbHologramStorageFilename: json['glbHologramStorageFilename'],
      gltfHologramStorageFilename: json['gltfHologramStorageFilename'],
      lastAccessed: json['lastAccessed'],
      originalTexture0StorageID: json['originalTexture0StorageID'],
      qrARjsMarkerStorageID: json['qrARjsMarkerStorageID'],
      qrWebARStorageFilename: json['qrWebARStorageFilename'],
      qrWebXRStorageFilename: json['qrWebXRStorageFilename'],
      usdzHologramStorageID: json['usdzHologramStorageID'],
      usdzHologramStorageFilename: json['usdzHologramStorageFilename'],
      compressedImageStorageID: json['compressedImageStorageID'],
      compressedImageStorageFilename: json['compressedImageStorageFilename'],
      vuforiaHologramStorageFilename: json['vuforiaHologramStorageFilename'],
      videoHeight: json['videoHeight'],
      videoWidth: json['videoWidth'],
    );
  }
}
