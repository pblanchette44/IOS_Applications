//
//  verticalSlider.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-02-04.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "verticalSlider.h"

@implementation verticalSlider
{
    
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        
        [self setBackgroundColor:[UIColor whiteColor]];
        
        UIImageView *sliderHandle = [[UIImageView alloc] initWithFrame:CGRectMake(self.bounds.size.width/4, 10, self.bounds.size.width/2, 20)];
        [sliderHandle setImage:[UIImage imageNamed:@"sliderTransparent.png"]];
        self.handleIcon = sliderHandle;
        
        [self addSubview:sliderHandle];

        [self setNeedsDisplay];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
    
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextSetLineWidth(context, 0.8f);
    CGContextMoveToPoint(context, self.bounds.size.width/2,10);
    CGContextAddLineToPoint(context, self.bounds.size.width/2, self.bounds.size.height-10);
    CGContextStrokePath(context);
}


@end
