import 'package:eufemia/eufemia.dart';
import 'package:eufemia/src/graphics/cards/card_base.dart';
import 'package:eufemia/src/graphics/cards/card_design.dart';
import 'package:eufemia/src/graphics/cards/card_logo.dart';
import 'package:eufemia/src/graphics/cards/card_preset.dart';
import 'package:eufemia/src/graphics/cards/card_program.dart';
import 'package:eufemia/src/graphics/cards/card_type.dart';
import 'package:flippable_box/flippable_box.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const designBase = 'lib/assets/graphics/cards';
const logoBase = 'lib/assets/graphics/cards/logos';
const presetBase = 'lib/assets/graphics/cards/presets';
const programBase = 'lib/assets/graphics/cards/programs';
const typeBase = 'lib/assets/graphics/cards/types';

class PaymentCardFrontContent {
  final CardLogo logo;
  final CardProgram program;
  final CardType type;
  final CardPreset preset;
  final Color logoColor;
  final int digits;
  final String digitsText;
  final Alignment logoAlignment;

  PaymentCardFrontContent({
    this.logo,
    this.program,
    this.type,
    this.preset,
    this.logoColor = Colors.white,
    this.digits = 1358,
    this.digitsText = 'KORTNUMMER',
    this.logoAlignment = Alignment.topLeft,
  });
}

class PaymentCardBackContent {
  final String accountNumber;
  final String accountName;
  final String cardholder;
  final String type;

  PaymentCardBackContent({
    this.accountNumber,
    this.accountName,
    this.cardholder,
    this.type,
  });
}

class PaymentCard extends StatefulWidget {
  final CardDesign design;
  final double width;
  final bool shadow;
  final bool flippable;
  final bool softLight;
  final String accountNumber;

  final PaymentCardFrontContent frontContent;
  final PaymentCardBackContent backContent;

  const PaymentCard({
    Key key,
    this.width = 343,
    this.shadow = true,
    this.flippable = true,
    this.accountNumber,
    this.softLight = true,
    this.backContent,
    @required this.frontContent,
    @required this.design,
  }) : super(key: key);

  @override
  _PaymentCardState createState() => _PaymentCardState();

  double get height => width / goldenRatio;
}

class _PaymentCardState extends State<PaymentCard> {
  bool isFlipped;

  @override
  void initState() {
    super.initState();
    isFlipped = false;
  }

  void flip() {
    if (widget.flippable) setState(() => isFlipped = !isFlipped);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: buildBoxDecoration(),
      child: SizedBox(
        width: widget.width,
        child: AspectRatio(
          aspectRatio: goldenRatio,
          child: LayoutBuilder(
            builder: (context, constraints) {
              return GestureDetector(
                onTap: flip,
                child: widget.flippable
                    ? FlippableBox(
                        front: Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          child: PaymentCardFront(
                            widget: widget,
                            softLight: widget.softLight,
                          ),
                        ),
                        back: Container(
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          child: PaymentCardBack(
                            widget: widget,
                            softLight: widget.softLight,
                          ),
                        ),
                        isFlipped: isFlipped,
                      )
                    : PaymentCardFront(
                        widget: widget,
                        softLight: widget.softLight,
                      ),
              );
            },
          ),
        ),
      ),
    );
  }

  BoxDecoration buildBoxDecoration() {
    return BoxDecoration(
      boxShadow: widget.shadow
          ? [
              BoxShadow(
                color: context.bright
                    ? EufemiaColors.lightShadow.withOpacity(0.08)
                    : Colors.white.withOpacity(0.1),
                blurRadius: 16.0,
                spreadRadius: 2.0,
              ),
            ]
          : null,
    );
  }

  /// The rendered height of the widget
  double get height => widget.width / goldenRatio;
}

class PaymentCardBack extends StatelessWidget {
  const PaymentCardBack({
    Key key,
    @required this.widget,
    @required this.softLight,
  }) : super(key: key);

