//
//  iPadGameViewController.h
//  iPadG
//
//  Created by Deniz Aydemir on 3/1/13.
//  Copyright (c) 2013 Deniz Aydemir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface iPadGameViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *NumPlayersLabel;
@property (weak, nonatomic) IBOutlet UILabel *GameTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *GameDifficultyLabel;
@property (weak, nonatomic) IBOutlet UILabel *TimerLabel;



- (IBAction)BeginPressed:(id)sender;

//number of players
- (IBAction)SinglePlayerPressed:(id)sender;
- (IBAction)TwoPlayerPressed:(id)sender;

//timed or not
- (IBAction)TimedPressed:(id)sender;
- (IBAction)NotTimedPressed:(id)sender;

//game type 
- (IBAction)WordToWordPressed:(id)sender;
- (IBAction)WordToSoundPressed:(id)sender;
- (IBAction)SoundToSoundPressed:(id)sender;

//game difficulty
- (IBAction)VeryEasyPressed:(id)sender;
- (IBAction)EasyPressed:(id)sender;



@end
