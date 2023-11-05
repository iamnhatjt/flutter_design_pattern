a widget thta simplifies the syntax for deeply nested widget trees.

MyWidget(
child: AnotherWidget(
child: Again(
child: AndAgain(
child: Leaf(),
)
)
)
)

that's not very ideal
Nested(
children: [
MyWidget(),
anotherWidget(),
again(),
andAgain(),
]
child: Leaf(),
)

that alot more readable!.
