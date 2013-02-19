//
//  SetCard.m
//  Matchismo
//
//  Created by Giovanni on 2/11/13.
//  Copyright (c) 2013 Giovanni. All rights reserved.
//

#import "SetCard.h"

@implementation SetCard

- (NSString *)contents
{
    return self.symbol;
}

+ (NSArray *)validSymbols
{
    return @[@"■", @"●", @"▲"];
}

+ (NSArray *)validColors
{
    return @[@"red", @"green", @"blue"];
}

+ (NSArray *)validShade
{
    return @[@"solid", @"shaded", @"outline"];
}

+ (NSArray *)validNumberOfSymbols
{
    return @[@(1),@(2),@(3)];
}

@end
