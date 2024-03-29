// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:bioproject/helper/customtextformfield.dart';
import 'package:bioproject/helper/showmessage.dart';
import 'package:bioproject/services/bioservices.dart';
import 'package:flutter/material.dart';

class SuffixArry extends StatefulWidget {
  const SuffixArry({super.key});

  @override
  State<SuffixArry> createState() => _SuffixArryState();
}

class _SuffixArryState extends State<SuffixArry> {
  String Sequence = "", content = "the suffixes array is:";
  bool? dna;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 185,
            decoration: const BoxDecoration(),
            child: Card(
              color: const Color(0xff76d6ee),
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
                      "Suffix Array",
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
                        hinttext: "Squence",
                        onsubmit: (value) {
                          setState(() {
                            Sequence = value;
                          });
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (Sequence.isNotEmpty) {
                            var data = await BioServices()
                                .suffixArray(inputstr: Sequence);
                            log("the data is $data");
                            for (int i = 0; i < data.length; i++) {
                              content +=
                                  "\n[ ${data[i][0]},${data[i][1]},${data[i][2]}]";
                            }
                            showMessage(
                              context,
                              content: content,
                              title: "",
                            );
                            content = "the suffixes array is:";
                          } else {
                            showMessage(
                              context,
                              content: "field musn't be empty",
                              title: "",
                            );
                          }
                        },
                        child: const Text(
                          "Suffix",
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
