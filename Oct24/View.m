//
//  View.m
//  Oct24
//
//  Created by Computerlab on 10/24/13.
//  Copyright (c) 2013 Elena Isoard. All rights reserved.
//

#import "View.h"
#import "LittleView.h"

@implementation View

- (id) initWithFrame: (CGRect) frame
{
    self = [super initWithFrame: frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor whiteColor];
        
        CGFloat w = 80;   //width in pixels of little view
		CGFloat h = 40;   //height in pixels of little view
		CGRect b = self.bounds;
        CGRect f = CGRectMake(
            b.origin.x + (b.size.width - w) / 2,
            b.origin.y + (b.size.height - h) / 2,
            w,
            h
            );
        
        littleView = [[LittleView alloc] initWithFrame: f];
        [self addSubview: littleView];
    }
    return self;
}

/*
- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
    if (touches.count > 0) {
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView: self];
        littleView.center = point;	//Move the littleView to a new location.
        
        //Can combine the above three statements to
        //littleView.center = [[touches anyObject] locationInView: self];
    }
} 
*/


- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	littleView.backgroundColor = [UIColor redColor];
}

- (void) touchesMoved: (NSSet *) touches withEvent: (UIEvent *) event {
	littleView.center = [[touches anyObject] locationInView: self];
}

- (void) touchesEnded: (NSSet *) touches withEvent: (UIEvent *) event {
	littleView.backgroundColor = [UIColor blueColor];
} 


/*
- (void) touchesBegan: (NSSet *) touches withEvent: (UIEvent *) event {
	if (touches.count > 0) {
        
		[UIView animateWithDuration: 2.0
                              delay: 0.0
                            options: UIViewAnimationOptionCurveEaseInOut
                         animations: ^{
                             //[UIView setAnimationRepeatCount: 2];
                             //This block describes what the animation should do.
                             littleView.center = [[touches anyObject] locationInView: self];
                         }
                         completion: NULL
         ];
	}
} 
*/


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */

@end
