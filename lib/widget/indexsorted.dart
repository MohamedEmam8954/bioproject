import 'dart:developer';

import 'package:bioproject/helper/customtextformfield.dart';
import 'package:bioproject/helper/showmessage.dart';
import 'package:bioproject/services/bioservices.dart';
import 'package:flutter/material.dart';

class IndexSorted extends StatefulWidget {
  const IndexSorted({super.key});

  @override
  State<IndexSorted> createState() => _IndexSortedState();
}

class _IndexSortedState extends State<IndexSorted> {
  String sequence = "";
  String lnempty = "";
  String content = "sort indexed is";
  int len = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(),
            child: Card(
              color: const Color(0xffd0e92b),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "IndexSorted",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        inputType: TextInputType.name,
                        hinttext: "Squence",
                        onsubmit: (value) {
                          setState(() {
                            sequence = value;
                          });
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        inputType: TextInputType.number,
                        hinttext: "len",
                        onsubmit: (value) {
                          if (value != "") {
                            lnempty = value;
                            len = int.parse(value);
                          }
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (lnempty.isNotEmpty && sequence.isNotEmpty) {
                            if (len <= sequence.length) {
                              sequence = sequence.toUpperCase();
                              List<dynamic> data = await BioServices()
                                  .indexsorted(sequence: sequence, ln: len);
                              log(data.toString());
                              for (int i = 0; i < data.length; i++) {
                                content += '\n ${data[i][0]}';
                                content += '\n ${data[i][1]}';
                              }

                              showMessage(
                                context,
                                content: content,
                                title: "",
                              );
                              content = "sort indexed is";
                            } else {
                              showMessage(
                                context,
                                content:
                                    "please enter len less or equal sequence",
                                title: "",
                              );
                            }
                          } else {
                            showMessage(
                              context,
                              content: "fields musn't be empty",
                              title: "",
                            );
                          }
                        },
                        child: const Text(
                          "indexsorted",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
