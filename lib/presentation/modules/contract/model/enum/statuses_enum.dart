import 'package:flutter/material.dart';
import 'package:home_care/core/core.dart';

enum Statuses {
  active('ACTIVE', Color(0xff39A07C), Color(0xffE4F5EF)),
  closed('CLOSED', Colors.white, Colors.white),
  expired('EXPIRED', Color(0xffE2331F), Color(0xffFBE5E3)),
  newStatus('NEW', Color(0xFFFCC500), Color(0xFFFFF8DF)),
  signed('SIGNED', Colors.orange, Colors.orange);

  final String name;

  final Color colorText;

  final Color colorStatuses;

  const Statuses(this.name, this.colorText, this.colorStatuses);
}

extension GetValueStatuses on Statuses {
  static Statuses getStatuses(String value) {
    switch (value) {
      case 'ACTIVE':
        return Statuses.active;
      case 'CLOSED':
        return Statuses.closed;
      case 'EXPIRED':
        return Statuses.expired;
      case 'NEW':
        return Statuses.newStatus;
      case 'SIGNED':
        return Statuses.signed;
      default:
        return Statuses.newStatus;
    }
  }

  static String getNameWithLang(BuildContext context, String value) {
    final lang = Utils.languageOf(context);
    switch (value) {
      case 'ACTIVE':
        return lang.effective;
      case 'CLOSED':
        return lang.liquidated;
      case 'EXPIRED':
        return lang.expiredEffective;
      case 'NEW':
        return lang.noEffective;
      case 'SIGNED':
        return lang.noEffective;
      default:
        return '';
    }
  }
}
