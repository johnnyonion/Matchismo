//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Giovanni on 1/31/13.
//  Copyright (c) 2013 Giovanni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"

@interface CardMatchingGame : NSObject
- (id)initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck
          matchingCount:(NSUInteger)numberCards;

- (void)flipCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property (nonatomic, readonly) int score;
@property (nonatomic, strong) NSString *scoringDetail;

@end
