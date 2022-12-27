import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mechalodon_mobile/components/buttons/primary_button.dart';
import 'package:mechalodon_mobile/generated/l10n.dart';
import 'package:mechalodon_mobile/modules/reset_password/send_reset_sms/bloc/bloc/send_reset_sms_bloc.dart';
import 'package:mechalodon_mobile/navigation/page_links.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/styles/style.dart';
import 'package:mechalodon_mobile/utils/mech_loading_widget.dart';

class SendResetSMSView extends StatelessWidget {
  SendResetSMSView({Key? key, this.phoneNumber}) : super(key: key);

  String? phoneNumber;
  final TextEditingController phoneController = TextEditingController();
  var s = serviceLocator<S>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MechColor.background,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
          child: Row(
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: MechColor.backButtonBorder,
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
                    ],
                    color: Colors.white,
                    border: Border.all(color: MechColor.foreground, width: 1),
                    borderRadius: const BorderRadius.all(Radius.circular(100))),
                child: Center(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      context.pop();
                    },
                    icon: const Icon(Icons.chevron_left),
                    color: MechColor.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: BlocBuilder<SendResetSMSBloc, SendResetSMSState>(
        builder: (context, state) {
          if (state is TextMessageSentSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              context.push(PageLink.resetPassword);
              // TODO replace with confirmation page
            });
          }
          return Container(
            color: MechColor.background,
            child: Stack(children: [
              Padding(
                padding: const EdgeInsets.all(17),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 18,
                    ),
                    Text(
                      s.enterPhoneNumberSubtitle,
                      style: MechTextStyle.subtitle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      s.enterPhoneNumberTitle,
                      style: MechTextStyle.title,
                    ),
                    const SizedBox(
                      height: 55,
                    ),
                    Text(s.enterPhoneNumberFieldTitle),
                    const SizedBox(
                      height: 6,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoneController,
                      decoration: MechBorder.inputStyle(s.phoneNumberExample),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MechActionButton(
                        title: s.sendCodeButtonTitle,
                        onTap: () {
                          if (phoneController.text != null) {
                            BlocProvider.of<SendResetSMSBloc>(context).add(
                                PhoneNumberSubmitted(phoneController.text));
                          }
                        })
                  ],
                ),
              ),
              (state is EnterPhoneLoading)
                  ? Container(
                      color: Colors.black.withOpacity(0.5),
                      child: const Center(
                        child: MechLoadingWidget(),
                      ),
                    )
                  : Container(),
            ]),
          );
        },
      ),
    );
  }
}
