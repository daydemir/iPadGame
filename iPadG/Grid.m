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
#import "DDFileReader.h"
#import <stdlib.h>
#import "NSMutableArray_Shuffling.h"

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

- (NSArray*)getGameContent
{
    //////////////////////////////////loading words from list/////////////////////////////
    NSMutableArray *words;
    NSMutableArray *words_chosen;
    words = [NSMutableArray array];
    words_chosen = [NSMutableArray array];
    //read file
    DDFileReader *reader = [[DDFileReader alloc] initWithFilePath:@"/Users/Deniz/Developer/iPadGame/iPadG/words.lst"];
    NSString * line = nil;
    //fetch input by lines
    while ((line = [reader readLine])) {
        [words addObject:line];
    }
    
    NSUInteger totalLines = [words count];
    //for 16 objects, randomly select for 8 objects and put a pair in
    for (int i =0 ; i< 8; i++){
        int r = arc4random() % totalLines ;
        NSString *word = [words objectAtIndex: r];
        Content *wordAsContent = [[Content alloc] initWithWord:word];
        [wordAsContent setMatchID:i];
        [words_chosen addObject:wordAsContent];
        [words_chosen addObject:wordAsContent];
    }
    //shuffling inside the words_chosen array
    [words_chosen shuffle];
    //put nil at the end
    //[words_chosen addObject:nil];
    NSArray *gridContent = words_chosen;
    return gridContent;
}


@end