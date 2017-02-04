//
//  customSlider.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-31.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "customSlider.h"

@implementation customSlider
{
    UIImageView *handle;
}

- (id)initWithFrame:(CGRect)frame andTitle:(NSString*)title
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.title = [NSString stringWithString:title];
        [self customInit];
        
        self.frame = frame;
        [self setBackgroundColor:[UIColor whiteColor]];
        [self setNeedsDisplay];
        
        handle = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"sliderHandle.png"]];
        handle.frame = CGRectMake(self.frame.size.width/2, self.frame.size.height/4-15, 35, 35);
        [self addSubview:handle];
        
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
    handle.frame = CGRectMake(position,self.frame.size.height/4-15 ,35, 35);
    [self setNeedsDisplay];
}

-(void)customInit{
    self.value = [NSNumber numberWithInt:90];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, [[UIColor blackColor] CGColor]);
    CGContextSetLineWidth(context, 2.0f);
    CGContextMoveToPoint(context, 10,self.frame.size.height/4);
    CGContextAddLineToPoint(context, self.frame.size.width-10, self.frame.size.height/4);
    
    CGContextStrokePath(context);
    CGContextSetLineWidth(context, 0.4f);
    CGRect meter = CGRectMake(10, self.frame.size.height/4 +5, handle.frame.origin.x-handle.frame.size.width/2, 12);
    
    CGContextAddRect(context, meter);
     CGContextStrokePath(context);
    
    UIFont* font = [UIFont fontWithName:@"Arial" size:8];
    UIColor* textColor = [UIColor blackColor];
    NSDictionary* stringAttrs = @{ NSFontAttributeName : font, NSForegroundColorAttributeName: textColor };
    
    NSAttributedString* attrStr = [[NSAttributedString alloc]
                                   initWithString:self.title
                                   attributes:stringAttrs];
    [attrStr drawAtPoint:CGPointMake(10,0)];
    
}


@end
