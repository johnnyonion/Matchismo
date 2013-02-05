//
//  PlayingCard.h
//  Matchismo
//
//  Created by Giovanni on 1/31/13.
//  Copyright (c) 2013 Giovanni. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
@end
