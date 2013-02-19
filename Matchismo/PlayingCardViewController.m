//
//  PlayingCardViewController.m
//  Matchismo
//
//  Created by Giovanni on 2/13/13.
//  Copyright (c) 2013 Giovanni. All rights reserved.
//

#import "PlayingCardViewController.h"
#import "PlayingCardDeck.h"

@interface PlayingCardViewController ()

@end

@implementation PlayingCardViewController


- (Deck *)createDeck
{
    return [[PlayingCardDeck alloc] init];
}

- (NSUInteger)matchCount
{
    return 2;
}

- (void)updateUI
{
    
    UIImage *cardBackImage = [UIImage imageNamed:@"cardback.jpeg"];
    //UIEdgeInsets insets = UIEdgeInsetsMake(2.0, 2.0, 2.0, 16.0);
    
    
    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        //cardButton.imageEdgeInsets = insets;
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        
        [cardButton setImage:card.isFaceUp ? nil : cardBackImage forState:UIControlStateNormal];
        
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = card.isUnplayable ? 0.3 : 1.0;
        
    }
    
    self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    self.whatLabel.text = [NSString stringWithFormat:@"%@", self.game.scoringDetail];

    
}

@end
