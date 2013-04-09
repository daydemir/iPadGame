//
//  GameplayViewController.m
//  iPadG
//
//  Created by Deniz Aydemir on 4/9/13.
//  Copyright (c) 2013 Deniz Aydemir. All rights reserved.
//

#import "GameplayViewController.h"
#import "Grid.h"

@interface GameplayViewController ()

@end

@implementation GameplayViewController

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
    
    Grid *grid = [[Grid alloc] init];
    [self createButtons:16];
    
    
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createButtons:(int)numButtons
{
    int yOffset = 56;
    int xOffset = 0;
    for(int a = 0; a < numButtons; a++) {
        if((a%4==0) && (a>0)) { yOffset+=225; xOffset=0; }
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [button addTarget:self
                   action:@selector(buttonClicked:)
         forControlEvents:UIControlEventTouchDown];
        [button setTitle:@"Button x" forState:UIControlStateNormal];
        button.frame = CGRectMake(xOffset, yOffset, 192, 220);
        [self.view addSubview:button];
        xOffset+=192;
    }
}

-(void)buttonClicked:(UIButton*)sender {
    int tag = sender.tag;
    NSLog(@"button clicked");
}


@end
