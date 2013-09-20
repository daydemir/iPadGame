//
//  Content.h
//  COMP 523 Project
//
//  Created by Christopher Spargo on 4/8/13.
//  Copyright (c) 2013 Christopher Spargo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Content : NSObject
{
    NSString *word;
    int row;
    int column;
}
-(id)initWithWord: (NSString *) aWord;
@property(nonatomic, strong) NSString *label;
@property(nonatomic, strong) NSString *word;
@property(nonatomic) NSInteger *matchID;
@property(nonatomic) BOOL matched;
@property(nonatomic, strong) NSString *grid;
@property(nonatomic, strong) NSString *directional;
@property(nonatomic, strong) NSString *position;
@property(nonatomic) BOOL hasSound;

- (NSString*)getGrid:(int)index
               withSize:(int)size;
- (void) setLabel:(BOOL)memory
          useGrid:(BOOL)alpha
        withIndex:(int)index
         withSize:(int)size;
@end
