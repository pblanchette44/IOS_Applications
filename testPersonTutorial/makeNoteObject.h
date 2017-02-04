//
//  makeNoteObject.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-30.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "midibus.h"
#import "MidiBusClient.h"

@interface makeNoteObject : NSObject


-(MIDIBUS_MIDI_EVENT *)makeMidiEventforPitch:(int)pitch atVoice:(int)voiceIndex;

@end
