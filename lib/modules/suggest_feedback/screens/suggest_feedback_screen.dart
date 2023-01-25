import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/utils/responsive.dart';
import '../bloc/suggest_feedback_bloc.dart';
import '../view/suggest_feedback_mobile_view.dart';

class SuggestFeedbackScreen extends StatelessWidget {
  const SuggestFeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<SuggestFeedbackBloc>(),
      child: const Responsive(
          mobile: SuggestFeedbackMobileView(),
          desktop: SuggestFeedbackMobileView(),
          tablet: SuggestFeedbackMobileView()),
    );
  }
}
