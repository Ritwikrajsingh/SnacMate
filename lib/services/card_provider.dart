import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


enum CardStatus{like, dislike, superLike}

class CardProvider extends ChangeNotifier{
  bool _isDragging = false;
  Offset _position = Offset.zero;
  Size _screenSize = Size.zero;
  double _angle = 0;
  List<User> _userList = [];

  bool get isDragging => _isDragging;
  Offset get position => _position;
  double get angle => _angle;

  CardProvider() {
    getUsers();
  }

  void setScreenSize(Size screenSize) => _screenSize =  screenSize;

  void startPosition(DragStartDetails details){
    _isDragging = true;
    notifyListeners();

  }
  void updatePosition(DragUpdateDetails details) {
    _position += details.delta;

    final x = _position.dx;
    _angle = 45 * x / _screenSize.width;

    notifyListeners();
  }
  void endPosition(){
    _isDragging = false;
    notifyListeners();

    final status = getStatus();
    

    if (status != null) {
      Fluttertoast.cancel();
      Fluttertoast.showToast(
        msg: status.toString().split(".").last.toUpperCase(),
        fontSize: 10
      );
    }

    switch (status){
      case CardStatus.like:
        like();
        break;
      case CardStatus.dislike:
        dislike();
        break;
      case CardStatus.superLike:
        superLike();
        break;
      default:
        resetPosition();
    }
  }

  void like(){
    _angle = 20;
    _position += Offset(2 * _screenSize.width, 0);
    _nextCard();

    notifyListeners();
  }

   void dislike(){
    _angle = 20;
    _position -= Offset(2 * _screenSize.width, 0);
    _nextCard();

    notifyListeners();
  }

   void superLike(){
    _angle = 0;
    _position -= Offset(0, _screenSize.height);
    _nextCard();

    notifyListeners();
  }

  Future _nextCard() async {
    if (_userList.isEmpty) return;

    await Future.delayed(const Duration(milliseconds: 200));
    _userList.removeLast();
    resetPosition();
  }

  void resetPosition(){
    _isDragging = false;
    _position = Offset.zero;
    _angle = 0;

    notifyListeners();
  }

  CardStatus? getStatus(){
    final x = _position.dx;
    final y = _position.dy;
    final forceSuperLike = x.abs() < 20;

    const delta = 100;

    if (x >= delta){
      return CardStatus.like;
    }else if (x <= -delta){
      return CardStatus.dislike;
    }else if (y <= -delta/2 && forceSuperLike){
      return CardStatus.superLike;
    }
  }

  void getUsers(){
    _userList = List<User>.filled(5, FirebaseAuth.instance.currentUser!, growable: true);
  }
}