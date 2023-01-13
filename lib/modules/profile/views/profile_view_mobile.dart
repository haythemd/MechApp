import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mechalodon_mobile/modules/profile/bloc/profile_bloc.dart';
import 'package:mechalodon_mobile/styles/style.dart';
import 'package:mechalodon_mobile/utils/mech_loading_widget.dart';
import 'package:mechalodon_mobile/utils/mech_widgets.dart';
import 'package:mechalodon_mobile/generated/l10n.dart';
import 'package:mechalodon_mobile/services/injectable.dart';
import 'package:mechalodon_mobile/modules/profile/widgets/marketing_platform_integration_widget.dart';

import 'package:mechalodon_mobile/modules/profile/widgets/privacy_policy_widget.dart';

import '../widgets/subtitle_widget.dart';

class ProfileViewMobile extends StatefulWidget {
  const ProfileViewMobile({Key? key}) : super(key: key);

  @override
  State<ProfileViewMobile> createState() => _ProfileViewMobileState();
}

class _ProfileViewMobileState extends State<ProfileViewMobile> {
  var s = serviceLocator<S>();
  @override
  void initState() {
    super.initState();
    loadProfile();
  }

  void loadProfile() {
    BlocProvider.of<ProfileBloc>(context)
        .add(LoadProfile(id: "Current user id"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MechWidgets.appBar(
          title: s.ProfileViewTitle, context: context, showBackButton: false),
      body: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        if (state is ProfileError) {
          return Text(
            state.message,
            style: const TextStyle(color: MechColor.error, fontSize: 15),
          );
        }
        if (state is ProfileSuccess) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: ListView(
              children: [
                SubtitleWidget(title: s.profileIntegrationsText),
                const SizedBox(
                  height: 10,
                ),
                // ClipRRect(
                //     borderRadius: BorderRadius.circular(100),
                //     child: const LinearProgressIndicator(
                //       value: 0.4,
                //       valueColor: AlwaysStoppedAnimation(Colors.black),
                //       minHeight: 8,
                //       backgroundColor: Colors.grey,
                //     )),
                SizedBox(
                  height: 24,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        s.profileIntegrationText,
                        style: MechTextStyle.subheading5
                            .copyWith(color: Colors.black),
                      ),
                      Text(
                        s.completedCapitalText(60),
                        style: MechTextStyle.subheading5
                            .copyWith(color: Colors.black),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MechColor.foreground),
                  width: double.infinity,
                  height: 180,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...state.profileModel.integrations
                          .map((e) => MarketingPlatformIntegrationWidget(
                                imagePath:
                                    'assets/icons/${e.platform.toLowerCase()}.svg',
                                socialPlatform: e.platform,
                                integrated: e.isConnected,
                                onPressed: () {},
                              ))
                    ],
                  ),
                ),
                SubtitleWidget(title: s.innovationStation),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MechColor.foreground),
                  width: double.infinity,
                  height: 180,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        InfoPagesButtons(
                            text: s.newFeatures, onTap: () {}),
                        InfoPagesButtons(
                            text: s.suggestAFeature, onTap: () {}),
                        InfoPagesButtons(text: s.voteOnFutureInnovations, onTap: () {})
                      ],
                    ),
                  ),
                ),
                SubtitleWidget(title: s.privacyPolicyCapitalText),
                const SizedBox(
                  height: 8,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MechColor.foreground),
                  width: double.infinity,
                  height: 180,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      children: [
                        InfoPagesButtons(
                            text: s.termsOfServiceText, onTap: () {}),
                        InfoPagesButtons(
                            text: s.privacyPolicyText, onTap: () {}),
                        InfoPagesButtons(text: s.cookiePolicyText, onTap: () {})
                      ],
                    ),
                  ),
                ),
                Container(height: 300,)
              ],
            ),
          );
        }
        return const Center(child: MechLoadingWidget());
      }),
    );
  }
}
