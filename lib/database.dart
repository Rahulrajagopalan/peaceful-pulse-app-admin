import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DataBaseMethods{
  Future addDoctors(Map<String, dynamic> doctorInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Doctors")
        .doc(id)
        .set(doctorInfoMap);
  }

  Future<Stream<QuerySnapshot>> getDoctorDetails() async{
    return await FirebaseFirestore.instance.collection("Doctors").snapshots();
  }

  Future updateDoctor(Map<String, dynamic> doctorInfoMap, String id) async{
    return await FirebaseFirestore.instance.collection("Doctors").doc(id).update(doctorInfoMap);
  }

  Future removeDoctor(String id) async{
    return await FirebaseFirestore.instance.collection("Doctors").doc(id).delete();
  }

  Future addVolunteer(Map<String, dynamic> volunteerInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Volunteer")
        .doc(id)
        .set(volunteerInfoMap);
  }

  Future<Stream<QuerySnapshot>> getVolunteerDetails() async{
    return await FirebaseFirestore.instance.collection("Volunteer").snapshots();
  }

  Future addMedicine(Map<String, dynamic> medicineInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Medicine")
        .doc(id)
        .set(medicineInfoMap);
  }

  Future addAmbulance(Map<String, dynamic> ambulanceInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Ambulance")
        .doc(id)
        .set(ambulanceInfoMap);
  }

  Future<Stream<QuerySnapshot>> getAmbulanceDetails() async{
    return await FirebaseFirestore.instance.collection("Ambulance").snapshots();
  }

  Future<QuerySnapshot<Map<String, dynamic>>>getDoctor()async{
    return await FirebaseFirestore.instance.collection("Doctors").get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>>getVolunteer()async{
    return await FirebaseFirestore.instance.collection("Volunteer").get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>>getAmbulance()async{
    return await FirebaseFirestore.instance.collection("Ambulance").get();
  }

  Future<QuerySnapshot<Map<String, dynamic>>>getCenter()async{
    return await FirebaseFirestore.instance.collection("Center").get();
  }

  Future addCenters(Map<String, dynamic> centerInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Centers")
        .doc(id)
        .set(centerInfoMap);
  }

  Future addCamps(Map<String, dynamic> campInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Camps")
        .doc(id)
        .set(campInfoMap);
  }

  Future addCenters1(Map<String, dynamic> doctorInfoMap, String id) async {
    return await FirebaseFirestore.instance
        .collection("Centers")
        .doc(id).collection("doctor").add(doctorInfoMap);
  }

  Future<Stream<QuerySnapshot>>getCenterDetails()async{
    return await FirebaseFirestore.instance.collection("Centers").snapshots();
  }

  Future removeCenter(String id) async{
    return await FirebaseFirestore.instance.collection("Centers").doc(id).delete();
  }

  Reference reference = FirebaseStorage.instance.ref();
}