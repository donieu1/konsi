import 'package:desafio/domain/entities/theme/theme_constants.dart';
import 'package:flutter/material.dart';


class SpacerVertical extends SizedBox {
  const SpacerVertical.min({super.key})
      : super(height: ThemeConstants.minPadding);
  const SpacerVertical.half({super.key})
      : super(height: ThemeConstants.halfPadding);
  const SpacerVertical.dots({super.key}) : super(height: ThemeConstants.button);
  const SpacerVertical.normal({super.key})
      : super(height: ThemeConstants.padding);
  const SpacerVertical.double({super.key})
      : super(height: ThemeConstants.doublePadding);
  const SpacerVertical.high({super.key})
      : super(height: ThemeConstants.largePadding);
}

class SpacerHorizontal extends SizedBox {
  const SpacerHorizontal.min({super.key})
      : super(width: ThemeConstants.minPadding);
  const SpacerHorizontal.half({super.key})
      : super(width: ThemeConstants.halfPadding);
  const SpacerHorizontal.normal({super.key})
      : super(width: ThemeConstants.padding);
  const SpacerHorizontal.double({super.key})
      : super(width: ThemeConstants.doublePadding);
}
