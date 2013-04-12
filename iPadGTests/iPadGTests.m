//
//  iPadGTests.m
//  iPadGTests
//
//  Created by Deniz Aydemir on 3/1/13.
//  Copyright (c) 2013 Deniz Aydemir. All rights reserved.
//

#import "iPadGTests.h"
#import "iPadGameViewController.h"
#import "GameplayViewController.h"
#import "Content.h"
#import "Grid.h"
#import "Specs.h"

@implementation iPadGTests

- (void)setUp
{
    [super setUp];
    iPadGameViewController *ipadgamevc = [[iPadGameViewController alloc] init];
    GameplayViewController *gameplayvc = [[GameplayViewController alloc] init];
    Content *cont = [[Content alloc] initWithWord:@"TEST WORD"];
    Grid *gr = [[Grid alloc] init];
    Specs *sp = [[Specs alloc] init];
    
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testExample
{
    [self setUp];
    STFail(@"Unit tests are not implemented yet in iPadGTests");
    //NSLog(@"%@",[cont word]);
}

@end
