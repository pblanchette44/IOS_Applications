//
//  voiceGateMultiTouch.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-29.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "voiceGateMultiTouch.h"

@implementation voiceGateMultiTouch
{
    CGPoint touchPositionStorage;

}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}



- (void)drawRect:(CGRect)rect
{
    CGVector tempVec = CGVectorMake(self.bounds.size.width/8, self.bounds.size.height);
    
    
    CGContextSetStrokeColorWithColor(UIGraphicsGetCurrentContext(), [[UIColor blackColor] CGColor]);
    CGContextSetLineWidth(UIGraphicsGetCurrentContext(), 2.0f);
    
    for(int i =0; i < 8; i++)
    {
        
        CGRect temp = CGRectMake(tempVec.dx*i, 0, tempVec.dx, tempVec.dy);
        
        CGContextSetFillColorWithColor(UIGraphicsGetCurrentContext(),
                                [[self getColorForStep:i
                                              forVoice:[self.voiceId intValue]] CGColor]);
        
        CGContextAddRect(UIGraphicsGetCurrentContext(),temp);
        CGContextFillRect(UIGraphicsGetCurrentContext(), temp);
        CGContextStrokeRect(UIGraphicsGetCurrentContext(), temp);
    }
    
    CGContextStrokePath(UIGraphicsGetCurrentContext());
}



-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    CGPoint touchPosition = CGPointMake([[touches anyObject] locationInView:self].x,
                                        [[touches anyObject] locationInView:self].y);
    
    touchPositionStorage = CGPointMake(
                                [self translateTouchPositionToStepValue:touchPosition].dx,
                                [self translateTouchPositionToStepValue:touchPosition].dy);
    
    [self toggleStepButton:[self translateTouchPositionToStepValue:touchPosition].dx];
    
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    CGPoint touchPosition = CGPointMake([[touches anyObject] locationInView:self].x,
                                        [[touches anyObject] locationInView:self].y);
    
    if([self touchIsWithinBounds:touchPosition] && [self translateTouchPositionToStepValue:touchPosition].dx != touchPositionStorage.x)
    {
        [self toggleStepButton:[self translateTouchPositionToStepValue:touchPosition].dx];
        touchPositionStorage = CGPointMake(
                            [self translateTouchPositionToStepValue:touchPosition].dx,
                            [self translateTouchPositionToStepValue:touchPosition].dy);
        [self setNeedsDisplay];
    }
}


-(void)toggleStepButton:(int)step
{
    [self.delegate toggleToVoices:step atVoice:[self.voiceId intValue]];
}

-(UIColor*)getColorForStep:(int)step forVoice:(int)voiceIndex{
    
    if([self.delegate sendToVoices:step atVoice:voiceIndex] == 1)
    {
        return [UIColor whiteColor];
    } else {
        return [UIColor blueColor];
    }
}


-(CGVector) translateTouchPositionToStepValue:(CGPoint)touchPosition{
    
    
    int xTouch =touchPosition.x/self.bounds.size.width*8;
    int yTouch = touchPosition.y/self.bounds.size.height*8;
    
    return CGVectorMake(xTouch,
                        yTouch);;
}



-(bool) touchIsWithinBounds:(CGPoint)touchPosition{
    
    if(touchPosition.y < self.bounds.size.height
       && touchPosition.y > 0)
    {
        return true;
    }
    
    return false;
}


@end
