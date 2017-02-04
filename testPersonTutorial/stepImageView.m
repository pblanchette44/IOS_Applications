//
//  stepImageView.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-31.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "stepImageView.h"

@implementation stepImageView
{
    int state;
    UIImageView *display;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        state = 0;
        display = [[UIImageView alloc]initWithImage:
                   [UIImage imageNamed:[self getImageNameForState]]];
        display.frame = self.bounds;
        [self addSubview:display];
            }
    return self;
}

-(void)toggleColor{

    state = (state+1)%2;
    [display setImage:[UIImage imageNamed:[self getImageNameForState]]];
    [self setNeedsDisplay];
}

-(NSString *)getImageNameForState
{
    if(state == 1)
    {
        return [NSString stringWithFormat:@"buttonTickedSequencer.png"];
    }
    return [NSString stringWithFormat:@"ButtonUntickedSequencer.png"];
}



/*
- (void)drawRect:(CGRect)rect
{
    
}
*/

@end
