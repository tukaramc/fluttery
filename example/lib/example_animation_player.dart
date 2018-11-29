import 'package:flutter/material.dart';
import 'package:fluttery/animations.dart';

class AnimationPlayerExampleScreen extends StatefulWidget {
  @override
  _AnimationPlayerExampleState createState() => new _AnimationPlayerExampleState();
}

class _AnimationPlayerExampleState extends State<AnimationPlayerExampleScreen> {


  double _currentPhasePosition = 0.0;

  PlayableAnimation _playableAnimation;
  // A PhaseController is only necessary if the animation that you're
  // controlling also responds to user input or some other outside force.
  PhaseController _phaseController;

  @override
  void initState() {
    super.initState();

    // This is a hard-coded PlayableAnimation which is comprised of a series
    // of "phases" that can be played forward and backward by an
    // AnimationPlayer.
    _playableAnimation = new PlayableAnimation(
      phases: [
        new Phase.uniform(
            uniformTransition: (newAnimationPercent) {
              setState(() => _currentPhasePosition = newAnimationPercent);
            }
        ),
        new Phase.bidirectional(
            forward: (forwardPercent) {
              setState(() => _currentPhasePosition = 1.0 + forwardPercent);
            },
            reverse: (reversePercent) {
              double uniformPercent = 1.0 - reversePercent;
              setState(() => _currentPhasePosition = 1.0 + uniformPercent);
            }
        ),
        new Phase.uniform(
          uniformTransition: (newAnimationPercent) {
            setState(() => _currentPhasePosition = 2.0 + newAnimationPercent);
          },
        ),
      ],
    );

    _phaseController = new PhaseController(
        phaseCount: _playableAnimation.phases.length
    );
  }

  // Increments or decrements the active phase when the user taps. This is
  // an example of how you can use the AnimationPlayer while simultaneously
  // supporting user interaction with your animation.
  _changePercentDueToUserTap() {
    int prevActivePhase = _phaseController.activePhase;
    double prevPhaseProgress = _phaseController.phaseProgress;

    if (_phaseController.playingForward) {
      _phaseController.nextPhase();

      if (prevActivePhase == _phaseController.activePhase
          && prevPhaseProgress == _phaseController.phaseProgress) {
        _phaseController.prevPhase();
      }
    } else {
      _phaseController.prevPhase();

      if (prevActivePhase == _phaseController.activePhase
          && prevPhaseProgress == _phaseController.phaseProgress) {
        _phaseController.nextPhase();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: [
        new Center(
          child: new InkWell(
            onTap: _changePercentDueToUserTap,
            child: new Text(
              '${_currentPhasePosition.toStringAsFixed(2)}',
              textAlign: TextAlign.center,
              style: new TextStyle(
                fontSize: 150.0,
                color: Colors.black,
              ),
            ),
          )
        ),
        new Column(
          children: [
            new Padding(
              padding: const EdgeInsets.all(16.0),
              child: new Text(
                'Use the controls at the bottom of the screen to play each animation phase forward and backward at your desired speed.\n\nTap on the center text to manually change the phase.',
                textAlign: TextAlign.center,
                style: new TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),

            new Expanded(child: new Container()),

            new AnimationPlayer(
              playableAnimation: _playableAnimation,
              phaseController: _phaseController,
            ),
          ],
        )
      ],
    );
  }
}
