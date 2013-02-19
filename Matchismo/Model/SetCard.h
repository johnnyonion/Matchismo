//
//  SetCard.h
//  Matchismo
//
//  Created by Giovanni on 2/11/13.
//  Copyright (c) 2013 Giovanni. All rights reserved.
//

#import "Card.h"

@interface SetCard : Card

@property (nonatomic, strong) NSString *symbol;
@property (nonatomic, strong) NSString *colorString;
@property (nonatomic, strong) NSString *shade;
@property (nonatomic, strong) NSNumber *number;

+ (NSArray *)validSymbols;
+ (NSArray *)validColors;
+ (NSArray *)validShade;
+ (NSArray *)validNumberOfSymbols;

@end
