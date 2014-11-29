//
//  AnimationRecipes.h
//  AnimationRecipesDemo
//
//  Created by Alankar Misra on 11/9/14.
//  Copyright (c) 2014 Alankar Misra. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef enum  {
    TransformDeltaIn,
    TransformDeltaOut
} TransformDeltaDirection;

@interface AnimationRecipes : NSObject

// +(void) bounce:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) flash:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) pulse:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) rubberBand:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) wobble:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) swing:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) bounceIn:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) bounceOut:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeIn:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeOut:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) zoomIn:(UIView *)view completion:(void (^)(BOOL finished))completion;
//+(void) zoomOut:(UIView *)view completion:(void (^)(BOOL finished))completion;
#pragma mark Fading Entrances
+(void) fadeInUp:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeInUpBig:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeInDown:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeInDownBig:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeInLeft:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeInLeftBig:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeInRight:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeInRightBig:(UIView *)view completion:(void (^)(BOOL finished))completion;
#pragma mark Fading Exits
+(void) fadeOutUp:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeOutUpBig:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeOutDown:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeOutDownBig:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeOutLeft:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeOutLeftBig:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeOutRight:(UIView *)view completion:(void (^)(BOOL finished))completion;
+(void) fadeOutRightBig:(UIView *)view completion:(void (^)(BOOL finished))completion;

+(void)fade:(UIView *)view fromAlpha:(CGFloat)fromAlpha toAlpha:(CGFloat)toAlpha dx:(CGFloat)dx dy:(CGFloat)dy completion:(void (^)(BOOL finished))completion invert:(BOOL)invert;
// +(void) bounceInUp:(UIView *)view completion:(void (^)(BOOL finished))completion;

@end
