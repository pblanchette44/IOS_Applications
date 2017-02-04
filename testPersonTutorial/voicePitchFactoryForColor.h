//
//  voicePitchFactoryForColor.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-29.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "voicePitch.h"


@interface voicePitchFactoryForColor : NSObject


+(voicePitch *)makeVoicePitchForColorIndex:(int)index;

@end
