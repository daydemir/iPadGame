//
//  Generated by the J2ObjC translator.  DO NOT EDIT!
//  source: Test.java
//
//  Created by dst3708 on 4/1/13.
//

#import "stdlib.h"
#import "Card.h"
#import "Test.h"

@implementation Test

@synthesize matchID;
NSMutableArray *cardArray;

int matchID = 0;

+ (NSMutableArray*)generateGrid:(int)gridSize
                 withDifficulty:(int)difficulty
                         withOp:(unichar)operation {
    
  cardArray = [NSMutableArray arrayWithCapacity:(gridSize + gridSize)];

  if (operation == 'a') {
    for (int x = 0; x < gridSize; x++) {
      [self getNumbers:difficulty add:YES];
    }
  }
  else if (operation == 's') {
    for (int x = 0; x < gridSize; x++) {
      [self getNumbers:difficulty add:NO];
    }
  }
  else if (operation == 'b') {
    for (int x = 0; x < gridSize / 2; x++) {
      [self getNumbers:difficulty add:NO];
    }
    for (int x = gridSize / 2; x < gridSize; x++) {
      [self getNumbers:difficulty add:YES];
    }
  }
  else {
  }
return cardArray;
}

+ (void)getNumbers:(int)limit
               add:(BOOL)op {
  int a, b, c;
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
    [self getCards:matchID withA:a withB:b withC:c add:op];
  matchID++;
}

+ (void)getCards:(int)match
               withA:(int)a
                withB:(int)b
                withC:(int)c
               add:(BOOL)op {
  Card *card1;
  Card *card2;
  if (op) {
    card1.text = [NSString stringWithFormat:@"%d + %d", a, b];
    card2.text = [NSString stringWithFormat:@"%d", c];
  }
  else {
    card1.text = [NSString stringWithFormat:@"%d - %d", c, a];
    card2.text = [NSString stringWithFormat:@"%d", b];
  }
    [cardArray addObject: card1];
    [cardArray addObject: card2];
}

@end