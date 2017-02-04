//
//  voiceGateSequence.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-26.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "voice.h"
#import "pitchView.h"
#import "gateVoiceObject.h"


//declare a protocol to pass the stepQuerry to the gateListObject
@protocol gateQuerryDelegate <NSObject>

-(void) querryStepGateValue:(int)step forVoice:(int)voiceIndex;

@end


@interface voiceGateSequence : NSObject
{
    id <gateQuerryDelegate> _delegate;
}


/*
    Responsibilities of voiceGateSequence
 
    - Advance the gate sequence count regardless of gate on or off
    - Keeps the direction of the voice and calculates the step size (int)
        - communicates with the gate sequence via the triggerValue(int)
        - communicates with the GateView to update the display of the current Count via Trigger Value(int).
*/

@property id delegate;

@property (weak, nonatomic) IBOutlet pitchView *gateDisplay;

@property NSMutableArray *allVoices;

-(void) customInit;
-(void)triggerStepIncrementforVoice:(int)voiceIndex;


@end
