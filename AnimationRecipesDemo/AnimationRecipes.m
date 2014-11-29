//
//  AnimationRecipes.m
//  AnimationRecipesDemo
//
//  Created by Alankar Misra on 11/9/14.
//  Copyright (c) 2014 Alankar Misra. All rights reserved.
//

// For z-rotations see
// http://stackoverflow.com/questions/9423892/how-to-rotate-a-flat-object-around-its-center-in-perspective-view

#define RADIANS_FROM_DEGREES(angle) ((angle) / 180.0 * M_PI)

#import "AnimationRecipes.h"

@implementation AnimationRecipes

#pragma mark Attention Seekers
+(void) bounce:(UIView *)view completion:(void (^)(BOOL finished))completion {
    CGFloat bounceHeight = 75;
    
    [UIView animateKeyframesWithDuration:0.5 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0 animations:^{
            view.transform = CGAffineTransformMakeTranslation(0, 0);
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            view.transform = CGAffineTransformMakeTranslation(0, -bounceHeight);
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1.0 animations:^{
            view.transform = CGAffineTransformMakeTranslation(0, 0);
        }];
    } completion:^(BOOL finished) {
        [UIView animateKeyframesWithDuration:0.25 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0 animations:^{
                view.transform = CGAffineTransformMakeTranslation(0, 0);
            }];
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
                view.transform = CGAffineTransformMakeTranslation(0, -bounceHeight/1.2);
            }];
            [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1.0 animations:^{
                view.transform = CGAffineTransformMakeTranslation(0, 0);
            }];
        } completion:^(BOOL finished) {
            [UIView animateKeyframesWithDuration:0.2 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
                [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0 animations:^{
                    view.transform = CGAffineTransformMakeTranslation(0, 0);
                }];
                [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
                    view.transform = CGAffineTransformMakeTranslation(0, -bounceHeight/2.5);
                }];
                [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1.0 animations:^{
                    view.transform = CGAffineTransformMakeTranslation(0, 0);
                }];
            } completion:completion];
        }];
    }];
}

+(void) flash:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse animations:^{
        [UIView setAnimationRepeatCount:2];
        view.alpha = 0;
    } completion:^(BOOL finished) {
        view.alpha = 1.0;
        completion(finished);
    }];
}

+(void) pulse:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAutoreverse animations:^{
        view.transform = CGAffineTransformMakeScale(1.1, 1.1);
    } completion:^(BOOL finished) {
        view.transform = CGAffineTransformMakeScale(1,1);
        completion(finished);
    }];
}

+(void) rubberBand:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [UIView animateKeyframesWithDuration:1.5 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0 animations:^{
            view.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.3 animations:^{
            view.transform = CGAffineTransformMakeScale(1.25, 0.75);
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.4 animations:^{
            view.transform = CGAffineTransformMakeScale(0.75, 1.25);
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            view.transform = CGAffineTransformMakeScale(1.15, 0.85);
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.65 animations:^{
            view.transform = CGAffineTransformMakeScale(.95, 1.05);
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.75 animations:^{
            view.transform = CGAffineTransformMakeScale(1.05, .95);
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1.0 animations:^{
            view.transform = CGAffineTransformMakeScale(1, 1);
        }];
    } completion:completion];
}

+(void) shake:(UIView *)view completion:(void (^)(BOOL finished))completion {
    view.transform = CGAffineTransformMakeTranslation(-30.0, 0);
    [UIView animateWithDuration:0.1 delay:0 options:UIViewAnimationOptionCurveLinear | UIViewAnimationOptionAutoreverse animations:^{
        [UIView setAnimationRepeatCount:3];
        view.transform = CGAffineTransformMakeTranslation(30.0, 0);
    } completion:^(BOOL finished) {
        view.transform = CGAffineTransformMakeTranslation(0,0);
        completion(finished);
    }];
}

+(void) tada:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [UIView animateKeyframesWithDuration:1.25 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeLinear animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.0, 1.0), CGAffineTransformMakeRotation(0)) ;
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.1 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0.9, 0.9), CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(-3)));
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.2 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0.9, 0.9), CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(-3)));
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.3 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.1, 1.1), CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(3)));
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.4 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.1, 1.1), CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(-3)));
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.5 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.1, 1.1), CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(3)));
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.6 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.1, 1.1), CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(-3)));
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.7 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.1, 1.1), CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(3)));
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.8 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.1, 1.1), CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(-3)));
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.9 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.1, 1.1), CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(3)));
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1.0 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1, 1), CGAffineTransformMakeRotation(0));
        }];
    } completion:completion];
}


