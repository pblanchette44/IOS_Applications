//
//  voice.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-26.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface voice : NSObject


@property NSNumber *length;
@property NSNumber *stepSize;
@property NSNumber *stepCount;

-(void)baseInit;
-(void)updateStepCount;

@end
