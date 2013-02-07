//
//  CardsViewController.m
//  Matchismo
//
//  Created by Giovanni on 1/26/13.
//  Copyright (c) 2013 Giovanni. All rights reserved.
//

#import "CardsViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardsViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *whatLabel;

@end

@implementation CardsViewController

- (IBAction)newDeal:(UIButton *)sender
{

    self.game = nil;
    self.flipCount = nil;
    [self updateUI];
    
}

- (CardMatchingGame *)game
{
    if (!_game) _game = [[CardMatchingGame alloc] initWithCardCount:self.cardButtons.count
                                                          usingDeck:[[PlayingCardDeck alloc] init]
                                                      matchingCount:3];
    return _game;
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

- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
   self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
    
}



- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:sender]];
    if (card.isFaceUp) {
        self.flipCount++; 
    }
        
    [self updateUI];
}


@end