+(void) swing:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self setAnchorPoint:CGPointMake(0.5, 0.0) forView:view];
    [UIView animateKeyframesWithDuration:1 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0 animations:^{
            view.transform = CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(0));
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.2 animations:^{
            view.transform = CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(15));
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.4 animations:^{
            view.transform = CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(-10));
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.6 animations:^{
            view.transform = CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(5));
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.8 animations:^{
            view.transform = CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(-5));
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1.0 animations:^{
            view.transform = CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(0));
        }];
    } completion:^(BOOL finished) {
        [self setAnchorPoint:CGPointMake(0.5, 0.5) forView:view];
        completion(finished);
    }];
}

+(void) wobble:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [UIView animateKeyframesWithDuration:1 delay:0 options:UIViewKeyframeAnimationOptionCalculationModeCubicPaced animations:^{
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(0.0, 0.0), CGAffineTransformMakeRotation(0)) ;
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.15 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(-0.25*view.frame.size.width, 0.0), CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(-10))) ;
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.3 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(0.2*view.frame.size.width, 0.0), CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(5))) ;
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.45 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(-0.15*view.frame.size.width, 0.0), CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(-5))) ;
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.6 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(0.10*view.frame.size.width, 0.0), CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(3))) ;
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:0.75 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(-0.05*view.frame.size.width, 0.0), CGAffineTransformMakeRotation(RADIANS_FROM_DEGREES(-1))) ;
        }];
        [UIView addKeyframeWithRelativeStartTime:0 relativeDuration:1.0 animations:^{
            view.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(0.0, 0.0), CGAffineTransformMakeRotation(0)) ;
        }];
    } completion:completion];
}

#pragma mark Bouncing Entrances

+(void) bounceIn:(UIView *)view completion:(void (^)(BOOL finished))completion {
    view.transform = CGAffineTransformMakeScale(0, 0);
    
    [UIView animateWithDuration:0.75 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        view.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:completion];
}

+(void) bounceInDown:(UIView *)view completion:(void (^)(BOOL finished))completion {
    
    [UIView animateWithDuration:0.75 delay:0 usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        view.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:completion];
}

+(void) toStageTop:(UIView *)view {
    view.transform = CGAffineTransformMakeTranslation(0, -view.frame.origin.y);
}

+(void) toStageTopOut:(UIView *)view {
    view.transform = CGAffineTransformMakeTranslation(0,-(view.frame.origin.y+view.frame.size.height));
}

#pragma mark Bouncing Exits

+(void) bounceOut:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveEaseInOut| UIViewAnimationOptionAutoreverse animations:^{
        view.transform = CGAffineTransformMakeScale(0.75, 0.75);
    } completion:^(BOOL finished) {
        view.transform = CGAffineTransformMakeScale(1.0, 1.0);
        [UIView animateWithDuration:0.35 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            view.transform = CGAffineTransformMakeScale(0.001, 0.001);
        } completion:^(BOOL finished) {
            view.transform = CGAffineTransformMakeScale(0, 0);
            completion(finished);
        }];
    }];
}


#pragma mark Fading Exits
+(void) fadeOut:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:0 dy:0 completion:completion invert:NO];
}

+(void) fadeOutDown:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:0 dy:(MIN(60,view.superview.frame.size.height - view.frame.origin.y)) completion:completion invert:NO];
}


+(void) fadeOutDownBig:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:0 dy:(view.superview.frame.size.height - view.frame.origin.y) completion:completion invert:NO];
}

+(void) fadeOutUp:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:0 dy:-(MIN(60,view.frame.origin.y+view.frame.size.height)) completion:completion invert:NO];
}


+(void) fadeOutUpBig:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:0 dy:-(view.frame.origin.y+view.frame.size.height) completion:completion invert:NO];
}

+(void) fadeOutLeft:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:-(MIN(60,view.frame.origin.x+view.frame.size.width)) dy:0 completion:completion invert:NO];
}


+(void) fadeOutLeftBig:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:(-(view.frame.origin.x+view.frame.size.width)) dy:0 completion:completion invert:NO];
}


+(void) fadeOutRight:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:(MIN(60,view.superview.frame.size.width - view.frame.origin.x)) dy:0 completion:completion invert:NO];
}


