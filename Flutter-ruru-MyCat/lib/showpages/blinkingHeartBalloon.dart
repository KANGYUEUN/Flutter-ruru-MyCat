// import 'package:flutter/material.dart';
// import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';

// class BlinkingHeartBalloon extends StatefulWidget {
//   const BlinkingHeartBalloon({Key? key}) : super(key: key);

//   @override
//   _BlinkingHeartBalloonState createState() => _BlinkingHeartBalloonState();
// }

// class _BlinkingHeartBalloonState extends State<BlinkingHeartBalloon> {
//   late SequenceAnimation _sequenceAnimation;

//   @override
//   void initState() {
//     super.initState();

//     _sequenceAnimation = SequenceAnimationBuilder()
//       .addAnimatable(
//         animatable: Tween<double>(begin: 0.0, end: 1.0),
//         from: const Duration(milliseconds: 0),
//         to: const Duration(milliseconds: 500),
//         tag: 'opacity',
//       )
//       .addAnimatable(
//         animatable: Tween<double>(begin: 1.0, end: 0.0),
//         from: const Duration(milliseconds: 500),
//         to: const Duration(milliseconds: 1000),
//         tag: 'opacity',
//       )
//       .animate(AnimationController(vsync: this, duration: const Duration(milliseconds: 1000)))
//       .addAnimatable(
//         animatable: ConstantTween<double>(1.0),
//         from: const Duration(milliseconds: 0),
//         to: const Duration(milliseconds: 1000),
//         tag: 'scale',
//       )
//       .addAnimatable(
//         animatable: Tween<double>(begin: 1.0, end: 1.2),
//         from: const Duration(milliseconds: 1000),
//         to: const Duration(milliseconds: 1500),
//         tag: 'scale',
//       )
//       .addAnimatable(
//         animatable: Tween<double>(begin: 1.2, end: 1.0),
//         from: const Duration(milliseconds: 1500),
//         to: const Duration(milliseconds: 2000),
//         tag: 'scale',
//       )
//       .addAnimatable(
//         animatable: Tween<double>(begin: 1.0, end: 1.2),
//         from: const Duration(milliseconds: 2000),
//         to: const Duration(milliseconds: 2500),
//         tag: 'scale',
//       )
//       .addAnimatable(
//         animatable: Tween<double>(begin: 1.2, end: 1.0),
//         from: const Duration(milliseconds: 2500),
//         to: const Duration(milliseconds: 3000),
//         tag: 'scale',
//       )
//       .addAnimatable(
//         animatable: Tween<double>(begin: 1.0, end: 1.2),
//         from: const Duration(milliseconds: 3000),
//         to: const Duration(milliseconds: 3500),
//         tag: 'scale',
//       )
//       .addAnimatable(
//         animatable: Tween<double>(begin: 1.2, end: 1.0),
//         from: const Duration(milliseconds: 3500),
//         to: const Duration(milliseconds: 4000),
//         tag: 'scale',
//       )
//       .addAnimatable(
//         animatable: Tween<double>(begin: 1.0, end: 1.2),
//         from: const Duration(milliseconds: 4000),
//         to: const Duration(milliseconds: 4500),
//         tag: 'scale',
//       )
//       .addAnimatable(
//         animatable: Tween<double>(begin: 1.2, end: 1.0),
//         from: const Duration(milliseconds: 4500),
//         to: const Duration(milliseconds: 5000),
//         tag: 'scale',
//       )
//       .animate(AnimationController(vsync: this, duration: const Duration(milliseconds: 5000)))
//       .addAnimatable(
//         animatable: ConstantTween<double>(0.0),
//         from: const Duration(milliseconds: 0),
//         to: const Duration(milliseconds: 5000),
//         tag: 'offset',
//       )
//       .addAnimatable(
//         animatable: Tween<double>(begin: 0.0, end: 20.0),
//         from: const Duration(milliseconds: 0),
//         to: const Duration(milliseconds: 2500),
//         tag: 'offset',
//       )
//       .addAnimatable(
//         animatable: Tween<double>(begin: 20.0, end: 0.0),
//         from: const Duration(milliseconds: 2500),
//         to: const Duration(milliseconds: 5000),
//         tag: 'offset',
//       )
//       .build();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: _sequenceAnimation.controller!,
//       builder: (context, child) {
//         return Transform.scale(
//           scale: _sequenceAnimation['scale'].value,
         
