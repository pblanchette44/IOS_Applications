//
//  pitchEngine.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-30.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "pitchView.h"
#import "gateListObject.h"
#import "MidiBusClient.h"

@interface pitchEngine : NSObject <pitchEngineDelegate,pitchPassingDelegate>

@property NSMutableArray *pitchList;

-(id)initWithPitch;

@end
