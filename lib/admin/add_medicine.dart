import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

import '../constants/custom_colors.dart';
import '../database.dart';

class AddMedicines extends StatefulWidget {
  const AddMedicines({super.key});

  @override
  State<AddMedicines> createState() => _AddMedicinesState();
}

class _AddMedicinesState extends State<AddMedicines> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController= TextEditingController();
  final TextEditingController usageController= TextEditingController();
  final TextEditingController mfgController= TextEditingController();
  final TextEditingController expController= TextEditingController();

  File? selectedImage;
  String imageURL = '';
  Uint8List? _image;

  Future<void> _pickImage() async {
    try {
      FilePickerResult? result =
      await FilePicker.platform.pickFiles(type: FileType.image);
      if (result == null) return;

      setState(() {
        if (kIsWeb) {
          _image = result.files.single.bytes;
        } else {
          selectedImage = File(result.files.single.path!);
        }
      });
    } catch (e) {
      log(e.toString());
    }
  }

  late DateTime? mfgDate;
  late DateTime? expDate;

  @override
  void initState() {
    super.initState();
    mfgDate = DateTime(2021, 7, 25);
    expDate = DateTime(2021, 7, 25);
  }

  Future<void> mfgDateSelect(BuildContext context) async {
    final DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: mfgDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );
    if (newSelectedDate != null) {
      setState(() {
        mfgController.text = newSelectedDate.toString().split(" ")[0];
      });
    }
  }

  Future<void> expDateSelect(BuildContext context) async {
    final DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: mfgDate,
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );
    if (newSelectedDate != null) {
      setState(() {
        expController.text = newSelectedDate.toString().split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: CustomColors.primaryColor,
        child: Row(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 2,
              child: ColoredBox(
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 350,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,),
                  child: Form(
                    key: _formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            "Add Medicines",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Medicine name",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            style: const TextStyle(
                                color: CustomColors.secondaryColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: usageController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Usage",
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            style: const TextStyle(
                                color: CustomColors.secondaryColor),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: mfgController,
                            validator: (date){
                              if (date== null || date.isEmpty){
                                return 'Please enter a Mfg date';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: 'Mfg date in YYYY-MM-DD',
                                border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                suffixIcon: IconButton(
                                    onPressed: () => mfgDateSelect(context),
                                    icon: const Icon(
                                      CupertinoIcons.calendar,
                                      color: CustomColors.secondaryColor,
                                    ))),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextFormField(
                            controller: expController,
                            validator: (date){
                              if (date== null || date.isEmpty){
                                return 'Please enter a Exp date';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                hintText: 'Exp date in YYYY-MM-DD',
                                border: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(10))),
                                suffixIcon: IconButton(
                                    onPressed: () => expDateSelect(context),
                                    icon: const Icon(
                                      CupertinoIcons.calendar,
                                      color: CustomColors.secondaryColor,
                                    ))),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              TextButton(
                                  onPressed: () {
                                    _pickImage();
                                  },
                                  style: TextButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(5)),
                                      foregroundColor: Colors.black,
                                      backgroundColor: Colors.white),
                                  child: Text("Add Image"))
                            ],
                          ),
                          const SizedBox(height: 20,),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                          if (kIsWeb && _image != null) {
                                            Reference reference = FirebaseStorage
                                                .instance
                                                .ref()
                                                .child(
                                                'medicine/${DateTime.now().millisecondsSinceEpoch}.jpg');
                                            try {
                                              UploadTask uploadTask =
                                              reference.putData(
                                                  _image!,
                                                  SettableMetadata(
                                                      contentType:
                                                      'image/jpeg'));
                                              TaskSnapshot snapshot =
                                              await uploadTask;
                                              imageURL = await snapshot.ref
                                                  .getDownloadURL();
                                            } catch (error) {
                                              print(error.toString());
                                            }
                                          } else if (selectedImage != null) {
                                            Reference reference = FirebaseStorage
                                                .instance
                                                .ref()
                                                .child(
                                                'medicine/${DateTime.now().millisecondsSinceEpoch}.jpg');
                                            try {
                                              UploadTask uploadTask = reference
                                                  .putFile(selectedImage!);
                                              TaskSnapshot snapshot =
                                              await uploadTask;
                                              imageURL = await snapshot.ref
                                                  .getDownloadURL();
                                            } catch (error) {
                                              print(error.toString());
                                            }
                                          } else {
                                            print('No image selected');
                                          }
                                          String id = randomAlphaNumeric(10);
                                          Map<String, dynamic> medicineInfoMap = {
                                            "Image": imageURL,
                                            "Name": nameController.text,
                                            "Usage": usageController.text,
                                            "MfgDate": mfgController.text,
                                            "ExpDate": expController.text,
                                            "id": id
                                          };
                                          await DataBaseMethods().addMedicine(medicineInfoMap, id);
                                            Fluttertoast.showToast(
                                                msg:
                                                "Data Uploaded Successfully",
                                                toastLength:
                                                Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.CENTER,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.grey,
                                                textColor: Colors.white,
                                                fontSize: 16.0)
                                                .then((value) {
                                              Navigator.of(context).pop();
                                            });
                                      }
                                    },
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(5)),
                                        foregroundColor: Colors.black,
                                        backgroundColor: Colors.white),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 10),
                                      child: Text(
                                        "Add",
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
