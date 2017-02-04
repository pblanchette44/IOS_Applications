//
//  directionView.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-31.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "directionView.h"

@implementation directionView
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


-(void)toggleValue{
    state = (state+1)%2;
    
}

-(NSString *)getImageNameForState
{
    if(state == 1)
    {
        return [NSString stringWithFormat:@"playDirForward.png"];
    }
    return [NSString stringWithFormat:@"playDirBackward.png"];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
