import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/loading.dart';

class Department5sPage extends StatelessWidget {
  const Department5sPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Departments Page'),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('department')
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  if (snapshot.data!.docs.isEmpty) {
                    return const Center(
                      child: Text('No A vailable deparments',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Card(
                            elevation: 5,
                            // color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "department: ${snapshot.data!.docs[index]['department']}",
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                        onPressed: () {
                                          change(
                                              snapshot.data!.docs[index].id,
                                              snapshot.data!.docs[index]
                                                  ['department']);
                                        },
                                        icon: const Icon(Icons.add))
                                  ],
                                ),
                              ],
                            ),
                          );
                        });
                  }
                }
              })),
    );
  }

  void change(String id, String field) async {
    showdilog();
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      var res = await FirebaseFirestore.instance
          .collection('student')
          .where('uid', isEqualTo: auth.currentUser!.uid)
          .get();
      String id = res.docs.first['uid'];
      // var fielde = field == 'No' ? int.tryParse(field) : field;
      await FirebaseFirestore.instance
          .collection('student')
          .doc(id)
          .update({'department': field});
      Get.back();
      Get.back();
      Get.snackbar('done', 'done', backgroundColor: Colors.greenAccent);
    } catch (e) {
      Get.back();
      Get.back();
      Get.snackbar('Done', e.toString(), backgroundColor: Colors.red);
    }
    // var res = await collectionReference.doc(id).update(attribute);
  }
}
