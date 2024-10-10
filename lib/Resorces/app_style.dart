import 'package:dating_app/Resorces/app_color.dart';
import 'package:flutter/material.dart';

class AppStyles {
  static BuildContext? ctx;
  static AppStyles? _styles;

  final TextStyle _figtreeRegular =
      const TextStyle(fontFamily: 'Figtree-Regular');
  final TextStyle _figtreeBold = const TextStyle(fontFamily: 'Figtree-Bold');

  final TextStyle _figtreeExBold =
      const TextStyle(fontFamily: 'Figtree-ExBold');

  final TextStyle _figtreeMedium =
      const TextStyle(fontFamily: 'Figtree-Medium');
  final TextStyle _figtreeLight = const TextStyle(fontFamily: 'Figtree-Light');
  final TextStyle _figtreeBlack = const TextStyle(fontFamily: 'Figtree-Black');

  static AppStyles of(BuildContext context) {
    _styles ??= AppStyles();
    ctx = context;
    return _styles!;
  }

  // justSans Regular
  TextStyle get figtreeRegular {
    return _figtreeRegular.copyWith(
      color: AppColors.black,
      fontSize: 14,
      height: 1.3,
    );
  }

  // justSans Bold
  TextStyle get figtreeBold {
    return _figtreeBold.copyWith(
      color: AppColors.black,
      fontSize: 22,
      height: 1.3,
    );
  }

  // PowerGrotesk Regular
  TextStyle get figtreeExBold {
    return _figtreeExBold.copyWith(
      color: AppColors.black,
      fontSize: 16,
      height: 1.3,
    );
  }

  // Roboto Regular
  TextStyle get figtreeMedium {
    return _figtreeMedium.copyWith(
      color: AppColors.black,
      fontSize: 14,
      height: 1.3,
    );
  }

  // Roboto Medium
  TextStyle get figtreeLight {
    return _figtreeLight.copyWith(
      color: AppColors.black,
      fontSize: 16,
      height: 1.3,
    );
  }

  // Roboto Bold
  TextStyle get figtreeBlack {
    return _figtreeBlack.copyWith(
      color: AppColors.black,
      fontSize: 18,
      height: 1.3,
    );
  }

  // Custom TextStyle if you want to modify the font size, weight, or color
  TextStyle customStyle({
    required String fontFamily,
    required FontWeight fontWeight,
    required double fontSize,
    required Color color,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontWeight: fontWeight,
      fontSize: fontSize,
      color: color,
      height: 1.3,
    );
  }
}
// import 'package:event_management/Resorces/app_color.dart';
// import 'package:flutter/material.dart';

// class AppStyles {
//   /// BuildContext will be needed in the future for making the UI responsive
//   static BuildContext? ctx;
//   static AppStyles? _styles;

//   final TextStyle _justSansRegular = const TextStyle(fontFamily: 'justSans');
//   final TextStyle _justSansBold = const TextStyle(fontFamily: 'powerGrotesk');
//   final TextStyle _roboatRegular = const TextStyle(fontFamily: 'roboto');

//   static AppStyles of(BuildContext context) {
//     _styles ??= AppStyles();
//     ctx = context;
//     return _styles!;
//   }

//   /// HeadStyle Bold
//   TextStyle get justSansRegular {
//     return _justSansRegular.copyWith(
//       color: AppColors.white,
//       fontWeight: FontWeight.w400,
//       height: 1.3,
//       inherit: false,
//       textBaseline: TextBaseline.alphabetic,
//     );
//   }

//   /// HeadStyle Regular
//   TextStyle get justSansBold {
//     return _justSansBold.copyWith(
//       color: AppColors.white,
//       fontSize: 22,
//       fontWeight: FontWeight.w400,
//       height: 1.3,
//       inherit: false,
//       textBaseline: TextBaseline.alphabetic,
//     );
//   }

//   /// BodyStyle Regular
//   TextStyle get bodyStyleRegular {
//     return _justSansRegular.copyWith(
//       color: AppColors.white,
//       fontSize: 14,
//       fontWeight: FontWeight.w400,
//       height: 1.3,
//       inherit: false,
//       textBaseline: TextBaseline.alphabetic,
//     );
//   }

//   /// BodyStyle Medium
//   TextStyle get bodyStyleMedium {
//     return _justSansRegular.copyWith(
//       color: AppColors.white,
//       fontSize: 16,
//       fontWeight: FontWeight.w500,
//       height: 1.3,
//       inherit: false,
//       textBaseline: TextBaseline.alphabetic,
//     );
//   }

//   /// BodyStyle Semibold
//   TextStyle get bodyStyleSemiBold {
//     return _justSansRegular.copyWith(
//       color: AppColors.white,
//       fontSize: 14,
//       fontWeight: FontWeight.w600,
//       height: 1.3,
//       inherit: false,
//       textBaseline: TextBaseline.alphabetic,
//     );
//   }

//   /// BodyStyle Bold
//   TextStyle get bodyStyleBold {
//     return _justSansRegular.copyWith(
//       color: AppColors.white,
//       fontSize: 16,
//       fontWeight: FontWeight.w700,
//       height: 1.3,
//       inherit: false,
//       textBaseline: TextBaseline.alphabetic,
//     );
//   }
// }
