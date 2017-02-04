//
//  octaveHarmonicView.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-02-04.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "octaveHarmonicView.h"

@implementation octaveHarmonicView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        self.allOctave = [NSMutableArray arrayWithCapacity:4];
        
        for(int i =0;i<4;i++)
        {
        verticalSlider *octaveTemp = [[verticalSlider alloc] initWithFrame:CGRectMake(i*20,0,30, self.bounds.size.height)];
        [self.allOctave addObject:octaveTemp];
        [self addSubview:octaveTemp];
        }
        
        self.scaleSelector = [[multiToggle alloc]initWithFrame:CGRectMake(self.bounds.size.width/2, 0, self.bounds.size.width/2, self.bounds.size.height)];
        [self addSubview:self.scaleSelector];
    }
    return self;
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