  final PaymentCard widget;
  final bool softLight;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          getCardBase(widget.design, softLight),
          buildMagneticStripe(),
          buildBackContent(context, widget.backContent, constraints),
        ],
      );
    });
  }

  Widget buildBackContent(
    BuildContext context,
    PaymentCardBackContent content,
    BoxConstraints constraints,
  ) {
    return DefaultTextStyle(
      style: TextStyle(
        color: getTextColor(widget.design),
      ),
      child: Align(
        alignment: Alignment(-0.75, 0.25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(2.5),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(top: 1, left: 1, right: 1),
                    width: constraints.maxWidth / 1.4,
                    height: constraints.maxHeight / 6,
                    color: Colors.grey[200],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      content?.cardholder ?? 'Ola Nordmann',
                      style: TextStyle(
                        height: 1,
                        color: EufemiaColors.coal,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kontonavn',
                      style: context.textTheme.bodyText1.copyWith(
                        color: getTextColor(widget.design),
                      ),
                    ),
                    Text(content?.accountName ?? 'Brukskonto'),
                  ],
                ),
                SizedBox(width: 16.0),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Kontonr.',
                      style: context.textTheme.bodyText1.copyWith(
                        color: getTextColor(widget.design),
                      ),
                    ),
                    Text(content?.accountNumber ?? '1214 49 49534'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Align buildMagneticStripe() {
    return Align(
      alignment: Alignment.topCenter,
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
          margin: const EdgeInsets.only(top: 16.0),
          height: constraints.maxHeight / 5,
          decoration: BoxDecoration(
            color: Colors.black,
            gradient: getMagnetStripeGradient(widget.design),
          ),
        );
      }),
    );
  }

  Align buildBackSupportDetails(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 4.0,
          horizontal: 8.0,
        ),
        child: DefaultTextStyle(
          style: context.textTheme.overline.copyWith(
            color: getTextColor(widget.design),
            fontSize: 8.0,
            fontWeight: FontWeight.w300,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Text('DNB Kundeservice +47 915 04800'),
              const Text('www.dnb.no'),
            ],
          ),
        ),
      ),
    );
  }
}

class PaymentCardFront extends StatelessWidget {
  const PaymentCardFront({
    Key key,
    @required this.widget,
    @required this.softLight,
  }) : super(key: key);

  final PaymentCard widget;
  final bool softLight;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          getCardBase(widget.design, softLight),
          if (widget.frontContent.logo != null) ...{
            PaymentCardLogo(
              alignment: widget.frontContent.logoAlignment,
              logo: widget.frontContent.logo,
              color: widget.frontContent.logoColor,
            ),
          },
          if (widget.frontContent.program != null) ...{
            PaymentCardProgram(
              program: widget.frontContent.program,
            ),
          },
          if (widget.frontContent.type != null) ...{
            PaymentCardType(
              type: widget.frontContent.type,
            ),
          },
          PaymentCardDigits(
            design: widget.design,
            digitsText: widget.frontContent.digitsText,
            digits: widget.frontContent.digits,
          ),
        ],
      ),
    );
  }
}

class PaymentCardDigits extends StatelessWidget {
  const PaymentCardDigits({
    Key key,
    @required this.design,
    this.digitsText,
    this.digits,
  }) : super(key: key);

  final CardDesign design;
  final String digitsText;
  final int digits;

  Brightness get _cardBrightness =>
      (design == CardDesign.white || design == CardDesign.grey)
          ? Brightness.light
          : Brightness.dark;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.only(
              left: constraints.maxWidth * 0.07,
              bottom: constraints.maxWidth * 0.07,
            ),
            child: AnimatedDefaultTextStyle(
              duration: Duration(milliseconds: 250),
              style: TextStyle(
                color: _cardBrightness == Brightness.dark
                    ? Colors.white
                    : EufemiaColors.coal,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      digitsText ?? '',
                      style:
                          TextStyle(fontSize: constraints.maxWidth * 0.02332),
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
          );
        },
      ),
    );
  }
}

class PaymentCardType extends StatelessWidget {
  const PaymentCardType({
    Key key,
    @required this.type,
  }) : super(key: key);

  final CardType type;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: LayoutBuilder(
        builder: (context, snapshot) {
          return LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.only(
                  right: constraints.maxWidth * 0.07,
                  bottom: constraints.maxWidth * 0.07,
                ),
                child: SvgPicture.asset(
                  getCardTypeAsset(type),
                  width: constraints.maxWidth / 5.5,
                  package: 'eufemia',
                ),
              );
            },
          );
        },
      ),
    );
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
}

class PaymentCardProgram extends StatelessWidget {
  const PaymentCardProgram({
    Key key,
    @required this.program,
  }) : super(key: key);

