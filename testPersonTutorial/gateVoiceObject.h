//
//  gateVoiceObject.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-29.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface gateVoiceObject : NSObject

@property NSMutableArray *gateList;
@property int direction;
@property int gateDuration;
@property int sequenceLength;



-(id)initWithContent;
-(void)toggleStep:(int)step;



@end
