//
//  ViewController.m
//  TicTacToe
//
//  Created by Paul Kitchener on 10/1/15.
//  Copyright © 2015 Paul Kitchener. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIAlertViewDelegate>

@property (weak, nonatomic) IBOutlet UILabel *labelOne;
@property (weak, nonatomic) IBOutlet UILabel *labelTwo;
@property (weak, nonatomic) IBOutlet UILabel *labelThree;
@property (weak, nonatomic) IBOutlet UILabel *labelFour;
@property (weak, nonatomic) IBOutlet UILabel *labelFive;
@property (weak, nonatomic) IBOutlet UILabel *labelSix;
@property (weak, nonatomic) IBOutlet UILabel *labelSeven;
@property (weak, nonatomic) IBOutlet UILabel *labelEight;
@property (weak, nonatomic) IBOutlet UILabel *labelNine;
@property (weak, nonatomic) IBOutlet UILabel *whichPlayerLabel;

@property CGPoint tappedPoint;
@property int turnCount;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.turnCount = 0;
    self.whichPlayerLabel.text = @"X";
    self.whichPlayerLabel.textColor = [UIColor blueColor];
}

-(UILabel *)findLabelUsingPoint:(CGPoint )point {

    if (CGRectContainsPoint(self.labelOne.frame, point)) {
        return self.labelOne;
    }
    else if (CGRectContainsPoint(self.labelTwo.frame, point)) {
        return self.labelTwo;
    }
    else if (CGRectContainsPoint(self.labelThree.frame, point)) {
        return self.labelThree;
    }
    else if (CGRectContainsPoint(self.labelFour.frame, point)) {
        return self.labelFour;
    }
    else if (CGRectContainsPoint(self.labelFive.frame, point)) {
        return self.labelFive;
    }
    else if (CGRectContainsPoint(self.labelSix.frame, point)) {
        return self.labelSix;
    }
    else if (CGRectContainsPoint(self.labelSeven.frame, point)) {
        return self.labelSeven;
    }
    else if (CGRectContainsPoint(self.labelEight.frame, point)) {
        return self.labelEight;
    }
    else if (CGRectContainsPoint(self.labelNine.frame, point)) {
        return self.labelNine;
    } else {
        return nil;
    }
}

-(IBAction)labelTapped:(UITapGestureRecognizer *)tapGestureRecognizer{
    self.tappedPoint = [tapGestureRecognizer locationInView:self.view];
    UILabel *label = [self findLabelUsingPoint:self.tappedPoint];
    if ([label.text isEqualToString:@""]) {
        [self turnMethod:label];
    }
}


-(void)turnMethod:(UILabel *)currentLabel {

    if (self.turnCount % 2 == 0) {
        currentLabel.text = @"X";
        currentLabel.textColor = [UIColor blueColor];
        currentLabel.font = [UIFont fontWithName:@"Arial" size:80];
        self.turnCount ++;
        self.whichPlayerLabel.text = @"O";
        self.whichPlayerLabel.textColor = [UIColor redColor];
        [self whoWon];
    }
    else {
        currentLabel.text = @"O";
        currentLabel.textColor = [UIColor redColor];
        currentLabel.font = [UIFont fontWithName:@"Arial" size:80];
        self.turnCount ++;
        self.whichPlayerLabel.text = @"X";
        self.whichPlayerLabel.textColor = [UIColor blueColor];
        [self whoWon];
    }

}

-(void)whoWon{

    if (([self.labelOne.text isEqual:@"X"] && [self.labelTwo.text isEqual: @"X"] && [self.labelThree.text isEqual: @"X"]) || ([self.labelFour.text isEqual: @"X"] && [self.labelFive.text isEqual: @"X"] && [self.labelSix.text isEqual: @"X"]) || ([self.labelSeven.text  isEqual: @"X"] && [self.labelEight.text  isEqual: @"X"] && [self.labelNine.text  isEqual: @"X"]) || ([self.labelOne.text isEqual: @"X"] && [self.labelFour.text isEqual: @"X"] && [self.labelSeven.text isEqual: @"X"]) || ([self.labelTwo.text isEqual: @"X"] && [self.labelFive.text isEqual: @"X"] && [self.labelEight.text isEqual: @"X"]) || ([self.labelThree.text isEqual: @"X"] && [self.labelSix.text isEqual: @"X"] && [self.labelNine.text isEqual: @"X"]) || ([self.labelOne.text isEqual: @"X"] && [self.labelFive.text  isEqual: @"X"] && [self.labelNine.text isEqual: @"X"]) || ([self.labelThree.text isEqual: @"X"] && [self.labelFive.text isEqual: @"X"] && [self.labelSeven.text  isEqual: @"X"])) {

        [self winningAlert:@"X won!"];
    }
    else if (([self.labelOne.text isEqual:@"O"] && [self.labelTwo.text isEqual: @"O"] && [self.labelThree.text isEqual: @"O"]) || ([self.labelFour.text isEqual: @"O"] && [self.labelFive.text isEqual: @"O"] && [self.labelSix.text isEqual: @"O"]) || ([self.labelSeven.text  isEqual: @"O"] && [self.labelEight.text  isEqual: @"O"] && [self.labelNine.text  isEqual: @"O"]) || ([self.labelOne.text isEqual: @"O"] && [self.labelFour.text isEqual: @"O"] && [self.labelSeven.text isEqual: @"O"]) || ([self.labelTwo.text isEqual: @"O"] && [self.labelFive.text isEqual: @"O"] && [self.labelEight.text isEqual: @"O"]) || ([self.labelThree.text isEqual: @"O"] && [self.labelSix.text isEqual: @"O"] && [self.labelNine.text isEqual: @"O"]) || ([self.labelOne.text isEqual: @"O"] && [self.labelFive.text  isEqual: @"O"] && [self.labelNine.text isEqual: @"O"]) || ([self.labelThree.text isEqual: @"O"] && [self.labelFive.text isEqual: @"O"] && [self.labelSeven.text  isEqual: @"O"])) {

        [self winningAlert:@"O won!"];

    } else if (self.turnCount == 9) {

        [self catGameAlert:@"Cat game"];
    }
    
}

-(void)winningAlert:(NSString *)congratulations {
    UIAlertController *victoryAlert = [UIAlertController alertControllerWithTitle:congratulations message:nil preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *newGameButton = [UIAlertAction actionWithTitle:@"New Game" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self resetGame];
    }];
    [victoryAlert addAction:newGameButton];
    [self presentViewController:victoryAlert animated:YES completion:nil];
}

-(void)catGameAlert:(NSString *)catGameString {
    UIAlertController *catGameAlert = [UIAlertController alertControllerWithTitle:catGameString message:nil preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction *newGameButton = [UIAlertAction actionWithTitle:@"New Game" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self resetGame];
    }];
    [catGameAlert addAction:newGameButton];
    [self presentViewController:catGameAlert animated:YES completion:nil];
}

-(void)resetGame{
    self.labelOne.text = @"";
    self.labelTwo.text = @"";
    self.labelThree.text = @"";
    self.labelFour.text = @"";
    self.labelFive.text = @"";
    self.labelSix.text = @"";
    self.labelSeven.text = @"";
    self.labelEight.text = @"";
    self.labelNine.text = @"";
}

//-(IBAction)panGesture:(UIPanGestureRecognizer *)panGestureRecognizer{
//    CGPoint point = [panGestureRecognizer locationInView:self.view];
//    self.whichPlayerLabel.center = point;
//
//    if ([panGestureRecognizer ]) {
//        <#statements#>
//    }
//
//}


@end
