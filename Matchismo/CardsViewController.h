//
//  CardsViewController.h
//  Matchismo
//
//  Created by Giovanni on 1/26/13.
//  Copyright (c) 2013 Giovanni. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Deck.h"
#import "CardMatchingGame.h"

@interface CardsViewController : UIViewController

- (Deck *)createDeck; //abstract
- (void)updateUI;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (nonatomic) NSUInteger matchCount; //abstract
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *whatLabel;

@end
