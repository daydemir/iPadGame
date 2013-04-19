//
//  Content.m
//  COMP 523 Project
//
//  Created by Christopher Spargo on 4/8/13.
//  Copyright (c) 2013 Christopher Spargo. All rights reserved.
//

#import "Content.h"

@implementation Content
@synthesize label;
@synthesize word;
@synthesize matchID;
@synthesize matched;
<<<<<<< HEAD
=======
@synthesize position = _position;
@synthesize hasSound = False;
>>>>>>> All GameType available! Duplicated Tab fixed!

- (id) initWithWord:(NSString *)aWord;
{
    self = [super init];
    
    if(self)
    {
        word = [aWord copy];
    }
    
    return self;
}

- (void) setLabel:(BOOL)memory useGrid:(BOOL)alpha withIndex:(int)index withSize:(int)size {
    if (size == 4 || size == 6) {
        if (alpha) {
            label = [NSString stringWithFormat:@"%@ %@", [self getDirectional:index withSize:size], [self getGrid:index withSize:size]];
        }
        else {
            label = [NSString stringWithFormat:@"%@",  [self getDirectional:index withSize:size]];
        }
    }
    else {
            label = [NSString stringWithFormat:@"%@", [self getGrid:index withSize:size]];
    }
    if (memory) {
        label = [NSString stringWithFormat:@"%@ %@", label, word];
    }
}


- (NSString *) getDirectional:(int)index withSize:(int)size {
    if (size == 4) {
        switch(index) {
            case(1): {
                return [NSString stringWithFormat:@"%s", "Top Left"];
            }
            case(2): {
                return [NSString stringWithFormat:@"%s", "Top Right"];
            }
            case(3): {
                return [NSString stringWithFormat:@"%s", "Bottom Left"];
            }
            case(4): {
                return [NSString stringWithFormat:@"%s", "Bottom Right"];
            }
        }
    }
    else {
        switch (index) {
            case(1): {
                return [NSString stringWithFormat:@"%s", "Top Left"];
            }
            case(2): {
                return [NSString stringWithFormat:@"%s", "Top Right"];
            }
            case(3): {
                return [NSString stringWithFormat:@"%s", "Middle Left"];
            }
            case(4): {
                return [NSString stringWithFormat:@"%s", "Middle Right"];
            }
            case(5): {
                return [NSString stringWithFormat:@"%s", "Bottom Left"];
            }
            case(6): {
                return [NSString stringWithFormat:@"%s", "Bottom Right"];
            }
        }
    }
}

- (NSString*) getGrid:(int)index withSize:(int)size {
    int r, c;
    switch(size) {
        case (4): {
            r = 2;
            c = 2;
        }
        case (6): {
            r = 3;
            c = 2;
        }
        case (12): {
            r = 3;
            c = 2;
        }
        case (16): {
            r = 4;
            c = 4;
        }
        case (20): {
            r = 5;
            c = 4;
        }
    }
    row = index/r + 65;
    column = index % c;
    if (column == 0) {
        column = c;
    }
    return [NSString stringWithFormat:@"%c%i", row, column];
}

@end
