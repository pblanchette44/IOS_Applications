//
//  testTouchPitch.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-20.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "testTouchPitch.h"

@implementation testTouchPitch
{
    int stepSize;
    CGPoint stepSizeVector;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self customInit];
    }
    return self;
}


-(void)customInit{

    self.layer.borderWidth = 3.0f;
    
    self.stepValues = [NSMutableArray arrayWithCapacity:8];
    self.stepString = [NSMutableArray arrayWithObjects:@"C",@"D",@"E",@"F",@"G",@"A",@"B",@"C", nil];
    
    for(int i =0; i < 8; i++)
    {
        [self.stepValues addObject:[NSNumber numberWithInt:5]];
    }
    
    self.allVoices = [NSMutableArray arrayWithCapacity:4];
    for(int i =0; i < 4;i++)
    {
        [self.allVoices addObject:[voicePitchFactoryForColor makeVoicePitchForColorIndex:i]];
    }

    stepSizeVector = CGPointMake(self.bounds.size.width/8, self.bounds.size.height/8);
}


-(int) getValue:(int)index{
    return [[self.stepValues objectAtIndex:index] intValue];
}


- (void)drawRect:(CGRect)rect
{

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    for(int i =0 ; i < 4;i++)
    {
        
        [self displayStepForVoice:i inContext:context];
        CGContextStrokePath(context);
    }
    
    for(int i =0; i < 8;i++)
    {
        [self displayPitchForStep:i inContext:context];
        [self displayPitchTextForStep:i];
    }
    
    CGContextStrokePath(context);
}





/*
    Drawing function for the Grid
*/
-(void)displayPitchForStep:(int)step inContext:(CGContextRef)context
{
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    
    CGRect rect = CGRectMake(
                             ((self.bounds.size.width/8)*step)+(self.bounds.size.width/8)/2-10,
                             (self.bounds.size.height/8)*[self.delegate querryPitchValueForStep:step],
                             10,
                             10
                             );
    CGContextAddRect(context, rect);
}


-(void)displayPitchTextForStep:(int)step{
    
    UIFont* font = [UIFont fontWithName:@"Arial" size:8];
    UIColor* textColor = [UIColor blackColor];
    NSDictionary* stringAttrs = @{ NSFontAttributeName : font, NSForegroundColorAttributeName: textColor };
    
    NSAttributedString* attrStr = [[NSAttributedString alloc]
                                   initWithString:[self.stepString objectAtIndex:[[self.stepValues objectAtIndex:step] intValue]]
                                   attributes:stringAttrs];
    
    //the actual position is here...
    [attrStr drawAtPoint:CGPointMake((self.bounds.size.width/8)*step+self.bounds.size.width/18, [[self.stepValues objectAtIndex:step] intValue]*self.bounds.size.height/8+self.bounds.size.height/20)];
}


/*
    Drawing functions for the voices
*/

-(void)displayStepForVoice:(int)voiceIndex inContext:(CGContextRef)context
{
    CGContextSetStrokeColorWithColor(context, [[[self.allVoices objectAtIndex:voiceIndex] stepColor] CGColor]);
    
    CGContextAddRect(context, [self makeDisplayRectforVoice:voiceIndex]);
}


-(CGRect) makeDisplayRectforVoice:(int)voiceIndex{
    
    CGPoint tempPosition = [self makeDisplayPointPosition:voiceIndex];
    return CGRectMake(tempPosition.x-10, tempPosition.y-10, 20+voiceIndex*3, 20+voiceIndex*3);
}

-(CGPoint) makeDisplayPointPosition:(int)voiceIndex{
    
    int  stepPosition = [[[self.allVoices objectAtIndex:voiceIndex] currentStep] intValue];
    
    int pitchValue = [[[[self.allVoices objectAtIndex:voiceIndex] PitchSequence] objectAtIndex:stepPosition] intValue];
    
    CGPoint tempPosition = CGPointMake(stepSizeVector.x*stepPosition+stepSizeVector.x/2,
                                       (self.bounds.size.height/8)*pitchValue+(self.bounds.size.height/8)/2);
    return tempPosition;
}

/*
 touches function and pitch modifications related functions;
 
 */

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPosition = CGPointMake([[touches anyObject] locationInView:self].x,
                                        [[touches anyObject] locationInView:self].y);

    [self updateAllVoices:touchPosition];
    [self updateStepSequence:touchPosition];
    
    [self setNeedsDisplay];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    CGPoint touchPosition = CGPointMake([[touches anyObject] locationInView:self].x,
                                        [[touches anyObject] locationInView:self].y);
    
    if([self touchIsWithinBounds:touchPosition])
    {
        [self updateAllVoices:touchPosition];
        [self updateStepSequence:touchPosition];
        [self setNeedsDisplay];
    }
}

-(void)updateAllVoices:(CGPoint)touchPosition{
    for(int i =0; i < self.allVoices.count;i++)
    {
        [[self.allVoices objectAtIndex:i] updatePitchSequence:[self translateTouchPositionToStepValue:touchPosition]];
    }
}

-(void)updateStepSequence:(CGPoint)touchPosition{

    CGVector temp = [self translateTouchPositionToStepValue:touchPosition];
    
    [self.delegate setPitchValueForStep:temp.dx forPitch:temp.dy];
    
}


-(CGVector) translateTouchPositionToStepValue:(CGPoint)touchPosition{
    
    return CGVectorMake(touchPosition.x/self.bounds.size.width*8,
                        touchPosition.y/self.bounds.size.height*8);;
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
