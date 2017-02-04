//
//  multiToggle.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-02-04.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "multiToggle.h"

@implementation multiToggle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.frame = frame;
        [self setBackgroundColor:[UIColor whiteColor]];
        for(int i=0;i<3;i++)
        {
            for(int j=0; j<3;j++)
            {
                toggle *temp = [[toggle alloc]initWithFrame:CGRectMake(i*self.bounds.size.width/3, j*self.bounds.size.height/3, self.bounds.size.width/3, self.bounds.size.height/3) andTitle:((j*3)+i)];
                [self addSubview:temp];
            }
        }
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
