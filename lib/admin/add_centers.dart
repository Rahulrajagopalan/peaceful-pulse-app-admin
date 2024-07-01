import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';

import '../constants/custom_colors.dart';
import '../database.dart';

class AddCenters extends StatefulWidget {
  const AddCenters({super.key});

  @override
  State<AddCenters> createState() => _AddCentersState();
}

class _AddCentersState extends State<AddCenters> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  List<Map<String, dynamic>> doctorList=[];
  List<Map<String, dynamic>> volunteerList=[];
  List<Map<String, dynamic>> ambulanceList=[];
  String doctor= "";
  String volunteer= "";
  String ambulance= "";
  List<String> doctorNames= [];
  List<String> volunteerNames= [];
  List<String> ambulanceNames= [];

 Future callingDoctors()async{
   doctorNames = [];

    final snapshotDoc=await  DataBaseMethods().getDoctor();
    for (var doc in snapshotDoc.docs) {
      doctorList.add(doc.data());
      doctorNames.add(doc["Name"]);
    }
  }

  Future callingVolunteers()async{
   volunteerNames=[];

   final snapshotVol=await  DataBaseMethods().getVolunteer();
   for (var doc in snapshotVol.docs) {
     volunteerList.add(doc.data());
     volunteerNames.add(doc["Name"]);
   }
  }

  Future callingAmbulance()async{
   ambulanceNames=[];

   final snapshotAmb=await  DataBaseMethods().getAmbulance();
   for (var doc in snapshotAmb.docs) {
     ambulanceList.add(doc.data());
     ambulanceNames.add(doc["Name"]);
   }
  }

  File? selectedImage;
  String imageURL = '';
  Uint8List? _image;

  PlatformFile? _imageFile;

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
                width: 450,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Text(
                          "Add Centers",
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
                              hintText: "Palliative center's Name",
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FutureBuilder(
                              future: callingDoctors(),
                              builder: (context, snapshot) {
                                return Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: DropdownMenu<String>(
                                    initialSelection: "Doctor",
                                    onSelected: (String? value) {
                                      setState(() {
                                        doctor = value!;
                                      });
                                    },
                                    dropdownMenuEntries: doctorNames
                                        .map<DropdownMenuEntry<String>>((String value) {
                                      return DropdownMenuEntry<String>(
                                          value: value, label: value);
                                    }).toList(),
                                  ),
                                );
                              }
                            ),
                            FutureBuilder(
                                future: callingVolunteers(),
                                builder: (context, snapshot) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: DropdownMenu<String>(
                                      initialSelection: "Volunteer",
                                      onSelected: (String? value) {
                                        setState(() {
                                          volunteer = value!;
                                        });
                                      },
                                      dropdownMenuEntries: volunteerNames
                                          .map<DropdownMenuEntry<String>>((String value) {
                                        return DropdownMenuEntry<String>(
                                            value: value, label: value);
                                      }).toList(),
                                    ),
                                  );
                                }
                            ),
                            FutureBuilder(
                                future: callingAmbulance(),
                                builder: (context, snapshot) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: DropdownMenu<String>(
                                      initialSelection: "Ambulance",
                                      onSelected: (String? value) {
                                        setState(() {
                                          ambulance = value!;
                                        });
                                      },
                                      dropdownMenuEntries: ambulanceNames
                                          .map<DropdownMenuEntry<String>>((String value) {
                                        return DropdownMenuEntry<String>(
                                            value: value, label: value);
                                      }).toList(),
                                    ),
                                  );
                                }
                            ),
                          ],
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
                        if (_imageFile != null)
                          Image.memory(
                            Uint8List.fromList(_imageFile!.bytes!),
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
                                         if (kIsWeb && _image != null) {
                                          Reference reference = FirebaseStorage
                                              .instance
                                              .ref()
                                              .child(
                                              'centers/${DateTime.now().millisecondsSinceEpoch}.jpg');
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
                                              'centers/${DateTime.now().millisecondsSinceEpoch}.jpg');
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
                                        Map<String, dynamic> centerInfoMap = {
                                          "Image": imageURL,
                                          "Name": nameController.text,
                                          "Email": emailController.text,
                                          "Password": passwordController.text,
                                          "Doctor": doctor,
                                          "Volunteer": volunteer,
                                          "Ambulance": ambulance,
                                          "id": id
                                        };
                                        await DataBaseMethods()
                                            .addCenters(centerInfoMap, id)
                                            .then((value) {
                                          Fluttertoast.showToast(
                                              msg: "Data Uploaded Successfully",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.CENTER,
                                              timeInSecForIosWeb: 1,
                                              backgroundColor: Colors.grey,
                                              textColor: Colors.white,
                                              fontSize: 16.0).then((value) => Navigator.pop(context));
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
          ],
        ),
      ),
    );
  }
}
