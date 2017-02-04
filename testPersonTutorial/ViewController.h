//
//  ViewController.h
//  testPersonTutorial
//
//  Created by Philippe Blanchette on 2017-01-11.
//  Copyright (c) 2017 Philippe Blanchette. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "pitchView.h"
#import "MidiBusClient.h"
#import "globalView.h"
#import "metroControl.h"
#import "clockDivider.h"
#import "gateListObject.h"
#import "pitchEngine.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet allVoicesMultiTouch *testView;
@property (strong, nonatomic) IBOutlet pitchView *pitchView;
@property (strong, nonatomic) IBOutlet globalView *globalView;
@property (strong,nonatomic) metroControl *theMetroControl;
@property (strong,nonatomic) clockDivider *theClockDivider;
@property (strong,nonatomic) voiceGateSequence *theVoiceGateSequence;
@property (strong,nonatomic) gateListObject *theGateListObject;
@property (strong,nonatomic) pitchEngine *thePitchEngine;

@end
