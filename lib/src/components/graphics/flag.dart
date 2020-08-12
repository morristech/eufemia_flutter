import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

const double _borderRadius = 100.0;

class FlagData {
  String fromCountryCode(String countryCode) {
    return '$base/$countryCode.svg';
  }

  static const base = 'lib/assets/graphics/flags';
  static const ae = '$base/ae.svg';
  static const au = '$base/au.svg';
  static const bg = '$base/bg.svg';
  static const bh = '$base/bh.svg';
  static const br = '$base/br.svg';
  static const bs = '$base/bs.svg';
  static const bw = '$base/bw.svg';
  static const ca = '$base/ca.svg';
  static const ch = '$base/ch.svg';
  static const cl = '$base/cl.svg';
  static const cn = '$base/cn.svg';
  static const cz = '$base/cz.svg';
  static const dk = '$base/dk.svg';
  static const dO = '$base/do.svg';
  static const eg = '$base/eg.svg';
  static const et = '$base/et.svg';
  static const eu = '$base/eu.svg';
  static const gb = '$base/gb.svg';
  static const gm = '$base/gm.svg';
  static const hk = '$base/hk.svg';
  static const hr = '$base/hr.svg';
  static const hu = '$base/hu.svg';
  static const id = '$base/id.svg';
  static const il = '$base/il.svg';
  static const iN = '$base/in.svg';
  static const iS = '$base/is.svg';
  static const jo = '$base/jo.svg';
  static const jp = '$base/jp.svg';
  static const ke = '$base/ke.svg';
  static const kr = '$base/kr.svg';
  static const kw = '$base/kw.svg';
  static const lk = '$base/lk.svg';
  static const ma = '$base/ma.svg';
  static const mk = '$base/mk.svg';
  static const mu = '$base/mu.svg';
  static const mv = '$base/mv.svg';
  static const mx = '$base/mx.svg';
  static const my = '$base/my.svg';
  static const no = '$base/no.svg';
  static const nz = '$base/nz.svg';
  static const om = '$base/om.svg';
  static const ph = '$base/ph.svg';
  static const pk = '$base/pk.svg';
  static const pl = '$base/pl.svg';
  static const qa = '$base/qa.svg';
  static const ro = '$base/ro.svg';
  static const rs = '$base/rs.svg';
  static const ru = '$base/ru.svg';
  static const sa = '$base/sa.svg';
  static const se = '$base/se.svg';
  static const sg = '$base/sg.svg';
  static const th = '$base/th.svg';
  static const tn = '$base/tn.svg';
  static const tr = '$base/tr.svg';
  static const tw = '$base/tw.svg';
  static const tz = '$base/tz.svg';
  static const us = '$base/us.svg';
  static const vn = '$base/vn.svg';
  static const vu = '$base/vu.svg';
  static const za = '$base/za.svg';
}

class Flag extends StatelessWidget {
  final String country;
  final double width;
  final double height;
  final BoxFit fit;

  const Flag(
    this.country, {
    Key key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_borderRadius),
      child: SvgPicture.asset(
        country,
        width: width,
        height: height,
        fit: fit,
        package: 'eufemia',
      ),
    );
  }
}
