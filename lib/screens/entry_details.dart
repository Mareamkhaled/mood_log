import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../core/utils/app_colors.dart';
import '../core/utils/app_style.dart';
import '../cubit/journal_cubit.dart';
import '../models/result_model.dart';
import '../widgets/custom_button.dart';
import '../widgets/cutom_shadow.dart';

class EntryDetails extends StatelessWidget {
  const EntryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ResultModel response =
        ModalRoute.of(context)!.settings.arguments as ResultModel;
    var formatedDate = DateFormat.yMMMd().format(response.date);
    var score = (response.score * 100).toStringAsFixed(0);

    return Scaffold(
      appBar: AppBar(
        title: Text(formatedDate, style: AppStyle.lemon20sPurple500),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Gap(25),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.myYellow,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [customShadow()],
              ),
              child: Column(
                children: [
                  Text(
                    response.emoji,
                    style: AppStyle.lemon20sPurple500.copyWith(fontSize: 55),
                  ),
                  const Gap(10),
                  Text(
                    response.mood,
                    style: AppStyle.entryDeatilsStyle.copyWith(
                      color: response.color,
                    ),
                  ),
                  const Gap(10),
                  Text(
                    "AI Detected - $score%",
                    style: AppStyle.entryDeatilsStyle.copyWith(
                      color: response.color,
                    ),
                  ),
                ],
              ),
            ),
          const  Gap(20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.myWhite,
                borderRadius: BorderRadius.circular(32),
                boxShadow: [customShadow()],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Journal Entry",
                    style: AppStyle.lemon15sGrey400.copyWith(
                      color: AppColors.myBlack,
                      fontSize: 18,
                    ),
                  ),
                  const Gap(10),
                  Text(response.text, style: AppStyle.lemon15sGrey400),
                ],
              ),
            ),
            const Gap(50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  text: "Edit Entry",
                  color: AppColors.myDarkPurple,
                  onPressed: () {
                  //todo navigate to write entry screen
                  },
                ),
                const Gap(15),
                CustomButton(
                  text: "Delete",
                  color: AppColors.myRed,
                  onPressed: () {
                    BlocProvider.of<JournalCubit>(
                      context,
                      listen: false,
                    ).deleteEntry(response.id);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
