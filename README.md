# flutter_transparent_pointer

TransparentPointer is a widget that is invisible for its parent to hit testing,
but still allows its subtree to receive pointer events. This is useful to allow
a gesture detector that is visually behind another widget to still receive pointer
events, while at the same time allowing that other widget to receive those events
as well. 

## Example

In this example, a drag can be started anywhere in the widget, including on
top of the text button, even though the button is visually in front of the
background gesture detector. At the same time, the button is tappable.

```dart
class MyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onVerticalDragStart: (_) => print("Background drag started"),
        ),
        Positioned(
          top: 60,
          left: 60,
          height: 60,
          width: 60,
          child: TransparentPointer(
            child: TextButton(
              child: Text("Tap me"),
              onPressed: () => print("You tapped me"),
            ),
          ),
        ),
      ],
    );
  }
}
```