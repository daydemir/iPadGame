//
//  iPadGameViewController.m
//  iPadG
//
//  Created by Deniz Aydemir on 3/1/13.
//  Copyright (c) 2013 Deniz Aydemir. All rights reserved.
//

#import "iPadGameViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "Specs.h"

@interface iPadGameViewController ()

@end

@implementation iPadGameViewController


@synthesize NumPlayersLabel = _NumPlayersLabel;
@synthesize GameTypeLabel = _GameTypeLabel;
@synthesize GameDifficultyLabel = _GameDifficultyLabel;
@synthesize TimerLabel = _TimerLabel;
Specs *gameSpecs;


- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"VIEW DID LOAD");
    
    
    if([gameSpecs multiplayer]) {
        _NumPlayersLabel.text = @"2";
        //NSLog(@"CHECKED MULTI");
    }
    else {
        _NumPlayersLabel.text = @"1";
    }
    
    if([gameSpecs timed]) {
        _TimerLabel.text = @"Yes";
    }
    else {
        _TimerLabel.text = @"No";
    }
    
    GameType gt = [gameSpecs gameType];
    
    if(gt == kWordToWord) {
        _GameTypeLabel.text = @"Word To Word"; }
    else if (gt == kWordToSound) {
        _GameTypeLabel.text  = @"Word to Sound"; }
    else if (gt == kSoundToSound){
        _GameTypeLabel.text = @"Sound to Sound"; }
    else {
        _GameTypeLabel.text = @"Math"; 
    }
    
    DifficultyLevel dl = [gameSpecs difficultyLevel];
    if(dl == kEasy) {
        _GameDifficultyLabel.text = @"Easy"; }
    else if (dl == kVeryEasy) {
        _GameDifficultyLabel.text  = @"Very Easy"; }
    else if (dl == kMedium) {
        _GameDifficultyLabel.text  = @"Medium"; }
    else if (dl == kHard) {
        _GameDifficultyLabel.text  = @"Hard"; }
    else {
        _GameDifficultyLabel.text = @"Very Hard!"; }
    

    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)BeginPressed:(id)sender {
    gameSpecs = [Specs alloc];
    gameSpecs = [gameSpecs init];
    
}

- (IBAction)SinglePlayerPressed:(id)sender {
    [gameSpecs setMultiplayer: false];
    NSLog(@"Multiplayer set to false");
}

- (IBAction)TwoPlayerPressed:(id)sender {
    [gameSpecs setMultiplayer: true];
    NSLog(@"Multiplayer set to true");
}

- (IBAction)TimedPressed:(id)sender {
    [gameSpecs setTimed: true];
    NSLog(@"Timer set to %s", [gameSpecs timed] ? "true" : "false" );
}

- (IBAction)NotTimedPressed:(id)sender {
    [gameSpecs setTimed: false];
    NSLog(@"Timer set to false");
}

- (IBAction)WordToWordPressed:(id)sender {
    [gameSpecs setGameType:kWordToWord];
    NSLog(@"Game Type is Word to Word");
}

- (IBAction)WordToSoundPressed:(id)sender {
    [gameSpecs setGameType:kWordToSound];
    NSLog(@"Game Type is Word to Sound");
}

- (IBAction)SoundToSoundPressed:(id)sender {
    [gameSpecs setGameType:kSoundToSound];
    NSLog(@"Game Type is Sound to Sound");
}

-(IBAction)MathPressed:(id)sender {
    [gameSpecs setGameType:kMath];
    NSLog(@"Game Type is set to Math");
}

- (IBAction)VeryEasyPressed:(id)sender {
    [gameSpecs setDifficultyLevel:kVeryEasy];
    NSLog(@"Difficulty is Very Easy");
}

- (IBAction)EasyPressed:(id)sender {
    [gameSpecs setDifficultyLevel:kEasy];
    NSLog(@"Difficulty is Easy");
}


@end
