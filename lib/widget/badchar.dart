import 'dart:developer';
import 'dart:ffi';

import 'package:bioproject/helper/customtextformfield.dart';
import 'package:bioproject/helper/isvaliddna.dart';
import 'package:bioproject/helper/showmessage.dart';
import 'package:bioproject/models/biomodels.dart';
import 'package:bioproject/services/bioservices.dart';

import 'package:flutter/material.dart';

class BadChar extends StatefulWidget {
  const BadChar({super.key});

  @override
  State<BadChar> createState() => _BadCharState();
}

class _BadCharState extends State<BadChar> {
  String sequence = "", subseq = "", content = "pattern found at";
  bool dna = true, isvalid = false;
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
              color: Colors.red,
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
                      "Bad character",
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
                        hinttext: "Sequence",
                        onsubmit: (value) {
                          setState(() {
                            sequence = value;
                          });
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        inputType: TextInputType.text,
                        hinttext: "Subequence",
                        onsubmit: (value) {
                          subseq = value;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (sequence.isNotEmpty && subseq.isNotEmpty) {
                            isvalid = validateDNA(sequence);
                            setState(() {
                              dna = isvalid;
                            });
                            if (dna) {
                              BadCharModel badchar = await BioServices()
                                  .badChar(seq: sequence, subsquence: subseq);
                              log(badchar.aligment.toString());
                              // ignore: use_build_context_synchronously
                              showMessage(context,
                                  content:
                                      "bad character at:${badchar.position}\n the aligment is:${badchar.aligment}",
                                  title: "bad character");
                            } else {
                              showMessage(
                                context,
                                content: "enter char dna {A,C,G,T}",
                                title: "",
                              );
                              setState(() {
                                dna = true;
                              });
                            }
                          } else {
                            showMessage(
                              context,
                              content: "field musn't be empty",
                              title: "",
                            );
                          }
                        },
                        child: Text(
                          "Bad character",
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
