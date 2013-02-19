//
//  SetCardDeck.m
//  Matchismo
//
//  Created by Giovanni on 2/11/13.
//  Copyright (c) 2013 Giovanni. All rights reserved.
//

#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

- (id)init
{
    self = [super init];
    
    if (self) {
        for (NSString *symbol in [SetCard validSymbols]) {
            for (NSNumber *number in [SetCard vailidNumberOfSymbols]) {
                for (NSString *color in [SetCard validColors]) {
                    for (NSString *shade in [SetCard validShade]) {
                        SetCard *card = [[SetCard alloc] init];
                        card.symbol = symbol;
                        card.shade = shade;
                        card.colorString = color;
                        card.number = number;
                    
                        [self addCard:card atTop:YES];
                    }
                }
            }
        }
        
        
    }
    
    return self;
    
}

@end
