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
@property (nonatomic, strong) NSMutableArray *cardsInPlay;

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

- (NSMutableArray *)cardsInPlay
{
    if (!_cardsInPlay) _cardsInPlay =  [[NSMutableArray alloc] init];
    return _cardsInPlay;
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
            NSLog(@" cardsInPlay.count: %d, matchingCount: %d", self.cardsInPlay.count, self.matchingCount);
            if (self.cardsInPlay.count == self.matchingCount - 1) {
                
                int matchScore = [card match:self.cardsInPlay];
                if (matchScore) {
                    int scoreChange = matchScore * MATCH_BONUS;
                    self.score += scoreChange;
                    //self.scoringDetail goes here.
                    
                    card.unplayable = YES;
                    for (Card *otherCard in self.cardsInPlay) {
                        otherCard.unplayable = YES;
                    }
                    [self.cardsInPlay removeAllObjects];
                    
                } else {
                    
                    self.score  -= MISMATCH_PENTALTY;
                    for (Card *otherCard in self.cardsInPlay) {
                        otherCard.faceUp = NO;
                    }
                    [self.cardsInPlay removeAllObjects];
                    //it's a mismatch so the other cards turn face down and the selected card now becomes a card in play
                    [self.cardsInPlay addObject:card];
                }
                
            } else {
                
                [self.cardsInPlay addObject:card];
            }
            


        } else if (self.cardsInPlay.count > 0 ) {
            [self.cardsInPlay removeObject:card];
        }

        card.faceUp = !card.faceUp;
    }
}

- (void)flipCardAtIndexOld:(NSUInteger)index
{
    Card *card = [self cardAtIndex:index];
    
    if (!card.isUnplayable) {
        
        //If the card is facedown try and match it.
        if (!card.faceUp) {
            
            
            self.scoringDetail = [NSString stringWithFormat:@"Flipped up %@!", card.contents];
            
            //Check the other cards for one that is faceup and playable to go for a match.
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
