import 'package:eufemia/eufemia.dart';
import 'package:eufemia/src/graphics/cards/card_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

part 'card_design.dart';
part 'card_logo.dart';
part 'card_preset.dart';
part 'card_program.dart';
part 'card_type.dart';

const designBase = 'lib/assets/graphics/cards';
const logoBase = 'lib/assets/graphics/cards/logos';
const presetBase = 'lib/assets/graphics/cards/presets';
const programBase = 'lib/assets/graphics/cards/programs';
const typeBase = 'lib/assets/graphics/cards/types';

class PaymentCard extends StatelessWidget {
  final CardDesign design;
  final CardLogo logo;
  final CardProgram program;
  final CardType type;
  final CardPreset preset;
  final Color logoColor;
  final double width;
  final bool shadow;

  final int digits;
  final String digitsText;

  const PaymentCard({
    Key key,
    @required this.design,
    this.logo,
    this.program,
    this.type,
    this.preset,
    this.width = 343,
    this.digits = 1358,
    this.digitsText = 'KORTNUMMER',
    this.logoColor = Colors.white,
    this.shadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: AspectRatio(
        aspectRatio: goldenRatio,
        child: LayoutBuilder(builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            alignment: Alignment.center,
            children: [
              getCardBase(design),
              if (logo != null) ...{
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: constraints.maxWidth * 0.07,
                      top: constraints.maxWidth * 0.07,
                    ),
                    child: SvgPicture.asset(
                      getCardLogoAsset(logo),
                      width: constraints.maxWidth / 7.5,
                      color: logo == CardLogo.matte ? logoColor : null,
                      package: 'eufemia',
                    ),
                  ),
                ),
              },
              if (program != null) ...{
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: constraints.maxWidth * 0.07,
                      top: constraints.maxWidth * 0.07,
                    ),
                    child: SvgPicture.asset(
                      getCardProgramAsset(program),
                      width: constraints.maxWidth / 5,
                      package: 'eufemia',
                    ),
                  ),
                ),
              },
              if (type != null) ...{
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: constraints.maxWidth * 0.07,
                      bottom: constraints.maxWidth * 0.07,
                    ),
                    child: SvgPicture.asset(
                      getCardTypeAsset(type),
                      width: constraints.maxWidth / 5.5,
                      package: 'eufemia',
                    ),
                  ),
                ),
              },
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: constraints.maxWidth * 0.07,
                    bottom: constraints.maxWidth * 0.07,
                  ),
                  child: AnimatedDefaultTextStyle(
                    duration: Duration(milliseconds: 250),
                    style: TextStyle(
                      color: _cardBrightness == Brightness.dark ? Colors.white : EufemiaColors.coal,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Opacity(
                          opacity: 0.5,
                          child: Text(
                            digitsText,
                            style: TextStyle(fontSize: constraints.maxWidth * 0.02332),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 4.0),
                          child: Text(
                            '**** $digits',
                            style: TextStyle(fontSize: constraints.maxWidth * 0.0583),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  /// The rendered height of the widget
  double get height => width / goldenRatio;

  Brightness get _cardBrightness => (design == CardDesign.white || design == CardDesign.grey)
      ? Brightness.light
      : Brightness.dark;

  CardBase getCardBase(CardDesign design) {
    switch (design) {
      case CardDesign.black:
        return CardBase(
          startColor: Colors.black,
          endColor: Colors.black,
          shadow: shadow,
        );
      case CardDesign.white:
        return CardBase(
          startColor: Color(0xFFFAFAFA),
          endColor: Colors.white,
          stops: [0.0463, 0.9204],
          shadow: shadow,
        );
      case CardDesign.grey:
        return CardBase(
          startColor: Color(0xFFCCCCCC),
          endColor: Color(0xFFE8E8E8),
          shadow: shadow,
        );
      case CardDesign.gold:
        return CardBase(
          startColor: Color(0xFFBFA970),
          endColor: Color(0xFFD3BD83),
          stops: [0.0463, 0.8457],
          shadow: shadow,
        );
      case CardDesign.saga:
        return CardBase(
          startColor: Color(0xFF241E23),
          endColor: Color(0xFF251D23),
          stops: [0.0631, 0.852],
          shadow: shadow,
        );
      case CardDesign.brightGreen:
        return CardBase(
          startColor: Color(0xFF2CC48E),
          endColor: Color(0xFF28B482),
          stops: [0.0631, 0.8266],
          shadow: shadow,
        );
      case CardDesign.brightBlue:
        return CardBase(
          startColor: Color(0xFF50C9DE),
          endColor: Color(0xFF4BBED2),
          stops: [0.0631, 0.8266],
          shadow: shadow,
        );
      default:
        return CardBase(
          startColor: Color(0xFF008484),
          endColor: Color(0xFF007272),
          shadow: shadow,
        );
    }
  }

  String getCardTypeAsset(CardType type) {
    switch (type) {
      case CardType.masterCard:
        return '$typeBase/mastercard.svg';
      case CardType.masterCardSilver:
        return '$typeBase/mastercard_metallic.svg';
      case CardType.visaDebit:
        return '$typeBase/visa.svg';
      case CardType.visaDebitSilver:
        return '$typeBase/visa_metallic.svg';
      case CardType.visaDebitWhite:
        return '$typeBase/visa_white.svg';
      default:
        return '$typeBase/visa.svg';
    }
  }

  String getCardProgramAsset(CardProgram program) {
    switch (program) {
      case CardProgram.privateBanking:
        return '$programBase/private_banking.svg';
      case CardProgram.privateBankingVisaPlatinum:
        return '$programBase/private_banking_visa_platinum.svg';
      case CardProgram.sagaGold:
        return '$programBase/saga_gold.svg';
      case CardProgram.sagaPlatinum:
        return '$programBase/saga_platinum.svg';
      case CardProgram.sagaVisaPlatinum:
        return '$programBase/saga_visa_platinum.svg';
      default:
        return '$programBase/private_banking.svg';
    }
  }

  String getCardLogoAsset(CardLogo logo) {
    switch (logo) {
      case CardLogo.metallic:
        return '$logoBase/dnb_metallic.svg';
      case CardLogo.matte:
        return '$logoBase/dnb.svg';
      default:
        return '$logoBase/dnb.svg';
    }
  }
}
