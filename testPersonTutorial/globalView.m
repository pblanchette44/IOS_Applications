//
//  globalView.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-23.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "globalView.h"

@implementation globalView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.bounds = frame;
        [self customInit];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    if(self){
        [self customInit];
    }
    return self;
}


-(void)customInit{
    
    
    self.control = [[controlView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width,self.bounds.size.height/4)];
    
    [self addSubview:self.control];
    
    
    self.octaver =[[octaveHarmonicView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height/4, self.bounds.size.width, self.frame.size.height/4*3)];
    //[self.octaver setBackgroundColor:[UIColor blackColor]];
    [self addSubview:self.octaver];
    
}


/*
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
