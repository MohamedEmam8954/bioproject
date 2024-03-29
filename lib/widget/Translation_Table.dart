import 'dart:developer';

import 'package:bioproject/helper/customtextformfield.dart';
import 'package:bioproject/helper/isvaliddna.dart';
import 'package:bioproject/helper/showmessage.dart';
import 'package:bioproject/services/bioservices.dart';
import 'package:bioproject/models/biomodels.dart';
import 'package:flutter/material.dart';

class TranslationTable extends StatefulWidget {
  const TranslationTable({super.key});

  @override
  State<TranslationTable> createState() => _TranslationTableState();
}

class _TranslationTableState extends State<TranslationTable> {
  String Sequence = "";
  bool dna = true;
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
              color: const Color(0xfffdd501),
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
                      "Translate dna to protein",
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
                            log(Sequence);
                            bool isvalid = validateDNA(Sequence);
                            setState(() {
                              dna = isvalid;
                            });
                            if (dna) {
                              if (Sequence.length >= 3) {
                                try {
                                  BioModel data = await BioServices()
                                      .translationTable(Sequence: Sequence);
                                  // ignore: use_build_context_synchronously
                                  showMessage(context,
                                      content:
                                          "Translation Table is:${data.value}",
                                      title: "Translation Table");
                                } catch (e) {
                                  log(e.toString());
                                }
                              } else {
                                showMessage(
                                  context,
                                  content:
                                      "char must be greater than or equal 3",
                                  title: "",
                                );
                              }
                            } else {
                              showMessage(
                                context,
                                content: "enter char dna {A,C,G,T}",
                                title: "",
                              );
                              dna = true;
                              setState(() {});
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
                          "Translate",
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
