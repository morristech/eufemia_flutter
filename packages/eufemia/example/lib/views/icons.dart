import 'package:eufemia/eufemia.dart';
import 'package:flutter/material.dart';

class IconsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navbar(
        title: Text('Icons'),
      ),
      body: ScrollableList(
        spaceBetween: EufemiaSpace.medium,
        padding: EufemiaInsets.small(EufemiaSides.horizontal),
        children: [
          EufemiaWrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Icon(EufemiaIcons.add),
              Icon(EufemiaIcons.alert),
              Icon(EufemiaIcons.alert_hint, size: 12),
              Icon(EufemiaIcons.a_invoice),
              Icon(EufemiaIcons.above_the_line),
              Icon(EufemiaIcons.apple_watch),
              Icon(EufemiaIcons.avatar),
              Icon(EufemiaIcons.back_arrow),
              Icon(EufemiaIcons.bell),
              Icon(EufemiaIcons.bank),
              Icon(EufemiaIcons.bowling),
              Icon(EufemiaIcons.bsu),
              Icon(EufemiaIcons.buildings),
              Icon(EufemiaIcons.calendar),
              Icon(EufemiaIcons.checkmark),
              Icon(EufemiaIcons.chevron),
              Icon(EufemiaIcons.chevron_small, size: 12),
              Icon(EufemiaIcons.clear, color: EufemiaColors.darkGray),
              Icon(EufemiaIcons.close),
              Icon(EufemiaIcons.cog),
              Icon(EufemiaIcons.cog_hint, size: 12),
              Icon(EufemiaIcons.camera),
              Icon(EufemiaIcons.car),
              Icon(EufemiaIcons.card),
              Icon(EufemiaIcons.card_hint, size: 12),
              Icon(EufemiaIcons.card_with_padlock),
              Icon(EufemiaIcons.chain),
              Icon(EufemiaIcons.chat_bubbles),
              Icon(EufemiaIcons.clock),
              Icon(EufemiaIcons.coins),
              Icon(EufemiaIcons.confetti),
              Icon(EufemiaIcons.contacts),
              Icon(EufemiaIcons.copy),
              Icon(EufemiaIcons.currency),
              Icon(EufemiaIcons.dismiss),
              Icon(EufemiaIcons.download),
              Icon(EufemiaIcons.digipost),
              Icon(EufemiaIcons.document),
              Icon(EufemiaIcons.down_payment),
              Icon(EufemiaIcons.e_invoice),
              Icon(EufemiaIcons.equities_and_mutual_funds),
              Icon(EufemiaIcons.filter),
              Icon(EufemiaIcons.forward_arrow),
              Icon(EufemiaIcons.flying_money),
              Icon(EufemiaIcons.from_account),
              Icon(EufemiaIcons.from_savings_account),
              Icon(EufemiaIcons.funds),
              Icon(EufemiaIcons.grabber),
              Icon(EufemiaIcons.globe),
              Icon(EufemiaIcons.hide),
              Icon(EufemiaIcons.hand_money),
              Icon(EufemiaIcons.hanger),
              Icon(EufemiaIcons.heart),
              Icon(EufemiaIcons.heart_rate),
              Icon(EufemiaIcons.information),
              Icon(EufemiaIcons.increase_loan),
              Icon(EufemiaIcons.kid_number),
              Icon(EufemiaIcons.kr_house),
              Icon(EufemiaIcons.launch),
              Icon(EufemiaIcons.location),
              Icon(EufemiaIcons.loupe),
              Icon(EufemiaIcons.lightbulb),
              Icon(EufemiaIcons.loan),
              Icon(EufemiaIcons.login),
              Icon(EufemiaIcons.loupe),
              Icon(EufemiaIcons.more),
              Icon(EufemiaIcons.manual_review),
              Icon(EufemiaIcons.mastercard),
              Icon(EufemiaIcons.mastercard_with_card),
              Icon(EufemiaIcons.message),
              Icon(EufemiaIcons.microphone),
              Icon(EufemiaIcons.moneybag),
              Icon(EufemiaIcons.moneybag_with_card),
              Icon(EufemiaIcons.move),
              Icon(EufemiaIcons.owl),
              Icon(EufemiaIcons.p2p),
              Icon(EufemiaIcons.padlock),
              Icon(EufemiaIcons.padlock_hint, size: 12),
              Icon(EufemiaIcons.paper_and_pen),
              Icon(EufemiaIcons.paperclip),
              Icon(EufemiaIcons.paragraph),
              Icon(EufemiaIcons.pay_from),
              Icon(EufemiaIcons.pay_to_card),
              Icon(EufemiaIcons.pencil),
              Icon(EufemiaIcons.pension),
              Icon(EufemiaIcons.people),
              Icon(EufemiaIcons.person),
              Icon(EufemiaIcons.piggybank),
              Icon(EufemiaIcons.plant),
              Icon(EufemiaIcons.progress),
              Icon(EufemiaIcons.property),
              Icon(EufemiaIcons.puzzle_piece),
              Icon(EufemiaIcons.questionmark),
              Icon(EufemiaIcons.reactivate),
              Icon(EufemiaIcons.recurring),
              Icon(EufemiaIcons.ref_number),
              Icon(EufemiaIcons.rejected),
              Icon(EufemiaIcons.remove),
              Icon(EufemiaIcons.repeat),
              Icon(EufemiaIcons.repeat_hint, size: 12),
              Icon(EufemiaIcons.restaurant),
              Icon(EufemiaIcons.return_icon),
              Icon(EufemiaIcons.review_warning),
              Icon(EufemiaIcons.scissors),
              Icon(EufemiaIcons.shopping),
              Icon(EufemiaIcons.share_android),
              Icon(EufemiaIcons.share_ios),
              Icon(EufemiaIcons.signing),
              Icon(EufemiaIcons.stack_of_coins),
              Icon(EufemiaIcons.star),
              Icon(EufemiaIcons.stocks),
              Icon(EufemiaIcons.stop),
              Icon(EufemiaIcons.support),
              Icon(EufemiaIcons.swap),
              Icon(EufemiaIcons.to_account),
              Icon(EufemiaIcons.to_savings_account),
              Icon(EufemiaIcons.train),
              Icon(EufemiaIcons.transfer),
              Icon(EufemiaIcons.transfer_to),
              Icon(EufemiaIcons.transfer_to_account),
              Icon(EufemiaIcons.trash),
              Icon(EufemiaIcons.type_indicator),
              Icon(EufemiaIcons.umbrella),
              Icon(EufemiaIcons.utilities),
              Icon(EufemiaIcons.vehicle),
              Icon(EufemiaIcons.web),
              Icon(EufemiaIcons.widget_android),
            ].map((i) => EufemiaPadding.small(child: i)).toList(),
          ),
          EufemiaWrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              ColoredIcon(
                icon: Icon(
                  EufemiaIcons.loan,
                  color: EufemiaColors.white,
                ),
                backgroundColor: Colors.green,
              ),
              ColoredIcon(
                icon: Icon(
                  EufemiaIcons.card,
                  color: EufemiaColors.white,
                ),
                backgroundColor: Colors.pink,
              ),
              ColoredIcon(
                icon: Icon(
                  EufemiaIcons.cog,
                  color: EufemiaColors.white,
                ),
                backgroundColor: Colors.blue,
              ),
            ],
          ),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              UpdateIcon(),
              UpdateIcon(platform: TargetPlatform.android),
            ].map((i) => EufemiaPadding.small(child: i)).toList(),
          ),
        ],
      ),
    );
  }
}
