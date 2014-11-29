//
//  ViewController.m
//  AnimationRecipesDemo
//
//  Created by Alankar Misra on 11/9/14.
//  Copyright (c) 2014 Alankar Misra. All rights reserved.
//

#import "ViewController.h"
#import "AnimationRecipes.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *prop;
@end

@implementation ViewController {
    NSArray *_fx;
    __weak IBOutlet UIPickerView *_effectPicker;
    __weak IBOutlet UIImageView *_prop;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _effectPicker.dataSource = self;
    _effectPicker.delegate = self;
        
    _fx = [[NSArray alloc] initWithObjects:
           @"Select an effect",
           @"Pulse",
           @"Rubber Band",
           @"Flash",           
           @"Shake",
           @"Tada",
           @"Wobble",
           @"Swing",
           @"Bounce In",
           @"Bounce Out",
           @"Fade In",
           @"Fade In Up",
           @"Fade In Up Big",
           @"Fade In Down",
           @"Fade In Down Big",
           @"Fade In Left",
           @"Fade In Left Big",
           @"Fade In Right",
           @"Fade In Right Big",
           @"Fade Out",
           @"Fade Out Up",
           @"Fade Out Up Big",
           @"Fade Out Down",
           @"Fade Out Down Big",
           @"Fade Out Left",
           @"Fade Out Left Big",
           @"Fade Out Right",
           @"Fade Out Right Big",
           @"Zoom In",
           nil];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _fx.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    return [_fx objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    if(row > 0) { // Ignore the 'Select an effect option'
        CGRect frame = _prop.frame;
        NSString *fx = [_fx objectAtIndex:row];
        
        /*
         * All this mumbo-jumbo does is take a selection like 'Fade Out Right Big',
         * convert it into a selector like 'fadeOutRightBig' and call that selector
         * on the AnimationRecipe object. 
         */
        fx = [NSString stringWithFormat:@"%@:completion:",[[fx stringByReplacingOccurrencesOfString:@" " withString:@""] stringByReplacingCharactersInRange:NSMakeRange(0,1) withString:[[fx substringToIndex:1] lowercaseString]]];
        SEL selector = NSSelectorFromString(fx);
        IMP imp = [AnimationRecipes methodForSelector:selector];
        void (*func)(id, SEL, UIView *, void (^)(BOOL finished)) = (void *)imp;
        func(NSClassFromString(@"AnimationRecipes"), selector, self.prop, ^(BOOL finished) {
            _prop.alpha = 1.0;
            _prop.transform = CGAffineTransformMakeScale(1.0, 1.0);
            _prop.frame = frame;
        });
        
    }
}



@end
