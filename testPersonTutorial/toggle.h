//
//  toggle.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-02-04.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "scaleTitleFactory.h"

@interface toggle : UIView

@property NSString *title;


-(id)initWithFrame:(CGRect)frame andTitle:(int)input;

@end
