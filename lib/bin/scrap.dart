import 'dart:html';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class Controller with ChangeNotifier {
  Uint8List? imageBytes;
  bool processingImage = false;
  FirebaseStorage fs = FirebaseStorage.instance;
  SettableMetadata metadata = SettableMetadata(contentType: "image/jpeg");
  final now = DateTime.now();
  Blob? blob;
  String? imageurl;
  pickImageinWeb() {
    processingImage = true;
    notifyListeners();
    FileUploadInputElement input = FileUploadInputElement()..accept = 'image/*';

    input.click();

    input.onChange.listen((event) {
      final file = input.files?.first;
      if (file != null) {
        final reader = FileReader();

        reader.readAsArrayBuffer(file);

        reader.onLoadEnd.listen((event) async {
          Uint8List data = Uint8List.fromList(reader.result as List<int>);

          imageBytes = data;

          blob = Blob([data]);
          processingImage = false;
          notifyListeners();
          try {
            var snapshot = await fs
                .ref()
                .child("productImage/$now")
                .putBlob(blob, metadata);

            String downloadUrl = await snapshot.ref.getDownloadURL();

            imageurl = downloadUrl;
            print("=====${imageurl}====");
            print(downloadUrl);
          } catch (error) {
            print('Error uploading image to Firebase Storage: $error');
          }
        });
      }
    });
  }

  saveToStore() async {}
}
