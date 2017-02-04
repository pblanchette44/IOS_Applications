//
//  voiceTopView.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-31.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "voiceTopView.h"

@implementation voiceTopView
{

    
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

-(id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        
        //init the directionButton
        directionView *direction = [[directionView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width/9-5, self.bounds.size.height/2)];
                [self addSubview:direction];
        //init the voiceButton
        voiceImageView *stepView = [[voiceImageView alloc]initWithFrame:CGRectMake(self.frame.size.width/9+5, 0, (self.frame.size.width/9)*8, self.bounds.size.height/2)];
        [self addSubview:stepView];
        
        //init the two sliders
        customSlider *duration = [[customSlider alloc]initWithFrame:CGRectMake(0, self.bounds.size.height/2, self.bounds.size.width/2, self.bounds.size.height) andTitle:[NSString stringWithFormat:@"duration"]];
        [self addSubview:duration];
        
        customSlider *velocity = [[customSlider alloc]initWithFrame:CGRectMake(self.bounds.size.width/2, self.bounds.size.height/2, self.bounds.size.width/2, self.bounds.size.height)andTitle:[NSString stringWithFormat:@"velocity"]];
        
        
        
        [self addSubview:velocity];
        
        [self setBackgroundColor: [UIColor grayColor]];
        
        

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
