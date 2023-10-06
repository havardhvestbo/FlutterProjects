// Importing the necessary Flutter material design library
import 'package:flutter/material.dart';

// A stateless widget to represent a bar in a chart
class ChartBar extends StatelessWidget {
  // Constructor for the ChartBar widget
  const ChartBar({
    super.key, // Passing the key to the superclass
    required this.fill, // The fill factor for the bar
  });

  // The fill factor for the bar, a value between 0 and 1
  final double fill;

  // The build method to describe the part of the user interface represented by this widget
  @override
  Widget build(BuildContext context) {
    // Determine if the current theme is dark mode
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    // Return the widget structure
    return Expanded(
      // Make the bar take the available space
      child: Padding(
        // Add horizontal padding to the bar
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: FractionallySizedBox(
          // Size the height of the bar based on the fill factor
          heightFactor: fill,
          child: DecoratedBox(
            // Decorate the bar
            decoration: BoxDecoration(
              shape: BoxShape.rectangle, // Rectangle shape for the bar
              // Rounded corners at the top of the bar
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              // Conditional coloring based on the theme mode
              color: isDarkMode
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary.withOpacity(0.65),
            ),
          ),
        ),
      ),
    );
  }
}
