//
//  GameplayViewController.m
//  iPadG
//
//  Created by Deniz Aydemir on 4/9/13.
//  Copyright (c) 2013 Deniz Aydemir. All rights reserved.
//

#import "GameplayViewController.h"
#import "Grid.h"
#import <QuartzCore/QuartzCore.h>
#import "DDFileReader.h"
#import <stdlib.h>
#import "NSMutableArray_Shuffling.h"
#import <AudioToolbox/AudioToolbox.h>
#import "SoundEffects.h"
#import "iPadGameViewController.h"
#import "Specs.h"


@interface GameplayViewController ()



@end

@implementation GameplayViewController


@synthesize gameSpecs;

Grid *gameGrid;




BOOL oneButtonClickedAlready = false;
UIButton *clickedButton;
NSArray *gridContent;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (id)initWithSpecs:(Specs*)gs
{
    gameSpecs = gs;
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    int gamesize = 20;
    NSLog(@"%@", [gameSpecs timed] ? @"YES" : @"NO");
    
    gameGrid = [[Grid alloc] init];
    if([gameSpecs difficultyLevel] == kEasy) { gamesize = 8; }
    //gridContent = [[NSArray alloc] init];
    
    //gridContent = gameGrid.array; //this should get the array of content from the Grid object...
    //NSLog(@"%@", [gridContent objectAtIndex:3]);

    
    
    gridContent = [[NSArray alloc] initWithArray:[gameGrid getGameContent:20 andGameType:3]];
    [self createButtons:[gridContent count] array:gridContent];
    //NSLog(@"%@", [[gridContent objectAtIndex:4] word]);
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createButtons:(int)numButtons array:(NSArray*)gc
{
    //default for 16 cards or 8 cards
    int yOffset = 56;
    int xOffset = 0;
    int yOffsetIncrement = 225;
    int width = 192;
    int height = 220;
    int cardsInRow = 4;

    
    
    //insert function that adjusts button distribution according to size of cards
    
    if(numButtons == 16) { //16 cards
        //anything else for 16?
    }
    else if(numButtons == 8) //8 cards
    {
        width = 384;
        cardsInRow = 2;
    }
    else //for 20 cards
    {
        width = 192;
        height = 176;
        yOffsetIncrement = 180;
    }
    
    
    for(int a = 0; a < numButtons; a++) {
        
        if((a%cardsInRow==0) && (a>0)) { yOffset+=yOffsetIncrement; xOffset=0; }
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        CALayer * layer = [button layer];
        [layer setMasksToBounds:YES];
        [layer setCornerRadius:10.0]; //when radius is 0, the border is a rectangle
        [layer setBorderWidth:1.0];
        [layer setBorderColor:[[UIColor grayColor] CGColor]];
        [button addTarget:self
                   action:@selector(buttonClicked:)
         forControlEvents:UIControlEventTouchDown];
        Content *cardContent = [gc objectAtIndex:a];
        NSLog(@"%i", (int)[cardContent matchID]);
        [button setTitle:[NSString stringWithFormat:@"%@", [cardContent word]] forState:UIControlStateNormal];
        button.frame = CGRectMake(xOffset, yOffset, width, height);
        button.clipsToBounds = YES;
        [button setTag:a];
        NSLog(@"%i", a);
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];


        //button.tag = a+1;
        [self.view addSubview:button];
        xOffset+=width;
    }
}

-(void)buttonClicked:(UIButton*)sender {
    int currentTag = [sender tag];
    int previousTag = [clickedButton tag];
    Content *currentContent =  [gridContent objectAtIndex:currentTag];
    Content *previousContent = [gridContent objectAtIndex:previousTag];
    
    //some test prints
    NSLog(@"%i", currentTag);
    //Content *con = [gridContent objectAtIndex:currentTag];
    //NSLog(@"%@", [con word]);
    NSLog(@"button clicked");
    
    if([currentContent matched])
    {
       //play some sound indicating they already matched this card?
    }
    
    else if(!oneButtonClickedAlready) { // see if the button being clicked is the first or second of a pair
        oneButtonClickedAlready = true;
        clickedButton = sender;
        [self highlightSelectedButton:sender];
        
        //play sound
        SoundEffects *se = [[SoundEffects alloc] initWithSoundNamed:@"HitWallObs.aiff"];
        [se play];
        
        }
    else if(clickedButton == sender){
        //action to be done if clicked button is clicked again...
    }
    else {
        //if([clickedButton.titleLabel.text isEqualToString:sender.titleLabel.text] && sender != clickedButton)
        if([currentContent matchID] == [previousContent matchID])
        {
            [self highlightMatchedButtons:clickedButton secondButton:sender];
            [currentContent setMatched:true];
            [previousContent setMatched:true];
            if([gameGrid gameOver])
            {
                NSLog(@"YOU WIN");
            }
        }
        else {
            [self highlightNoMatchButtons:clickedButton secondButton:sender];
        }
        oneButtonClickedAlready = false;
            
    }
}

-(void)highlightMatchedButtons:(UIButton*)sender secondButton:(UIButton*)sender2
{
    
    UIColor * green = [UIColor colorWithRed:60/255.0f green:226/255.0f blue:63/255.0f alpha:1.0f];
    sender.backgroundColor = green;
    sender2.backgroundColor = green;
}

-(void)highlightSelectedButton:(UIButton*)sender
{
    UIColor * gray = [UIColor colorWithRed:204/255.0f green:204/255.0f blue:204/255.0f alpha:1.0f];
    sender.backgroundColor = gray;
}

-(void)highlightNoMatchButtons:(UIButton*)sender secondButton:(UIButton*)sender2
{
    SoundEffects *se = [[SoundEffects alloc] initWithSoundNamed:@"Buzzer.aiff"];
    [se play];
    UIColor * red = [UIColor colorWithRed:255/255.0f green:25/255.0f blue:54/255.0f alpha:1.0f];
    sender.backgroundColor = red;
    sender2.backgroundColor = red;
    [self performSelector:@selector(clearButtonHighlighting:) withObject:sender afterDelay:1];
    [self performSelector:@selector(clearButtonHighlighting:) withObject:sender2 afterDelay:1];
}

-(void)clearButtonHighlighting:(UIButton*)sender {
    
    if(sender.backgroundColor == [UIColor colorWithRed:204/255.0f green:204/255.0f blue:204/255.0f alpha:1.0f]) {
        return;
    }
    else {
        sender.backgroundColor = [UIColor whiteColor];
        
    }
}

@end