  final CardProgram program;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: EdgeInsets.only(
              right: constraints.maxWidth * 0.07,
              top: constraints.maxWidth * 0.07,
            ),
            child: SvgPicture.asset(
              getCardProgramAsset(program),
              width: constraints.maxWidth / 5,
              package: 'eufemia',
            ),
          );
        },
      ),
    );
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
}

class PaymentCardLogo extends StatelessWidget {
  const PaymentCardLogo({
    Key key,
    @required this.logo,
    @required this.color,
    this.alignment = Alignment.topLeft,
  }) : super(key: key);

  final CardLogo logo;
  final Color color;
  final Alignment alignment;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding: alignment == Alignment.topLeft
                ? EdgeInsets.only(
                    left: constraints.maxWidth * 0.07,
                    top: constraints.maxWidth * 0.07,
                  )
                : EdgeInsets.only(
                    right: constraints.maxWidth * 0.07,
                    top: constraints.maxWidth * 0.07,
                  ),
            child: SvgPicture.asset(
              getCardLogoAsset(logo),
              width: constraints.maxWidth / 7.5,
              color: logo == CardLogo.matte ? color : null,
              package: 'eufemia',
            ),
          );
        },
      ),
    );
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

Color getTextColor(CardDesign design) {
  switch (design) {
    case CardDesign.matteBlack:
    case CardDesign.black:
    case CardDesign.green:
      return Colors.white;
    case CardDesign.saga:
      return EufemiaColors.sagaGold;
    default:
      return EufemiaColors.coal;
  }
}

CardBase getCardBase(CardDesign design, bool softLight) {
  switch (design) {
    case CardDesign.black:
      return CardBase(
        startColor: Colors.black,
        endColor: Colors.black,
        softLight: softLight,
      );
    case CardDesign.white:
      return CardBase(
        startColor: Color(0xFFFAFAFA),
        endColor: Colors.white,
        stops: [0.0463, 0.9204],
        softLight: softLight,
      );
    case CardDesign.grey:
      return CardBase(
        startColor: Color(0xFFCCCCCC),
        endColor: Color(0xFFE8E8E8),
        softLight: softLight,
      );
    case CardDesign.gold:
      return CardBase(
        startColor: Color(0xFFBFA970),
        endColor: Color(0xFFD3BD83),
        stops: [0.0463, 0.8457],
        softLight: softLight,
      );
    case CardDesign.saga:
      return CardBase(
        startColor: Color(0xFF241E23),
        endColor: Color(0xFF251D23),
        stops: [0.0631, 0.852],
        softLight: softLight,
      );
    case CardDesign.brightGreen:
      return CardBase(
        startColor: Color(0xFF2CC48E),
        endColor: Color(0xFF28B482),
        stops: [0.0631, 0.8266],
        softLight: softLight,
      );
    case CardDesign.brightBlue:
      return CardBase(
        startColor: Color(0xFF50C9DE),
        endColor: Color(0xFF4BBED2),
        stops: [0.0631, 0.8266],
        softLight: softLight,
      );
    case CardDesign.matteBlack:
      return CardBase(
        startColor: Color(0xFF393939),
        endColor: Color(0xFF252525),
        stops: [0.1979, 0.9268],
        softLight: softLight,
      );
    default:
      return CardBase(
        startColor: Color(0xFF008484),
        endColor: Color(0xFF007272),
        softLight: softLight,
      );
  }
}

Gradient getMagnetStripeGradient(CardDesign design) {
  switch (design) {
    case CardDesign.black:
    case CardDesign.matteBlack:
    case CardDesign.green:
    case CardDesign.brightGreen:
    case CardDesign.brightBlue:
    case CardDesign.grey:
      return RadialGradient(
        colors: [
          Colors.grey[400],
          Colors.grey[300],
        ],
        radius: 5.0,
        center: Alignment.centerRight,
      );
    case CardDesign.gold:
      return RadialGradient(
        colors: [
          Color.fromRGBO(181, 156, 79, 1),
          Color.fromRGBO(171, 141, 79, 1),
        ],
        radius: 7.5,
        center: Alignment.centerRight,
      );
    case CardDesign.saga:
      return RadialGradient(
        colors: [
          Color.fromRGBO(217, 177, 121, 1),
          Color.fromRGBO(154, 113, 65, 1),
        ],
        radius: 7.5,
        center: Alignment.centerRight,
      );
    default:
      return RadialGradient(
        colors: [
          Color(0xFF333333),
          Colors.black,
        ],
        radius: 5.0,
        center: Alignment.centerRight,
      );
  }
}
