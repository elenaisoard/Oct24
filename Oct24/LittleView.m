//
//  LittleView.m
//  Oct24
//
//  Created by Computerlab on 10/24/13.
//  Copyright (c) 2013 Elena Isoard. All rights reserved.
//

#import "LittleView.h"

@implementation LittleView

- (id) initWithFrame: (CGRect)frame
{
    self = [super initWithFrame: frame];
    if (self) {
        // Initialization code
        self.backgroundColor = [UIColor yellowColor];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void) drawRect: (CGRect) rect
{
    // Drawing code
    CGFloat w = self.bounds.size.width;
	CGFloat h = self.bounds.size.height;
	CGContextRef c = UIGraphicsGetCurrentContext();

    //White star has 5 vertices (points).
	CGPoint center = CGPointMake((6 + 3.5) * w / 13, h / 5); //of union jack
	CGFloat radius = h / 10;	//of circle that the 5 vertices touch
	CGContextBeginPath(c);

    for (int i = 0; i <= 10; i = i + 2) {
		CGFloat theta = 2 * M_PI * i / 5;
		CGFloat x = center.x + radius * cosf(theta);
		CGFloat y = center.y - radius * sinf(theta);
        
		if (i == 0) {
			CGContextMoveToPoint(c, x, y);
		} else {
			CGContextAddLineToPoint(c, x, y);
		}
	}
    
    //Works even though the star's outline intersects with itself.
	CGContextClosePath(c);
	CGContextSetRGBFillColor(c, 5.0, 80.0, 1.0, 1.0);
	CGContextFillPath(c);

    
    UIFont *font = [UIFont systemFontOfSize: 20];
    [@"elena" drawAtPoint: CGPointZero withFont: font];
}




@end