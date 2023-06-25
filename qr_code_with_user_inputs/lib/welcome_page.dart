import 'package:flutter/material.dart';

/*
class BigCard extends StatelessWidget {
  const BigCard({
    super.key,
  });

 
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
     
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
      
    );

    return Card(
      color: theme.colorScheme.primary,
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Flexible(
          child: Text(
            "Hello Folks!\n\n"
            "Check out my flutter app to generate QR codes for UPI payments",
          ),
        ),
      ),
    );
  }
}
*/

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Flexible(
              child: Text(
                "Hey Folks!\n\n"
                "Check out my flutter app to generate QR codes for UPI payments! ",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
