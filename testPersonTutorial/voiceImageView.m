//
//  voiceImageView.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-31.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "voiceImageView.h"

@implementation voiceImageView
{
    int touchPositionStorage;
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self customInit];
        
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        [self customInit];
    }
    return self;

}



-(void)customInit{
    
    self.allStep = [NSMutableArray arrayWithCapacity:8];
    
    for(int i =0; i < 8;i++)
    {
        UIView *tempStepImageView = [[stepImageView alloc]initWithFrame:CGRectMake(i*self.frame.size.width/8, 0, 25, self.bounds.size.height)];
        
        tempStepImageView.backgroundColor = [UIColor redColor];
        [self addSubview:tempStepImageView];
        [self.allStep addObject:tempStepImageView];
    }
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    touchPositionStorage =[self translatePointToIndex:[[touches anyObject] locationInView:self]];
    [self toggleImageAtIndex:[self translatePointToIndex:[[touches anyObject] locationInView:self]]];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if(touchPositionStorage != [self translatePointToIndex:[[touches anyObject] locationInView:self]])
    {
        touchPositionStorage =[self translatePointToIndex:[[touches anyObject] locationInView:self]];
        [self toggleImageAtIndex:[self translatePointToIndex:[[touches anyObject] locationInView:self]]];
    }
    
}

-(int)translatePointToIndex:(CGPoint)input{
    return input.x/self.bounds.size.width*8;
}

-(void)toggleImageAtIndex:(int)input
{
    [[self.allStep objectAtIndex:input] toggleColor];
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
