//
//  ViewController.m
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-11.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    midibus_clock_enable_interface(1,1);
    midibus_clock_enable_interface(2,1);
    midibus_clock_enable_interface(3,1);
    
    self.theMetroControl = [[metroControl alloc] init];
    [self.theMetroControl customInit];
    
    self.theClockDivider = [[clockDivider alloc]init];
    [self.theClockDivider customInit];
    [MidiBusClient startWithApp:@"testPersonTutorial" andDelegate:self.theClockDivider];
    
    
    
    self.theVoiceGateSequence = [[voiceGateSequence alloc]init];
    [self.theVoiceGateSequence customInit];
    self.theClockDivider.theVoiceGateSequence= self.theVoiceGateSequence;
    self.theVoiceGateSequence.gateDisplay = self.pitchView;
    self.thePitchEngine = [[pitchEngine alloc] initWithPitch];
    self.pitchView.delegate = self.thePitchEngine;
    
    //init the GateList object.
    self.theGateListObject = [[gateListObject alloc] initWithVoices];
    self.testView.delegate = self.theGateListObject;
    self.theVoiceGateSequence.delegate = self.theGateListObject;
    
    self.theGateListObject.delegate = self.thePitchEngine;
    
}


-(void)startMetronome{
    [self.theMetroControl toggleMetro];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
