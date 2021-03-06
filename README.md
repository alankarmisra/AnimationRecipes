AnimationRecipes
================

A tiny library with simple animation recipes for iOS UIViews inspired by Animate.css. More recipes are being added and a feature to simplify chaining animations is being worked on (you can chain them even with the existing version with a slightly verbose syntax). Cocoapod installation support will be added soon (apologies for not having this in there to begin with).

Demo
====
Watch the [YouTube demo](http://youtu.be/pRgiX1MUHVo)

NOTE: To view the software demo, pick any of the iPad simulators.

How to use
==========
Copy AnimationRecipes.h and AnimationRecipes.m into your project. Use one of the several AnimationRecipe functions on your UI View like so. 

```Objective-C
[AnimationRecipes flash:myUIView completion:nil];
```

You might want to turn off AutoLayout if it gets in the way. 

Chaining Animations
===================
While I'm working on simpler ways to chain animations, for now you could do the following:

```Objective-C
    [AnimationRecipes fadeInLeft:myUIView completion:^(BOOL finished){
        [AnimationRecipes wobble:myUIView completion:^(BOOL finished){
            [AnimationRecipes fadeOutRight:myUIView completion:^(BOOL finished){
                // All done!
            }];
        }];
    }];
```
