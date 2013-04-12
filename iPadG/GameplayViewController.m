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

@interface GameplayViewController ()

@end

@implementation GameplayViewController

Grid *gameGrid;
NSArray *gridContent;

BOOL oneButtonClickedAlready = false;
UIButton *clickedButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    gameGrid = [[Grid alloc] init];
    gridContent = gameGrid.array; //this should get the array of content from the Grid object...
    //NSLog(@"%@", [gridContent objectAtIndex:3]);
    
    //////////////////////////////////loading words from list/////////////////////////////
    NSMutableArray *words;
    NSMutableArray *words_chosen;
    words = [NSMutableArray array];
    words_chosen = [NSMutableArray array];
    //read file
    DDFileReader *reader = [[DDFileReader alloc] initWithFilePath:@"/Users/wang_t/Downloads/word.lst"];
    NSString * line = nil;
    //fetch input by lines
    while ((line = [reader readLine])) {
        [words addObject: line];
    }
    
    NSUInteger totalLines = [words count];
    //for 16 objects, randomly select for 8 objects and put a pair in
    for (int i =0 ; i< 8; i++){
        int r = arc4random() % totalLines ;
        NSString *word = [words objectAtIndex: r];
        [words_chosen addObject:word];
        [words_chosen addObject:word];
    }
    //shuffling inside the words_chosen array
    [words_chosen shuffle];
    //put nil at the end
    [words_chosen addObject:nil];
    NSArray *gridContent = words_chosen; */

    /*   NSArray *gridContent = [NSArray arrayWithObjects:@"Cow", @"Dog", @"Cat", @"Dog", @"Horse", @"Elephant", @"Elephant", @"Cow", @"Fish", @"Snake", @"Cat", @"Snake", @"Bee", @"Fish", @"Bee", @"Horse", nil];*/


    
    // testing purposes
    //        for (int j =0 ; j<16;j++)
    //            NSLog(@"%@", [gridContent objectAtIndex:j]);
    
    
    //NSArray *gridContent = [NSArray arrayWithObjects:@"Cow", @"Dog", @"Cat", @"Dog", @"Horse", @"Elephant", @"Elephant", @"Cow", @"Fish", @"Snake", @"Cat", @"Snake", @"Bee", @"Fish", @"Bee", @"Horse", nil];

    [self createButtons:16 array:gridContent];
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createButtons:(int)numButtons array:(NSArray*)gc
{
    int yOffset = 56;
    int xOffset = 0;
    for(int a = 0; a < numButtons; a++) {
        if((a%4==0) && (a>0)) { yOffset+=225; xOffset=0; }
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
        [button setTitle:[NSString stringWithFormat:@"%@", [cardContent word]] forState:UIControlStateNormal];
        button.frame = CGRectMake(xOffset, yOffset, 192, 220);
        button.clipsToBounds = YES;
        button.tag = a+1;
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];


        //button.tag = a+1;
        [self.view addSubview:button];
        xOffset+=192;
    }
}

-(void)buttonClicked:(UIButton*)sender {
    int tag = sender.tag;
    NSLog(@"button clicked");
    
    if(!oneButtonClickedAlready) {
        oneButtonClickedAlready = true;
        clickedButton = sender;
        [self highlightSelectedButton:sender];
    }
    else {
        if([clickedButton.titleLabel.text isEqualToString:sender.titleLabel.text] && sender != clickedButton)
        //if([gameGrid isMatched:[gridContent objectAtIndex:tag] :[gridContent objectAtIndex:[clickedButton tag]]])
        {
            [self highlightMatchedButtons:clickedButton secondButton:sender];
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
