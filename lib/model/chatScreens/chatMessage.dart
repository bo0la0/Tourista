import 'package:flutter/cupertino.dart';
class ChatMessage {
  String avtarUrl;
  String messageContent;
  String messageType;
  ChatMessage({required this.avtarUrl,required this.messageContent, required this.messageType});}
List<ChatMessage> messages = [
  ChatMessage(avtarUrl: "assets/images/book.jpg", messageContent: "HelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHelloHello, ", messageType: "receiver"),
  ChatMessage(avtarUrl: "assets/images/kk.jpg", messageContent: "Hello, fine?, ", messageType: "sender"),
  ChatMessage(avtarUrl: "assets/images/kk.jpg",messageContent: "How have you been?", messageType: "receiver"),
  ChatMessage(avtarUrl: "assets/images/kk.jpg",messageContent: "Hey Krissy, ?", messageType: "sender"),
  ChatMessage(avtarUrl: "assets/images/book.jpg",messageContent: "ehhhh, doing OK.", messageType: "receiver"),
  ChatMessage(avtarUrl: "assets/images/kk.jpg",messageContent: "Is there any thing wrong?", messageType: "sender"),
  ChatMessage(avtarUrl: "assets/images/kk.jpg",messageContent: "Is there any thing wrong?", messageType: "sender"),];
