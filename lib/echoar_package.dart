library echoar_package;

import 'dart:convert';
import 'dart:io';

import 'package:echoar_package/EchoARAdditionalData.dart';
import 'package:echoar_package/EchoArEntry.dart';
import 'package:echoar_package/EchoArHologram.dart';
import 'package:echoar_package/EchoArTarget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

/// A Calculator.
class EchoAR {
  String apiKey;

  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;

  EchoAR({@required this.apiKey});

  Future<List<EchoArEntry>> getAllEntries() async {
    final response =
        await http.get('https://console.echoar.xyz/query?key=' + this.apiKey);
    List<EchoArEntry> entryList = List<EchoArEntry>();

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var data = json.decode(response.body);
      // final parsed = data.cast<Map<String, dynamic>>();
      // List<Map<String, dynamic>> entries = data["db"].values.toList();
      List<dynamic> entries = data["db"].values.toList();
      for (var entry in entries) {
        entryList.add(EchoArEntry.fromJson(entry));
      }
      return entryList;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load echoAR API key');
    }
  }

  Future<EchoArEntry> getEntry(String entryId) async {
    final response = await http.get('https://console.echoar.xyz/query?key=' +
        this.apiKey +
        "&entry=" +
        entryId);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var data = json.decode(response.body);
      // final parsed = data.cast<Map<String, dynamic>>();
      Map<String, dynamic> entryJson = data["db"][entryId];
      EchoArEntry entry = EchoArEntry.fromJson(entryJson);
      return entry;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load echoAR API key');
    }
  }

  Future<EchoARHologram> getHologram(String entryId) async {
    EchoArEntry entry = await getEntry(entryId);
    return entry.hologram;
  }

  Future<EchoARTarget> getTarget(String entryId) async {
    EchoArEntry entry = await getEntry(entryId);
    return entry.target;
  }

  Future<EchoARAdditionalData> getAdditionalData(String entryId) async {
    EchoArEntry entry = await getEntry(entryId);
    return entry.additionalData;
  }

  /// Gets an entry ID and downloads main hologram to
  /// assets folder.
  /// Returns the hologram path
  Future<String> getModelFromEntryId(String entryId) async {
    EchoArEntry entry = await getEntry(entryId);
    return getModelFromEntry(entry);
  }

  Future<String> getModelFromEntry(EchoArEntry entry) async {
    String url = await getModelLinkFromEntry(entry);
    return _downloadFile(url, entry.hologram.filename);
  }

  Future<String> getModelLinkFromEntry(EchoArEntry entry) async {
    return "https://console.echoar.xyz/query?key=" +
        this.apiKey +
        "&file=" +
        entry.hologram.storageID;
  }

  Future<String> getModelLinkFromEntryId(String entryId) async {
    EchoArEntry entry = await getEntry(entryId);
    return getModelLinkFromEntry(entry);
  }

  /// Get unique metadata
  /// In the echoAR console, you can define your own metadata, This metadata can't be
  /// accessed with the EchoARAdditionalData class. You can use the getUniqueMetadata
  /// to access your metadata
  Future<String> getUniqueMetadata(String entryId, String key) async {
    final response = await http.get('https://console.echoar.xyz/query?key=' +
        this.apiKey +
        "&entry=" +
        entryId);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var data = json.decode(response.body);
      // final parsed = data.cast<Map<String, dynamic>>();
      Map<String, dynamic> entryJson = data["db"][entryId];
      Map<String, dynamic> additionalDataJson = entryJson['additionalData'];
      return additionalDataJson[key];
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load echoAR API key');
    }
  }

  /// Get files for Model Holograms

  Future<String> getEntryGlb(EchoArEntry entry) async {
    if (entry.hologram.type != "MODEL_HOLOGRAM")
      throw Exception('Wrong Hologram Type');
    String url = await getEntryGlbLink(entry);
    if (url == null) return null;
    return _downloadFile(url, entry.hologram.filename);
  }

  Future<String> getEntryGlbLink(EchoArEntry entry) async {
    if (entry.hologram.type != "MODEL_HOLOGRAM")
      throw Exception('Wrong Hologram Type');
    if (entry.hologram.filename.endsWith(".glb"))
      return "https://echoar-storage.s3.us-east-2.amazonaws.com/" +
          this.apiKey +
          "/" +
          entry.hologram.storageID;
    else if (entry.additionalData.glbHologramStorageID != null)
      return "https://echoar-storage.s3.us-east-2.amazonaws.com/" +
          this.apiKey +
          "/" +
          entry.additionalData.glbHologramStorageID;
    else
      return null;
  }

  Future<String> getEntryGlbLinkFromId(String entryId) async {
    EchoArEntry entry = await getEntry(entryId);
    return getEntryGlbLink(entry);
  }

  Future<String> getEntryUsdz(EchoArEntry entry) async {
    if (entry.hologram.type != "MODEL_HOLOGRAM")
      throw Exception('Wrong Hologram Type');
    String url = await getEntryUsdzLink(entry);
    if (url == null) return null;
    return _downloadFile(url, entry.hologram.filename);
  }

  Future<String> getEntryUsdzLink(EchoArEntry entry) async {
    if (entry.hologram.type != "MODEL_HOLOGRAM")
      throw Exception('Wrong Hologram Type');
    if (entry.hologram.filename.endsWith(".usdz"))
      return "https://echoar-storage.s3.us-east-2.amazonaws.com/" +
          this.apiKey +
          "/" +
          entry.hologram.storageID;
    else if (entry.additionalData.usdzHologramStorageID != null)
      return "https://echoar-storage.s3.us-east-2.amazonaws.com/" +
          this.apiKey +
          "/" +
          entry.additionalData.usdzHologramStorageID;
    else
      return null;
  }

  Future<String> getEntryUsdzLinkFromId(String entryId) async {
    EchoArEntry entry = await getEntry(entryId);
    return getEntryUsdzLink(entry);
  }

  Future<String> _downloadFile(String url, String filename) async {
    http.Response req = await http.Client().get(Uri.parse(url));
    String dir = (await getTemporaryDirectory()).path;
    File file = File(dir + "/" + filename);
    await file.writeAsBytes(req.bodyBytes);
    return file.path;
  }

  /// Get files for Image Holograms
  Future<String> getEntryComressedImage(EchoArEntry entry) async {
    if (entry.hologram.type != "IMAGE_HOLOGRAM")
      throw Exception('Wrong Hologram Type');
    String url = await getEntryComressedImageLink(entry);
    if (url == null) return null;
    return _downloadFile(url, entry.hologram.filename);
  }

  Future<String> getEntryComressedImageLink(EchoArEntry entry) async {
    if (entry.hologram.type != "IMAGE_HOLOGRAM")
      throw Exception('Wrong Hologram Type');
    if (entry.additionalData.compressedImageStorageID != null)
      return "https://echoar-storage.s3.us-east-2.amazonaws.com/" +
          this.apiKey +
          "/" +
          entry.additionalData.compressedImageStorageID;
    else
      return null;
  }

  Future<String> getEntryComressedImageLinkFromId(String entryId) async {
    EchoArEntry entry = await getEntry(entryId);
    return getEntryComressedImageLink(entry);
  }

  /// Get targets
  
  /// Get Image targets
  Future<String> getEntryImageTarget(EchoArEntry entry) async {
    if (entry.target.type != "IMAGE_TARGET")
      throw Exception('Wrong target Type');
    String url = await getEntryImageTargetLink(entry);
    if (url == null) return null;
    return _downloadFile(url, entry.hologram.filename);
  }

  Future<String> getEntryImageTargetLink(EchoArEntry entry) async {
    if (entry.target.type != "IMAGE_TARGET")
      throw Exception('Wrong target Type');
    if (entry.target.storageID != null)
      return "https://echoar-storage.s3.us-east-2.amazonaws.com/" +
          this.apiKey +
          "/" +
          entry.target.storageID;
    else
      return null;
  }

  Future<String> getEntryImageTargetLinkFromId(String entryId) async {
    EchoArEntry entry = await getEntry(entryId);
    return getEntryImageTargetLink(entry);
  }

}
