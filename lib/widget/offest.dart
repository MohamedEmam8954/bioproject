import 'dart:developer';
import 'package:bioproject/helper/customtextformfield.dart';
import 'package:bioproject/helper/isvaliddna.dart';
import 'package:bioproject/helper/showmessage.dart';
import 'package:bioproject/services/bioservices.dart';
import 'package:flutter/material.dart';

class OffestBio extends StatefulWidget {
  const OffestBio({super.key});

  @override
  State<OffestBio> createState() => _OffestBioState();
}

class _OffestBioState extends State<OffestBio> {
  String pattern = "", lnempty = "", content = "Occurrences:";
  int length = 0;
  bool dna = true;

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
              color: const Color(0xfff5b041),
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
                      "Kmer",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        inputType: TextInputType.text,
                        hinttext: "pattern",
                        onsubmit: (value) {
                          setState(() {
                            pattern = value;
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
                            length = int.parse(value);
                          }
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (lnempty.isNotEmpty && pattern.isNotEmpty) {
                            if (length <= pattern.length) {
                              pattern = pattern.toUpperCase();
                              bool isvalid = validateDNA(pattern);
                              setState(() {
                                dna = isvalid;
                              });
                              if (dna) {
                                List<dynamic> data = await BioServices()
                                    .query(length: length, pattern: pattern);
                                if (data.isEmpty) {
                                  content += '[]';
                                }
                                log(data.toString());
                                for (int i = 0; i < data.length; i++) {
                                  content += '\n ${data[i]}';
                                }
                                showMessage(
                                  context,
                                  content: content,
                                  title: "",
                                );
                              } else {
                                showMessage(
                                  context,
                                  content: "you must enter character {A,C,G,T}",
                                  title: "",
                                );
                                dna = true;
                                setState(() {});
                              }
                              content = "Occurrences: ";
                            } else {
                              showMessage(
                                context,
                                content:
                                    "please enter len less or equal pattern",
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
                          "Kmer",
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
    ;
  }
}
