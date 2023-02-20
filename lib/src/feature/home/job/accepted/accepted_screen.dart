import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zip_care/src/core/common/widgets/job_card2.dart';
import 'package:zip_care/src/core/constants/colors.dart';
import 'package:zip_care/src/core/common/widgets/common_chip.dart';
import 'package:zip_care/src/core/constants/strings.dart';
import 'package:zip_care/src/feature/home/job/accepted/accepted_vm.dart';

class AcceptedScreen extends StatelessWidget {
  const AcceptedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, _) {
      final _vm = ref.watch(acceptedProvider);
      return Scaffold(
          body: SingleChildScrollView(
              child: SafeArea(
                  child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 8,
                            itemBuilder:
                                (BuildContext context, int i) {
                              return JobCard2(
                                  jobId:
                                      "$strJobIds ${_vm.acceptedJobs["jobId"]}",
                                  title: _vm.acceptedJobs["title"],
                                  name: "${_vm.acceptedJobs["name"]}",
                                  year: "${_vm.acceptedJobs["year"]}",
                                  location:
                                      _vm.acceptedJobs["location"],
                                  hour: _vm.acceptedJobs["hour"],
                                  dateTime:
                                      _vm.acceptedJobs["dateTime"],
                                  widget: Wrap(
                                      spacing: 5,
                                      runSpacing: 0.0,
                                      children: [
                                        ..._vm.acceptedJobs[
                                                "careTypeAndSchedule"]
                                            .map((String v) =>
                                                CommonChip(
                                                    text: v,
                                                    onDeleted: () {}))
                                            .toList(),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                left: 5),
                                            child: CommonChip(
                                                text: "more...",
                                                color: AppColors
                                                    .darkPinkColor,
                                                textColor: AppColors
                                                    .whiteColor))
                                      ]),
                                  employed: "Employed");
                            })
                      ])))));
    });
  }
}
