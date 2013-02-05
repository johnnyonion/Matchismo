//
//  Deck.h
//  Matchismo
//
//  Created by Giovanni on 1/26/13.
//  Copyright (c) 2013 Giovanni. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end
