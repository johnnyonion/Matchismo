//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by Giovanni on 1/31/13.
//  Copyright (c) 2013 Giovanni. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (strong, nonatomic) NSMutableArray *cards;
@property (nonatomic, readwrite) int score;
@property (nonatomic) int matchingCount;

@end

@implementation CardMatchingGame

- (id)initWithCardCount:(NSUInteger)cardCount
              usingDeck:(Deck *)deck
          matchingCount:(NSUInteger)numberCards
{
    self = [super init];
    
    if (self) {
        self.matchingCount = numberCards;
        for (int i = 0; i < cardCount; i++) {
            Card *card = [deck drawRandomCard];
            if (!card) {
                self = nil;
            } else {
                self.cards[i] = card;
            }
        }
        
    }
    
    return self;
}

- (NSMutableArray *)cards
{
    if (!_cards) _cards = [[NSMutableArray alloc] init];
    return _cards;
}

- (Card *)cardAtIndex:(NSUInteger)index
{
    return (index < self.cards.count) ? self.cards[index] : nil;
}

#define FLIP_COST 1
#define MISMATCH_PENTALTY 2
#define MATCH_BONUS 4

- (void)flipCardAtIndex:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isUnplayable) {
        if (!card.faceUp) {
            self.scoringDetail = [NSString stringWithFormat:@"Flipped up %@!", card.contents];
            for (Card *otherCard in self.cards) {
                if (otherCard.faceUp && !otherCard.isUnplayable) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        otherCard.unplayable = YES;
                        card.unplayable = YES;
                        int scoreChange = matchScore * MATCH_BONUS;
                        self.score += scoreChange;
                        self.scoringDetail = [NSString stringWithFormat:@"Matched %@ and %@ for %d points!", otherCard.contents, card.contents, scoreChange];
                    } else {
                        otherCard.faceUp = NO;
                        self.score -= MISMATCH_PENTALTY;
                        self.scoringDetail = [NSString stringWithFormat:@"%@ and %@ don't match! 2 point penalty!", otherCard.contents, card.contents];
                    }
                    
                    break;
                }
            }
            self.score -= FLIP_COST;
            
        }
        
        card.faceUp = !card.faceUp;
        
    }
}

@end
