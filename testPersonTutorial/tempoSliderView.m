//
//  tempoSliderView.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-02-02.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "tempoSliderView.h"

@implementation tempoSliderView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bounds = frame;
        [self setBackgroundColor:[UIColor whiteColor]];
        
    
        UIImageView *sliderHandle = [[UIImageView alloc] initWithFrame:CGRectMake(self.frame.origin.x, 10, 20, 20)];
        [sliderHandle setImage:[UIImage imageNamed:@"sliderTransparent.png"]];
        self.handleIcon = sliderHandle;
        
        [self addSubview:sliderHandle];
        
        [self setNeedsDisplay];
        
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self){
        
        [self setNeedsDisplay];
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    //scale the position of the touch and adjust display
    [self moveSliderAtPosition:[[touches anyObject] locationInView:self].x];
    
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    [self moveSliderAtPosition:[[touches anyObject] locationInView:self].x];
}

-(void)moveSliderAtPosition:(int)position{
    self.handleIcon.frame = CGRectMake(position,10 ,20, 20);
    [self setNeedsDisplay];
}


- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextSetLineWidth(context, 0.8f);
    CGContextMoveToPoint(context, 10,self.bounds.size.height/2);
    CGContextAddLineToPoint(context, self.bounds.size.width-70, self.bounds.size.height/2);
     CGContextStrokePath(context);
    
    UIFont* font = [UIFont fontWithName:@"Arial" size:8];
    UIColor* textColor = [UIColor blackColor];
    NSDictionary* stringAttrs = @{ NSFontAttributeName : font, NSForegroundColorAttributeName: textColor };
    
    NSAttributedString* attrStr = [[NSAttributedString alloc]
                                   initWithString:@"120"
                                   attributes:stringAttrs];
    [attrStr drawAtPoint:CGPointMake(self.frame.origin.x,0)];

}
 


@end
