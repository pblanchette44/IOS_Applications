//
//  toggle.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-02-04.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "toggle.h"

@implementation toggle

- (id)initWithFrame:(CGRect)frame andTitle:(int)input
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self setOpaque:NO];
        self.title = [scaleTitleFactory getModeNameForValue:input];
        
        self.layer.borderColor = [UIColor blackColor].CGColor;
        self.layer.borderWidth = 3.0f;
        [self setNeedsDisplay];
    }
    return self;
}


- (void)drawRect:(CGRect)rect
{
    
    UIFont* font = [UIFont fontWithName:@"Arial" size:8];
    UIColor* textColor = [UIColor blackColor];
    NSDictionary* stringAttrs = @{ NSFontAttributeName : font, NSForegroundColorAttributeName: textColor };
    
    
    
    NSAttributedString* attrStr = [[NSAttributedString alloc]
                                   initWithString:self.title
                                   attributes:stringAttrs];
    [attrStr drawAtPoint:CGPointMake(self.bounds.size.width/2,self.bounds.size.height/2)];


}


@end
