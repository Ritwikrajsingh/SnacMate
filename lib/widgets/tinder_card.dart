import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:snacmate/services/card_provider.dart';
class TinderCard extends StatefulWidget {
  final User user;
  final bool isFront;
  const TinderCard({ Key? key , required this.user, required this.isFront}) : super(key: key);

  @override
  _TinderCardState createState() => _TinderCardState();
}

class _TinderCardState extends State<TinderCard> {

  @override
  void initState(){
    super.initState();

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      final size = MediaQuery.of(context).size;

      final provider = Provider.of<CardProvider>(context, listen: false);
      provider.setScreenSize(size);
    });
  }

  @override
  Widget build(BuildContext context) => SizedBox.expand(
    child: widget.isFront ? buildFrontCard() : buildCard(),
  );

  Widget buildFrontCard() => GestureDetector(
    child: LayoutBuilder(
      builder: (context, constraints) {
        final provider = Provider.of<CardProvider>(context,listen: true);
        final position = provider.position;
        final milliseconds = provider.isDragging ? 0 : 400;

        final center = constraints.smallest.center(Offset.zero);
        final angle = provider.angle * pi / 100;
        final rotatedMatrix = Matrix4.identity()
        ..translate(center.dx, center.dy)
        ..rotateZ(angle)
        ..translate(-center.dx, -center.dy);

        return AnimatedContainer(
          curve: Curves.easeInOut,
          duration: Duration(milliseconds: milliseconds),
          transform: rotatedMatrix
            ..translate(position.dx, position.dy),
          child: buildCard(),
        );
      }
      ),
    onPanStart: (details) {
      final provider = Provider.of<CardProvider>(context, listen: false);

      provider.startPosition(details);
    },
    onPanUpdate: (details) {
      final provider = Provider.of<CardProvider>(context, listen: false);

      provider.updatePosition(details);
    },
    onPanEnd: (details) {
      final provider = Provider.of<CardProvider>(context, listen: false);

      provider.endPosition( );
    },
  );



  Widget buildCard() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.user.photoURL!),
            fit: BoxFit.cover,
            //alignment: Alignment(-0.3, 0),
          )
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.transparent, Colors.black],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.7,1]
            )
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Spacer(),
                buildInfoText(),
                buildStatus()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildInfoText() => Row(
    children: [
      Text(
        widget.user.displayName!,
        style: const TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),
      ),
      const SizedBox(width: 10,),
      const Text(
        "14",
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
        ),
      ),
    ],
  );

  Widget buildStatus() => Row(
    children: [
      Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.green,
        ),
        width: 10,
        height: 10,
      ),
      const SizedBox(width: 8,),
      const Text(
        "Active",
        style: TextStyle(fontSize: 16, color: Colors.white),
      )
    ],
  );
}