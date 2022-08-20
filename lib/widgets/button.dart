import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class CTAButton extends StatelessWidget {
  final String text;
  final EdgeInsets innerPadding;
  final EdgeInsets padding;
  final void Function()? onTap;
  final bool disabled;
  const CTAButton(
    this.text, {
    Key? key,
    this.innerPadding = const EdgeInsets.all(20),
    this.onTap,
    this.padding = const EdgeInsets.all(0),
    this.disabled = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(
      builder: (_, isKeyboardVisible) {
        double begin, end;
        if (isKeyboardVisible) {
          begin = 0;
          end = 1;
        } else {
          begin = 1;
          end = 0;
        }
        return TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: begin, end: end),
          duration: const Duration(milliseconds: 100),
          builder: (context, value, _) {
            return Padding(
              padding: EdgeInsets.only(
                top: padding.top * (1 - value),
                bottom: padding.bottom * (1 - value),
                left: padding.left * (1 - value),
                right: padding.right * (1 - value),
              ),
              child: Opacity(
                opacity: disabled ? 0.6 : 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20 * (1 - value)),
                  child: Material(
                    color: Colors.white,
                    child: InkWell(
                      onTap: disabled ? null : onTap,
                      child: Container(
                        padding: innerPadding,
                        child: Center(
                          child: Text(
                            text,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
