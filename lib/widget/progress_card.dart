import 'package:flutter/material.dart';
import 'package:tidyup/utils/colors.dart';
import 'package:tidyup/utils/constants.dart';
import 'package:tidyup/utils/text_styles.dart';

class ProgressCard extends StatefulWidget {
  final int completedTasks;
  final int totalTasks;

  const ProgressCard({
    super.key,
    required this.completedTasks,
    required this.totalTasks,
  });

  @override
  State<ProgressCard> createState() => _ProgressCardState();
}

class _ProgressCardState extends State<ProgressCard> {
  @override
  Widget build(BuildContext context) {

        double completionPercentage = widget.totalTasks != 0
        ? (widget.completedTasks / widget.totalTasks) * 100
        : 0; // Handle division by zero
    return Container(
      padding: const EdgeInsets.all(AppConstants.kDefaultPadding),
      decoration: BoxDecoration(
        color: AppColors.kCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Today's Progress", style: AppTextStyles.appSubtitle),
              const SizedBox(height: 8),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: Text(
                  "You have completed ${widget.completedTasks} out of ${widget.totalTasks} tasks, \nkeep up the progress!",
                  style: AppTextStyles.appDescriptionSmall.copyWith(
                    color: AppColors.kWhiteColor.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.19,
                height: MediaQuery.of(context).size.width * 0.19,
                decoration: BoxDecoration(
                  gradient: AppColors().kPrimaryGradient,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                      "${completionPercentage.toStringAsFixed(0)}%",
                    style: AppTextStyles.appSubtitle.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ))
            ],
          ),
        ],
      ),
    );
  }
}
