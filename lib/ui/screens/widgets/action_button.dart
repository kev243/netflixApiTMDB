import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color bgColor;
  final Color color;
  const ActionButton({
    Key? key,
    required this.label,
    required this.icon,
    required this.bgColor,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(4), color: bgColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: color,
          ),
          SizedBox(width: 5),
          Text(label,
              style: GoogleFonts.poppins(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              )),
             
        ],
      ),
    );
  }
}
