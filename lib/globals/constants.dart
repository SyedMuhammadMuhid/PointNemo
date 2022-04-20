


import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';

const double soundVolume = 0.1;

ParticleOptions particleOptions = ParticleOptions(
  image: Image.asset('assets/images/Rectangle3818.png'),
  spawnOpacity: 0.0,
  opacityChangeRate: 0.25,
  minOpacity: 0.45,
  maxOpacity: 0.75,
  spawnMinSpeed: 5.0,
  spawnMaxSpeed: 10.0,
  spawnMinRadius: 7.0,
  spawnMaxRadius: 15.0,
  particleCount: 15,
);

var particlePaint = Paint()
  ..style = PaintingStyle.fill
  ..strokeWidth = 1.0;