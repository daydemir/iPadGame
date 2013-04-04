//
//  Specs.m
//  project
//
//  Created by Christopher Spargo on 3/27/13.
//  Copyright (c) 2013 Christopher Spargo. All rights reserved.
//

#import "Specs.h"

@implementation Specs
// setters
- (void) setMultiplayer: (BOOL) p{
    multiplayer = p;
}
- (void) setGameType: (GameType) type{
    gameType = type;
}
- (void) setDifficultyLevel: (DifficultyLevel) difficulty{
    difficultyLevel = difficulty;
}
- (void) setTimed: (BOOL) p{
    timed = p;
}
// getters
- (BOOL) getMultiplayer{
    return multiplayer;
}
- (GameType) getGameType{
    return gameType;
}
- (DifficultyLevel) getDifficultyLevel{
    return difficultyLevel;
}
- (BOOL) getTimed{
    return timed;
}
@end
