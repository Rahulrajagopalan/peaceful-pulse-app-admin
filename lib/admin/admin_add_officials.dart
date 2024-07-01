import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../constants/custom_colors.dart';
import '../database.dart';

class AdminAddOfficials extends StatefulWidget {
  const AdminAddOfficials({super.key});

  @override
  State<AdminAddOfficials> createState() => _AdminAddOfficialsState();
}

class _AdminAddOfficialsState extends State<AdminAddOfficials> {
  List<String> list = <String>['Doctor', 'Volunteer', 'Ambulance'];
  late String dropdownValue = list.first;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController designationController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                            "Add Officials",
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: DropdownMenu<String>(
                              initialSelection: list.first,
                              onSelected: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              dropdownMenuEntries: list
                                  .map<DropdownMenuEntry<String>>((String value) {
                                return DropdownMenuEntry<String>(
                                    value: value, label: value);
                              }).toList(),
                            ),
                          ),
                          TextFormField(
                            controller: nameController,
                            keyboardType: TextInputType.text,
                            decoration: InputDecoration(
                                hintText: "Name/ Vehicle Number",
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
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "Email Address",
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
                            controller: designationController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                hintText: "Designation",
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
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                hintText: "Phone Number",
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
                            controller: passwordController,
                            enabled: true,
                            decoration: InputDecoration(
                                hintText: "Password",
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
                          if (_image != null)
                            Image.memory(
                              _image!,
                              width: 100,
                              height: 100,
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
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        FirebaseAuth.instance
                                            .createUserWithEmailAndPassword(
                                                email: emailController.text,
                                                password: passwordController.text)
                                            .then((credential) async {
                                          if (kIsWeb && _image != null) {
                                            Reference reference = FirebaseStorage
                                                .instance
                                                .ref()
                                                .child(
                                                    '${dropdownValue.toLowerCase()}/${DateTime.now().millisecondsSinceEpoch}.jpg');
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
                                                    '${dropdownValue.toLowerCase()}/${DateTime.now().millisecondsSinceEpoch}.jpg');
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
                                          String id = credential.user!.uid;
                                          Map<String, dynamic> officialInfoMap = {
                                            "Image": imageURL,
                                            "Name": nameController.text,
                                            "Email": emailController.text,
                                            "Designation":
                                                designationController.text,
                                            "Phone": phoneController.text,
                                            "Password": passwordController.text,
                                            "id": id
                                          };
                                          // dara
                                          await switch (dropdownValue) {
                                            'Doctor' => DataBaseMethods()
                                                .addDoctors(officialInfoMap, id),
                                            'Volunteer' => DataBaseMethods()
                                                .addVolunteer(officialInfoMap, id),
                                            'Ambulance' => DataBaseMethods()
                                                .addAmbulance(officialInfoMap, id),
                                            String() =>
                                              throw UnimplementedError(),
                                          }
                                              .then((value) {
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
                                          });
                                          //   change
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
