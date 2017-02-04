//
//  globalView.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-23.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "controlView.h"
#import "octaveHarmonicView.h"

@interface globalView : UIView

@property octaveHarmonicView *octaver;
@property controlView *control;

@end
