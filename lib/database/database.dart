import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:routeradar/database/authentication.dart';

ValueNotifier<Database> database = ValueNotifier(
  Database(),
);

class Database {
  final CollectionReference _users = FirebaseFirestore.instance.collection(
    "users",
  );
  final CollectionReference _businfo = FirebaseFirestore.instance.collection(
    "businfo",
  );
  // final CollectionReference _routes = FirebaseFirestore.instance.collection(
  //   "routes",
  // );
  final CollectionReference _emergencycontact =
      FirebaseFirestore.instance.collection(
    "emcontact",
  );
  final CollectionReference _lostandfound =
      FirebaseFirestore.instance.collection(
    "lostfound",
  );

  String? uid = authServices.value.getCurrentUserUID();

  Future<void> addUser(TextEditingController name, TextEditingController email,
      TextEditingController id, TextEditingController phone) async {
    if (name.text.isNotEmpty && email.text.isNotEmpty && id.text.isNotEmpty) {
      await _users.doc(uid).set({
        'name': name.text,
        'email': email.text,
        'phone': phone.text,
        'id': id.text,
        'imagelink': 'assets/IMG.png',
        'balance': 0,
        'updatedOn': Timestamp.now(),
      });
      name.clear();
      email.clear();
      id.clear();
      phone.clear();
    }
  }

  Future<void> updateUserInfo(String name, String phone, String id) async {
    if (name.isEmpty && phone.isEmpty && id.isEmpty) {
      return;
    }

    Map<String, dynamic> updateData = {};
    if (name.isNotEmpty) {
      updateData['name'] = name;
    }
    if (phone.isNotEmpty) {
      updateData['phone'] = phone;
    }
    if (id.isNotEmpty) {
      updateData['id'] = id;
    }
    updateData['updatedOn'] = Timestamp.now();
    await _users.doc(uid).update(updateData);
  }

  Future<String> getUserinfo(String info) async {
    DocumentSnapshot doc =
        await _users.doc(authServices.value.getCurrentUserUID()).get();
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    if (info == "name") {
      return data[info] as String;
    } else if (info == "email") {
      return data[info] as String;
    } else if (info == "id") {
      return data[info] as String;
    } else if (info == "phone") {
      return data[info] as String;
    } else if (info == "imagelink") {
      return data[info] as String;
    } else if (info == "balance") {
      return data[info].toString();
    }
    throw ArgumentError("Invalid info key: $info");
  }

  void UpdateBalance(double amount) async {
    //, String type, Timestamp date
    await _users.doc(uid).update({
      'balance': FieldValue.increment(amount),
      'updatedOn': Timestamp.now(),
    });
    // await _users.doc(uid).collection("transactions").add({
    //   'amount': amount,
    //   'type': type,
    // });
  }

  // Stream<QuerySnapshot> getUsersStream() {
  //   return _users.snapshots();
  // }

  // Future<void> updateTodo(DocumentSnapshot todoDoc, String newTask) async {
  //   await _users.doc(todoDoc.id).update({
  //     'task': newTask,
  //     'updatedOn': Timestamp.now(),
  //   });
  // }

  // Future<void> deleteTodo(DocumentSnapshot todoDoc) async {
  //   await _users.doc(todoDoc.id).delete();
  // }

  // Future<void> addBusInfo({
  //   required String bus,
  //   required String driverName,
  //   required int age,
  //   required String phone,
  //   required String startPoint,
  //   required String endPoint,
  //   required String startTime,
  //   required String estimatedJourneyTime,
  //   required double fare,
  // }) async {
  //   await _businfo.doc(bus).set({
  //     'bus': bus,
  //     'startPoint': startPoint,
  //     'endPoint': endPoint,
  //     'startTime': startTime,
  //     'estimatedJourneyTime': estimatedJourneyTime,
  //     'fare': fare,
  //     'driver': {'name': driverName, 'phone': phone, 'age': age}
  //   });
  // }

  Future<List<Map<String, dynamic>>> getBusInfo() async {
    QuerySnapshot querySnapshot = await _businfo.get();
    return querySnapshot.docs.map((doc) {
      return doc.data() as Map<String, dynamic>;
    }).toList();
  }

  // Future<void> addEmergencyContact({
  //   required String name,
  //   required String phone,
  // }) async {
  //   await _emergencycontact.add({
  //     'operator': name,
  //     'number': phone,
  //   });
  // }

  Future<List<Map<String, String>>> getEmergencyContact() async {
    QuerySnapshot querySnapshot = await _emergencycontact.get();
    return querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return {
        'operator': data['operator'].toString(),
        'number': data['number'].toString(),
      };
    }).toList();
  }

  // Future<void> addLostFound({
  //   required String item,
  //   required String location,
  //   required String status,
  // }) async {
  //   await _lostandfound.add({
  //     'item': item,
  //     'location': location,
  //     'Status': status,
  //   });
  // }

  Future<List<Map<String, String>>> getLostFound() async {
    QuerySnapshot querySnapshot = await _lostandfound.get();
    return querySnapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      return {
        'item': data['item'].toString(),
        'location': data['location'].toString(),
        'status': data['Status'].toString(),
      };
    }).toList();
  }
}
