import 'package:bioproject/helper/customtextformfield.dart';
import 'package:bioproject/helper/showmessage.dart';
import 'package:bioproject/services/bioservices.dart';
import 'package:flutter/material.dart';

class Overlap extends StatelessWidget {
  const Overlap({super.key});
  // abcde
  // cdefg
  @override
  Widget build(BuildContext context) {
    String seq1 = "", seq2 = "", content = "Maximum Overlap Length:";
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(),
            child: Card(
              color: const Color(0xff54d76d),
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
                      "Overlap",
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
                          seq1 = value;
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        hinttext: "sequence1",
                        onsubmit: (value) {
                          if (value != "") {
                            seq2 = value;
                          }
                        }),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (seq1.isNotEmpty && seq2.isNotEmpty) {
                            int data =
                                await BioServices().overlap(a: seq1, b: seq2);
                            content += data.toString();
                            showMessage(
                              context,
                              content: content,
                              title: "",
                            );
                            content = "Maximum Overlap Length:";
                          } else {
                            showMessage(
                              context,
                              content: "fields musn't be empty",
                              title: "",
                            );
                          }
                        },
                        child: const Text(
                          "Overlap",
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
