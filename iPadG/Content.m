//
//  Content.m
//  COMP 523 Project
//
//  Created by Christopher Spargo on 4/8/13.
//  Copyright (c) 2013 Christopher Spargo. All rights reserved.
//

#import "Content.h"

@implementation Content
@synthesize word;
@synthesize matchID;
@synthesize matched;
@synthesize position = _position;
- (id) initWithWord:(NSString *)aWord;
{
    self = [super init];
    
    if(self)
    {
        word = [aWord copy];
    }
    
    return self;
}

- (void) setPosition:(int)position withSize:(int)size {
    int r, c;
    switch(size) {
        case (20): {
            r = 5;
            c = 4;
        }
    }
    row = position/r + 65;
    column = position % c;
    if (column == 0) {
        column = c;
    }
    _position = [NSString stringWithFormat:@"%c%i", row, column];
}

@end
