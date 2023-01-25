import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/styles/style.dart';
import 'package:mechalodon_mobile/utils/mech_loading_widget.dart';
import 'package:mechalodon_mobile/utils/mech_widgets.dart';
import 'package:mechalodon_mobile/modules/suggest_feedback/bloc/suggest_feedback_bloc.dart';
import 'package:mechalodon_mobile/generated/l10n.dart';

class SuggestFeedbackMobileView extends StatefulWidget {
  const SuggestFeedbackMobileView({Key? key}) : super(key: key);

  @override
  State<SuggestFeedbackMobileView> createState() =>
      _SuggestFeedbackMobileViewState();
}

class _SuggestFeedbackMobileViewState extends State<SuggestFeedbackMobileView> {
  var s = serviceLocator<S>();
  final GlobalKey<FormState> _key = GlobalKey();
  final TextEditingController _formController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: MechColor.background,
        appBar: MechWidgets.appBar(
            onBackPressed: () {
              context.pop();
            },
            title: s.customerFeedback,
            context: context),
        body: BlocBuilder<SuggestFeedbackBloc, SuggestFeedbackState>(
            builder: (context, state) {
          if (state is SuggestFeedbackInitial) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 24, top: 32),
                      height: 60,
                      child: Text(
                        s.customerFeedbackHint,
                        style: MechTextStyle.subheading3
                            .copyWith(color: const Color(0xFF323232)),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        s.addSuggestions,
                        style: MechTextStyle.subheading5
                            .copyWith(color: Colors.black, fontSize: 12),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                      height: 220,
                      decoration: const BoxDecoration(
                        borderRadius: MechBorderRadius.radius,
                        color: Color(0xFFF4F4F8),
                      ),
                      child: Form(
                          key: _key,
                          child: TextFormField(
                            autocorrect: false,
                            validator: (e) => (e == '' || e == null)
                                ? s.emptyFeedbackError
                                : null,
                            controller: _formController,
                            maxLines: 14,
                            decoration: const InputDecoration.collapsed(
                                hintText: '', fillColor: Colors.transparent),
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        if (_key.currentState!.validate()) {
                          submitFeedback();
                        }
                      },
                      child: Container(
                        height: 60,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            borderRadius: MechBorderRadius.radius,
                            color: Colors.black),
                        child: Center(
                          child: Text(
                            s.submitButtonText,
                            style: MechTextStyle.h5,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }
          if (state is SuggestFeedbackSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.of(context).pop();
            });
          }
          if (state is SuggestFeedbackError) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              Navigator.of(context).pop();
            });
          }
          return const Center(child: MechLoadingWidget());
        }));
  }

  void submitFeedback() {
    BlocProvider.of<SuggestFeedbackBloc>(context)
        .add(SendFeedback(id: "Current user id", text: _formController.text));
  }
}
