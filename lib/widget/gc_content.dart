import 'dart:developer';

import 'package:bioproject/helper/customtextformfield.dart';
import 'package:bioproject/helper/isvaliddna.dart';
import 'package:bioproject/helper/showmessage.dart';
import 'package:bioproject/services/bioservices.dart';
import 'package:bioproject/models/biomodels.dart';
import 'package:flutter/material.dart';

class GcContent extends StatefulWidget {
  const GcContent({super.key});

  @override
  State<GcContent> createState() => _GcContentState();
}

class _GcContentState extends State<GcContent> {
  String Sequence = "";
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
                      "G,c percentage",
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
                            Sequence = Sequence.toUpperCase();
                            log(Sequence.toString());
                            bool isValidDNA = validateDNA(Sequence);
                            setState(() {
                              dna = isValidDNA;
                            });

                            log(dna.toString());
                            if (dna!) {
                              try {
                                BioModel data = await BioServices()
                                    .gcContent(Sequence: Sequence);
                                // ignore: use_build_context_synchronously
                                showMessage(context,
                                    content:
                                        "the percentage C,G is:${data.value.toString()}",
                                    title: "percentage C,G ");
                              } catch (e) {
                                log(e.toString());
                              }
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
                        child: const Text(
                          "percentage",
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
