//
//  controlView.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-02-02.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "controlView.h"

@implementation controlView

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
    
    [self addSubview:[[directionView alloc]initWithFrame:CGRectMake(0, 0, 40, 40) ]];
    [self addSubview:[[tempoSliderView alloc] initWithFrame:CGRectMake(50, 0, self.bounds.size.width, 40)]];
    self.config = [[UIImageView alloc]initWithFrame:CGRectMake(self.bounds.size.width-60,0,40,40)];
    [self.config setImage:[UIImage imageNamed:@"config.png"]];
    
    self.config.contentMode = UIViewContentModeScaleAspectFit;
    [self addSubview:self.config];
    
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
