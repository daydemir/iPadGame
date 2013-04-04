//
//  Specs.h
//  project
//
//  Created by Christopher Spargo on 3/27/13.
//  Copyright (c) 2013 Christopher Spargo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    kWordToWord,
    kSoundToSound,
    kWordToSound,
} GameType;

typedef enum {
    kVeryEasy,
    kEasy,
    kMedium,
    kHard,
    kVeryHard
} DifficultyLevel;

@interface Specs : NSObject
{
    BOOL multiplayer;
    GameType gameType;
    DifficultyLevel difficultyLevel;
    BOOL timed;
}
// setters
- (void) setMultiplayer:(BOOL)p;
- (void) setGameType:(GameType)type;
- (void) setDifficultyLevel:(DifficultyLevel)difficulty;
- (void) setTimed:(BOOL)p;
// getters
- (BOOL) getMultiplayer;
- (GameType) getGameType;
- (DifficultyLevel) getDifficultyLevel;
- (BOOL) getTimed;

@end
