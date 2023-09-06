import 'package:echoar_package/EchoARAdditionalData.dart';
import 'package:echoar_package/EchoArHologram.dart';
import 'package:echoar_package/EchoArTarget.dart';

class EchoArEntry {
  String? id;
  EchoARTarget? target;
  EchoARHologram? hologram;
  EchoARAdditionalData? additionalData;

  EchoArEntry({
    this.id,
    this.target,
    this.hologram,
    this.additionalData,
  });

  factory EchoArEntry.fromJson(Map<String, dynamic> json) {
    return EchoArEntry(
      id: json['id'],
      target: EchoARTarget.fromJson(json['target']),
      hologram: EchoARHologram.fromJson(json['hologram']),
      additionalData: EchoARAdditionalData.fromJson(json['additionalData']),
    );
  }
}
