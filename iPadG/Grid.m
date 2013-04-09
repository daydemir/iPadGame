//
//  Grid.m
//  COMP 523 Project
//
//  Created by Christopher Spargo on 4/8/13.
//  Copyright (c) 2013 Christopher Spargo. All rights reserved.
//

#import "Grid.h"
#import "Specs.h"
#import "Content.h"

@implementation Grid
@synthesize gameCounter;
@synthesize comparator;
@synthesize array;

- (id) init
{
    self = [super init];
    if(self)
    {
        
    }
    
    return self;
}

- (void) decrementGC
{
    if (gameCounter > 0) {
        gameCounter = gameCounter - 1;
    }
}

- (BOOL) isMatched: (Content *) useComparatorHere
                  : (Content *) andGetThisStraightFromGrid
{
    if (useComparatorHere == andGetThisStraightFromGrid) {
        return true;
    }
    return false;
}

@end