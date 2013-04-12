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
- (id) initWithWord:(NSString *)aWord;
{
    self = [super init];
    
    if(self)
    {
        word = [aWord copy];
    }
    
    return self;
}

@end
