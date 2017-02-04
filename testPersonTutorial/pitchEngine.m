//
//  pitchEngine.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-30.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "pitchEngine.h"

@implementation pitchEngine


-(id)initWithPitch{
    
    self = [super init];
    
    if(self){
        self.pitchList = [NSMutableArray arrayWithCapacity:8];
        for(int i =0; i < 8;i++)
            {
                [self.pitchList addObject:[NSNumber numberWithInt:2]];
            }
    }
    return self;
}


#pragma Delegate methods
-(int) querryPitchValueForStep:(int)step {
    return [[self.pitchList objectAtIndex:step] intValue];
}

-(void) changePitchValueForStep:(int)step forPitch:(int)pitchInput {
    [self.pitchList replaceObjectAtIndex:step withObject:[NSNumber numberWithInt:pitchInput]];
}

-(void)sendGateOnValueforStep:(int)step atVoice:(int)voiceIndex{
    
    MIDIBUS_MIDI_EVENT* noteOn = [MidiBusClient setupSmallEvent];
    noteOn->timestamp = 0;
    noteOn->length = 3;
    noteOn->data[0] = 0x90;
    noteOn->data[1] = 60 & 0x7F;
    noteOn->data[2] = 90 & 0x7F;
    
    [MidiBusClient sendMidiBusEvent:1 withEvent:noteOn];
    [MidiBusClient sendMidiBusEvent:2 withEvent:noteOn];
    [MidiBusClient sendMidiBusEvent:3 withEvent:noteOn];
    
    [MidiBusClient disposeSmallEvent:noteOn];
}

-(MIDIBUS_MIDI_EVENT *)makeMidiEventforPitch:(int)pitch atVoice:(int)voiceIndex{
    
    // create an event and initialise it
    MIDIBUS_MIDI_EVENT* event = [MidiBusClient setupSmallEvent];
    
    // populate the message (example send CC 1 off on channel 1)
    event->timestamp = 0;         // send immediately or you can stamp in the future
    event->length = 3;            // length of MIDI message
    event->data[0] = 0xB0;        // controller, channel 1
    event->data[1] = 0x00;        // controller 0
    event->data[2] = 0x00;        // value 0
    
    // send it
    eMidiBusStatus status =
    [MidiBusClient sendMidiBusEvent:index withEvent:event];
    
    
    // clean up message if finished with it
    [MidiBusClient disposeSmallEvent:event];
    
    return event;
    
    
    /*
     MIDIBUS_MIDI_EVENT* noteOn = [MidiBusClient setupSmallEvent];
     noteOn->timestamp = 0;
     noteOn->length = 3;
     noteOn->data[0] = 0x90;
     noteOn->data[1] = pitch & 0x7F;
     noteOn->data[2] = velocity & 0x7F;
     
     [MidiBusClient sendMidiBusEvent:1 withEvent:noteOn];
     [MidiBusClient sendMidiBusEvent:2 withEvent:noteOn];
     [MidiBusClient sendMidiBusEvent:3 withEvent:noteOn];
     
     MIDIBUS_MIDI_EVENT* noteOff = [MidiBusClient setupSmallEvent];
     noteOff->length = 3;
     noteOff->data[0] = 0x90;
     noteOff->data[1] = pitch & 0x7F;
     noteOff->data[2] = 0x00;
     noteOff->delay_ms = 100.0;
     
     [MidiBusClient sendMidiBusEvent:1 withEvent:noteOff];
     [MidiBusClient sendMidiBusEvent:2 withEvent:noteOff];
     [MidiBusClient sendMidiBusEvent:3 withEvent:noteOff];
     
     [MidiBusClient disposeSmallEvent:noteOn];
     [MidiBusClient disposeSmallEvent:noteOff];
     
     */
}



@end
