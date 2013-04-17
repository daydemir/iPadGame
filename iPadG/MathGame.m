//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: Test.java
//
//  Created by dst3708 on 4/1/13.
//

//note:
//in modified morgan's code
//gridSize = total grids
//difficulty = maxi number which the math operation runs below
//operation = 'addition' 'subtraction' and 'combination'

#import "stdlib.h"
#import "MathGame.h"

@implementation MathGame

@synthesize matchID;
NSMutableArray *cardArray;
int answers[20];
BOOL duplicate = false;

int matchID = 0;

+ (NSMutableArray*)generateGrid:(int)gridSize
                 withDifficulty:(int)difficulty
                         withOp:(unichar)operation {
    cardArray = [NSMutableArray array];
    if (operation == 'a') {
        while(matchID < gridSize/2) {
            [self getNumbers:difficulty add:YES];
        }
    }
    else if (operation == 's') {
        while(matchID < gridSize/2) {
            [self getNumbers:difficulty add:NO];
        }
    }
    else if (operation == 'b') {
        while(matchID < gridSize/4) {
            [self getNumbers:difficulty add:NO];
        }
        while(matchID < gridSize/2) {
            [self getNumbers:difficulty add:YES];
        }
    }
    else {
    }
    return cardArray;
}

+ (void)getNumbers:(int)limit
               add:(BOOL)op {
    duplicate = false;
    int a, b, c, d;
    if (limit == 10) {
        c = arc4random() % 11;
        b = arc4random() % (c+1);
        a = c - b;
    }
    else {
        limit = limit / 2;
        a = arc4random() % limit + 1;
        b = arc4random() % limit + 1;
        c = a + b;
    }
    NSLog(@"%s", "answer[c] is");
    if (op) {
        d = c;
        }
    else {
        d = a;
    }
    for (int x = 0; x < matchID; x++) {
        if (answers[x] == d){
            duplicate = true;
        }
    }
    if (!duplicate){
        answers[matchID] = d;
        [self getCards:matchID withA:a withB:b withC:c add:op];
        matchID++;
    }
}

+ (void)getCards:(int)match
           withA:(int)a
           withB:(int)b
           withC:(int)c
             add:(BOOL)op {
    NSString *card1;
    NSString *card2;
    if (op) {
        card1 = [NSString stringWithFormat:@"%d + %d", a, b];
        card2 = [NSString stringWithFormat:@"%d", c];
    }
    else {
        card1 = [NSString stringWithFormat:@"%d - %d", c, b];
        card2 = [NSString stringWithFormat:@"%d", a];
    }
    [cardArray addObject: card1];
    [cardArray addObject: card2];
}

@end
