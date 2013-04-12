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
@synthesize array = _array;


- (id) init
{
    self = [super init];
    if(self)
    {
        
    }
    
    Content *cow = [[Content alloc] initWithWord:@"Cow"];
    Content *dog = [[Content alloc] initWithWord:@"Dog"];
    Content *cat = [[Content alloc] initWithWord:@"Cat"];
    Content *horse = [[Content alloc] initWithWord:@"Horse"];
    Content *elephant = [[Content alloc] initWithWord:@"Elephant"];
    Content *fish = [[Content alloc] initWithWord:@"Fish"];
    Content *snake = [[Content alloc] initWithWord:@"Snake"];
    Content *bee = [[Content alloc] initWithWord:@"Bee"];
    
    
    _array = [NSArray arrayWithObjects: cow, dog, cat, horse, elephant, fish, snake, bee, nil];
    //_array = [NSArray arrayWithObjects: cow, dog, cat, dog, horse, elephant, elephant, cow, fish, snake, cat, snake, bee, fish, bee, horse, nil];
    //_array = [NSArray arrayWithObjects:@"Cow", @"Dog", @"Cat", @"Dog", @"Horse", @"Elephant", @"Elephant", @"Cow", @"Fish", @"Snake", @"Cat", @"Snake", @"Bee", @"Fish", @"Bee", @"Horse", nil];
    return self;
    
}


-(id)initWith:(int)numCards {
    _array = [NSArray arrayWithObjects:@"Cow", @"Dog", @"Cat", @"Dog", @"Horse", @"Elephant", @"Elephant", @"Cow", @"Fish", @"Snake", @"Cat", @"Snake", @"Bee", @"Fish", @"Bee", @"Horse", nil];
    NSLog(@"init with ran");
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

- (NSMutableArray)getGameContent
{
    
}


@end