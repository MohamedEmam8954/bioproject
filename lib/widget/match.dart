import 'dart:developer';

import 'package:bioproject/helper/isvaliddna.dart';
import 'package:bioproject/helper/showmessage.dart';
import 'package:bioproject/services/bioservices.dart';
import 'package:bioproject/models/biomodels.dart';
import 'package:flutter/material.dart';

import '../helper/customtextformfield.dart';

class ExactMatch extends StatefulWidget {
  const ExactMatch({
    super.key,
  });

  @override
  State<ExactMatch> createState() => _ExactMatchState();
}

class _ExactMatchState extends State<ExactMatch> {
  String Sequence = "";
  String subsequence = "", content = "";
  late bool dna, isvalid;
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
              color: Color(0xfffbcb84),
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
                      "Exact Match",
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
                        hinttext: "Text",
                        onsubmit: (value) {
                          setState(() {
                            Sequence = value;
                          });
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        inputType: TextInputType.text,
                        hinttext: "Pattern",
                        onsubmit: (value) {
                          subsequence = value;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (Sequence.isNotEmpty && subsequence.isNotEmpty) {
                            try {
                              BioModel data = await BioServices().match(
                                  seq: Sequence, subsquence: subsequence);

                              if (data.value.toString() == "[]") {
                                content = "Pattern Doesn't find in text";
                              } else {
                                content += "Match at: ${data.value}";
                              }
                              // ignore: use_build_context_synchronously
                              showMessage(context,
                                  content: content, title: "match");
                              content = "";
                            } catch (e) {
                              log(e.toString());
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
                          "Match",
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
