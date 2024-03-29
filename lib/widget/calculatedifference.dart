import 'package:bioproject/helper/customtextformfield.dart';

import 'package:bioproject/helper/showmessage.dart';
import 'package:bioproject/services/bioservices.dart';
import 'package:bioproject/models/biomodels.dart';
import 'package:flutter/material.dart';

class CalculateDifference extends StatefulWidget {
  const CalculateDifference({super.key});

  @override
  State<CalculateDifference> createState() => _CalculateDifferenceState();
}

class _CalculateDifferenceState extends State<CalculateDifference> {
  String Sequence1 = "", sequence2 = "", content = "the differnce is:";
  bool dna = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300,
            decoration: const BoxDecoration(),
            child: Card(
              color: const Color(0xffffffff),
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
                      "calculating the Euclidean distance",
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
                            Sequence1 = value;
                          });
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        inputType: TextInputType.text,
                        hinttext: "Squence1",
                        onsubmit: (value) {
                          setState(() {
                            sequence2 = value;
                          });
                        }),
                    const SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (Sequence1.isNotEmpty && sequence2.isNotEmpty) {
                            BioModel bioModel = await BioServices()
                                .calculatedifference(
                                    sequence1: Sequence1, sequence2: sequence2);
                            content += bioModel.value.toString();
                            showMessage(
                              context,
                              content: content,
                              title: "",
                            );
                            content = "the differnce is:";
                          } else {
                            showMessage(
                              context,
                              content: "fields musn't be empty",
                              title: "",
                            );
                          }
                        },
                        child: const Text(
                          "Calculate Difference",
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
