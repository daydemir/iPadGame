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
@property(nonatomic) NSString *word;
@property(nonatomic) NSInteger *matchID;
@property(nonatomic) BOOL *matched;
@property(nonatomic) NSString *position;

@end
