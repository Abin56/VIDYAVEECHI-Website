import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vidyaveechi_website/view/home/screens/footer/widgets/Iconbackbutton.dart';
import 'package:vidyaveechi_website/view/users/super_admin/lepton_Admin/admin_home_screen.dart';
import 'package:vidyaveechi_website/view/users/super_admin/lepton_Admin/list_of_schools/details.dart';

import '../../widgets/buttonContainer.dart';

class SchoolsListScreen extends StatefulWidget {
  
  const SchoolsListScreen({super.key});

  @override
  State<SchoolsListScreen> createState() => _SchoolsListScreenState();
}

class _SchoolsListScreenState extends State<SchoolsListScreen> {
  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
    
     
        body: SafeArea(
      child: Column(
        children: [
          
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButtonBackWidget(
                color: const Color.fromARGB(255, 2, 71, 167),
              ),
            ],
          ),
          Expanded(
            child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('SchoolListCollection')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return SizedBox(
                          height: 120,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('${index + 1}'),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    snapshot.data!.docs[index]['schoolName'],
                                    style: GoogleFonts.montserrat(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    snapshot.data!.docs[index]['place'],
                                    style: GoogleFonts.montserrat(
                                        color: Colors.grey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return DetailsSchoolsScreen(
                                              schoolSnap:
                                                  snapshot.data!.docs[index]);
                                        },
                                      ),
                                    );
                                  },
                                  icon: const Icon(Icons.info_outline)),
                              Text(
                                  "Status : ${snapshot.data?.docs[index]['deactive'] ?? ""}"),
                              ButtonContainerWidget(
                                curving: 10,
                                colorindex: 3,
                                height: 40,
                                width: 130,
                                child: Center(
                                  child: Text(
                                    "Active",
                                    style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: snapshot.data!.docs.length);
                }),
          )
        ],
      ),
    ));
  }
}
