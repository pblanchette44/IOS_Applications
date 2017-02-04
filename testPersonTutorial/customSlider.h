//
//  customSlider.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-31.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customSlider : UIView

@property NSString *title;
@property NSNumber *value;


-(id)initWithFrame:(CGRect)frame andTitle:(NSString *)title;

@end