+(void) fadeOutRightBig:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:(view.superview.frame.size.width - view.frame.origin.x) dy:0 completion:completion invert:NO];
}

#pragma mark Fading Entrances
+(void) fadeIn:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:0 dy:0 completion:completion invert:YES];
}

+(void) fadeInUp:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:0 dy:(MIN(60,view.superview.frame.size.height - view.frame.origin.y)) completion:completion invert:YES];
}


+(void) fadeInUpBig:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:0 dy:(view.superview.frame.size.height - view.frame.origin.y) completion:completion invert:YES];
}

+(void) fadeInDown:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:0 dy:-(MIN(60,view.frame.origin.y+view.frame.size.height)) completion:completion invert:YES];
}


+(void) fadeInDownBig:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:0 dy:-(view.frame.origin.y+view.frame.size.height) completion:completion invert:YES];
}

+(void) fadeInLeft:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:-(MIN(60,view.frame.origin.x+view.frame.size.width)) dy:0 completion:completion invert:YES];
}


+(void) fadeInLeftBig:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:(-(view.frame.origin.x+view.frame.size.width)) dy:0 completion:completion invert:YES];
}


+(void) fadeInRight:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:(MIN(60,view.superview.frame.size.width - view.frame.origin.x)) dy:0 completion:completion invert:YES];
}


+(void) fadeInRightBig:(UIView *)view completion:(void (^)(BOOL finished))completion {
    [self fade:view fromAlpha:1.0 toAlpha:0.0 dx:(view.superview.frame.size.width - view.frame.origin.x) dy:0 completion:completion invert:YES];
}

# pragma mark Fading Generic
+(void)fade:(UIView *)view fromAlpha:(CGFloat)fromAlpha toAlpha:(CGFloat)toAlpha dx:(CGFloat)dx dy:(CGFloat)dy completion:(void (^)(BOOL finished))completion invert:(BOOL)invert {
    
    
    if(invert) {
        CGFloat tempAlpha = fromAlpha;
        fromAlpha = toAlpha;
        toAlpha = tempAlpha;
    }
    
    view.alpha = fromAlpha;
    
    if(invert) {
        view.transform = CGAffineTransformMakeTranslation(dx, dy);
    }
 
    [UIView animateWithDuration:0.75 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        if(invert) {
            view.transform = CGAffineTransformMakeTranslation(0, 0);
        } else {
            view.transform = CGAffineTransformMakeTranslation(dx, dy);
        }
         view.alpha = toAlpha;
    } completion:completion];
    
}

# pragma mark Rotating Entrances


# pragma mark Zoom Entrances

+(void)zoomIn:(UIView *)view completion:(void (^)(BOOL finished))completion {
    view.transform = CGAffineTransformMakeScale(0.0, 0.0);
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        view.transform = CGAffineTransformMakeScale(1.0, 1.0);
    } completion:^(BOOL finished) {
        completion(finished);
    }];
}

+(void)zoomInDown:(UIView *)view completion:(void (^)(BOOL finished))completion {
    view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(0, 0),  CGAffineTransformMakeTranslation(0.0, -view.frame.size.height*2));
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
        view.transform = CGAffineTransformConcat(CGAffineTransformMakeScale(1.0, 1.0),  CGAffineTransformMakeTranslation(0.0, 0.001));

    } completion:completion];
}


# pragma mark Zoom Exits

+(void)zoomOut:(UIView *)view completion:(void (^)(BOOL finished))completion {
    

}


# pragma mark Utility Functions
+(void)setAnchorPoint:(CGPoint)anchorPoint forView:(UIView *)view
{
    // http://stackoverflow.com/questions/1968017/changing-my-calayers-anchorpoint-moves-the-view
    CGPoint newPoint = CGPointMake(view.bounds.size.width * anchorPoint.x,
                                   view.bounds.size.height * anchorPoint.y);
    CGPoint oldPoint = CGPointMake(view.bounds.size.width * view.layer.anchorPoint.x,
                                   view.bounds.size.height * view.layer.anchorPoint.y);
    
    newPoint = CGPointApplyAffineTransform(newPoint, view.transform);
    oldPoint = CGPointApplyAffineTransform(oldPoint, view.transform);
    
    CGPoint position = view.layer.position;
    
    position.x -= oldPoint.x;
    position.x += newPoint.x;
    
    position.y -= oldPoint.y;
    position.y += newPoint.y;
    
    view.layer.position = position;
    view.layer.anchorPoint = anchorPoint;
}




@end
