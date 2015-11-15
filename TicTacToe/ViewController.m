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
@property (weak, nonatomic) IBOutlet UILabel *timerLabel;

@property CGPoint tappedPoint;
@property int turnCount;

@property int secondsInt;
@property NSTimer *countDownTimer;


@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self resetGame];

}

- (IBAction)unwindToMainMenu:(UIStoryboardSegue *)sender
{
//    UIViewController *viewController = sender.sourceViewController;
//    // Pull any data from the view controller which initiated the unwind segue.
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
        self.secondsInt = 11;
    }

}


-(void)turnMethod:(UILabel *)currentLabel {

   if (self.turnCount % 2 == 0) {

        currentLabel.text = @"X";
        currentLabel.textColor = [UIColor blueColor];
        currentLabel.font = [UIFont fontWithName:@"Arial" size:85];
        self.whichPlayerLabel.text = @"O";
        self.whichPlayerLabel.textColor = [UIColor redColor];
        self.whichPlayerLabel.font = [UIFont fontWithName:@"Arial" size:20];
        self.turnCount ++;
        [self whoWon];

    }
    else {

        currentLabel.text = @"O";
        currentLabel.textColor = [UIColor redColor];
        currentLabel.font = [UIFont fontWithName:@"Arial" size:85];
        self.whichPlayerLabel.text = @"X";
        self.whichPlayerLabel.textColor = [UIColor blueColor];
        self.whichPlayerLabel.font = [UIFont fontWithName:@"Arial" size:20];
        self.turnCount ++;
        [self whoWon];

    }

}

-(void)whoWon{

    if (([self.labelOne.text isEqual:@"X"] && [self.labelTwo.text isEqual: @"X"] && [self.labelThree.text isEqual: @"X"]) ||
        ([self.labelFour.text isEqual: @"X"] && [self.labelFive.text isEqual: @"X"] && [self.labelSix.text isEqual: @"X"]) ||
        ([self.labelSeven.text  isEqual: @"X"] && [self.labelEight.text  isEqual: @"X"] && [self.labelNine.text  isEqual: @"X"]) ||
        ([self.labelOne.text isEqual: @"X"] && [self.labelFour.text isEqual: @"X"] && [self.labelSeven.text isEqual: @"X"]) ||
        ([self.labelTwo.text isEqual: @"X"] && [self.labelFive.text isEqual: @"X"] && [self.labelEight.text isEqual: @"X"]) ||
        ([self.labelThree.text isEqual: @"X"] && [self.labelSix.text isEqual: @"X"] && [self.labelNine.text isEqual: @"X"]) ||
        ([self.labelOne.text isEqual: @"X"] && [self.labelFive.text  isEqual: @"X"] && [self.labelNine.text isEqual: @"X"]) ||
        ([self.labelThree.text isEqual: @"X"] && [self.labelFive.text isEqual: @"X"] && [self.labelSeven.text  isEqual: @"X"])) {

        [self.countDownTimer invalidate];
        self.countDownTimer = nil;
        self.whichPlayerLabel.hidden = YES;
        self.timerLabel.hidden = YES;
        [self winningAlert:@"X won!"];
        
    } else if (([self.labelOne.text isEqual:@"O"] && [self.labelTwo.text isEqual: @"O"] && [self.labelThree.text isEqual: @"O"]) ||
        ([self.labelFour.text isEqual: @"O"] && [self.labelFive.text isEqual: @"O"] && [self.labelSix.text isEqual: @"O"]) ||
        ([self.labelSeven.text  isEqual: @"O"] && [self.labelEight.text  isEqual: @"O"] && [self.labelNine.text  isEqual: @"O"]) ||
        ([self.labelOne.text isEqual: @"O"] && [self.labelFour.text isEqual: @"O"] && [self.labelSeven.text isEqual: @"O"]) ||
        ([self.labelTwo.text isEqual: @"O"] && [self.labelFive.text isEqual: @"O"] && [self.labelEight.text isEqual: @"O"]) ||
        ([self.labelThree.text isEqual: @"O"] && [self.labelSix.text isEqual: @"O"] && [self.labelNine.text isEqual: @"O"]) ||
        ([self.labelOne.text isEqual: @"O"] && [self.labelFive.text  isEqual: @"O"] && [self.labelNine.text isEqual: @"O"]) ||
        ([self.labelThree.text isEqual: @"O"] && [self.labelFive.text isEqual: @"O"] && [self.labelSeven.text  isEqual: @"O"])) {

        [self.countDownTimer invalidate];
        self.countDownTimer = nil;
        self.whichPlayerLabel.hidden = YES;
        self.timerLabel.hidden = YES;
        [self winningAlert:@"O won!"];

    } else if (
               ([self.labelOne.text isEqualToString:@"X"] || [self.labelOne.text isEqualToString:@"O"]) &&
               ([self.labelTwo.text isEqualToString:@"X"] || [self.labelTwo.text isEqualToString:@"O"]) &&
               ([self.labelThree.text isEqualToString:@"X"] || [self.labelThree.text isEqualToString:@"O"]) &&
               ([self.labelFour.text isEqualToString:@"X"] || [self.labelFour.text isEqualToString:@"O"]) &&
               ([self.labelFive.text isEqualToString:@"X"] || [self.labelFive.text isEqualToString:@"O"]) &&
               ([self.labelSix.text isEqualToString:@"X"] || [self.labelSix.text isEqualToString:@"O"]) &&
               ([self.labelSeven.text isEqualToString:@"X"] || [self.labelSeven.text isEqualToString:@"O"]) &&
               ([self.labelEight.text isEqualToString:@"X"] || [self.labelEight.text isEqualToString:@"O"]) &&
               ([self.labelNine.text isEqualToString:@"X"] || [self.labelNine.text isEqualToString:@"O"])) {

        [self.countDownTimer invalidate];
        self.countDownTimer = nil;
        self.whichPlayerLabel.hidden = YES;
        self.timerLabel.hidden = YES;
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

    self.turnCount = 0;
    self.whichPlayerLabel.text = @"X";
    self.whichPlayerLabel.textColor = [UIColor blueColor];
    self.whichPlayerLabel.font = [UIFont fontWithName:@"Arial" size:20];

    self.whichPlayerLabel.hidden = NO;
    self.timerLabel.hidden = NO;
    self.secondsInt = 11;
    self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDownMethod) userInfo:nil repeats:YES];
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

-(void)countDownMethod {

    self.secondsInt -= 1;
    self.timerLabel.text = [NSString stringWithFormat:@"%i", self.secondsInt];

    if ([self.timerLabel.text isEqualToString:@"0"]) {

        self.secondsInt = 11;
        [self turnMethod:self.whichPlayerLabel];

    }

}

-(IBAction)panGesture:(UIPanGestureRecognizer *)panGestureRecognizer{
    CGPoint point = [panGestureRecognizer locationInView:self.view];
    self.whichPlayerLabel.center = point;

/////labelOne

    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {

        if ([self.labelOne.text isEqualToString:@""]) {

            if (CGRectContainsPoint(self.labelOne.frame, point)) {
                NSLog(@"logged");
                self.labelOne.text = self.whichPlayerLabel.text;

                if ([self.labelOne.text isEqualToString:@"X"]) {
                    self.labelOne.textColor = [UIColor blueColor];
                    self.labelOne.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
                else {
                    self.labelOne.textColor = [UIColor redColor];
                    self.labelOne.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
            }
        }
    }

/////labelTwo

    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {

        if ([self.labelTwo.text isEqualToString:@""]) {

            if (CGRectContainsPoint(self.labelTwo.frame, point)) {
                NSLog(@"logged");
                self.labelTwo.text = self.whichPlayerLabel.text;

                if ([self.labelTwo.text isEqualToString:@"X"]) {
                    self.labelTwo.textColor = [UIColor blueColor];
                    self.labelTwo.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
                else {
                    self.labelTwo.textColor = [UIColor redColor];
                    self.labelTwo.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
            }
        }
    }

/////labelThree

    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {

        if ([self.labelThree.text isEqualToString:@""]) {

            if (CGRectContainsPoint(self.labelThree.frame, point)) {
                NSLog(@"logged");
                self.labelThree.text = self.whichPlayerLabel.text;

                if ([self.labelThree.text isEqualToString:@"X"]) {
                    self.labelThree.textColor = [UIColor blueColor];
                    self.labelThree.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
                else {
                    self.labelThree.textColor = [UIColor redColor];
                    self.labelThree.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
            }
        }
    }

/////labelFour

    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {

        if ([self.labelFour.text isEqualToString:@""]) {

            if (CGRectContainsPoint(self.labelFour.frame, point)) {
                NSLog(@"logged");
                self.labelFour.text = self.whichPlayerLabel.text;

                if ([self.labelFour.text isEqualToString:@"X"]) {
                    self.labelFour.textColor = [UIColor blueColor];
                    self.labelFour.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
                else {
                    self.labelFour.textColor = [UIColor redColor];
                    self.labelFour.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
            }
        }
    }

/////labelFive

    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {

        if ([self.labelFive.text isEqualToString:@""]) {

            if (CGRectContainsPoint(self.labelFive.frame, point)) {
                NSLog(@"logged");
                self.labelFive.text = self.whichPlayerLabel.text;

                if ([self.labelFive.text isEqualToString:@"X"]) {
                    self.labelFive.textColor = [UIColor blueColor];
                    self.labelFive.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
                else {
                    self.labelFive.textColor = [UIColor redColor];
                    self.labelFive.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
            }
        }
    }

/////labelSix

    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {

        if ([self.labelSix.text isEqualToString:@""]) {

            if (CGRectContainsPoint(self.labelSix.frame, point)) {
                NSLog(@"logged");
                self.labelSix.text = self.whichPlayerLabel.text;

                if ([self.labelSix.text isEqualToString:@"X"]) {
                    self.labelSix.textColor = [UIColor blueColor];
                    self.labelSix.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
                else {
                    self.labelSix.textColor = [UIColor redColor];
                    self.labelSix.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
            }
        }
    }

/////labelSeven

    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {

        if ([self.labelSeven.text isEqualToString:@""]) {

            if (CGRectContainsPoint(self.labelSeven.frame, point)) {
                NSLog(@"logged");
                self.labelSeven.text = self.whichPlayerLabel.text;

                if ([self.labelSeven.text isEqualToString:@"X"]) {
                    self.labelSeven.textColor = [UIColor blueColor];
                    self.labelSeven.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
                else {
                    self.labelSeven.textColor = [UIColor redColor];
                    self.labelSeven.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
            }
        }
    }

/////labelEight

    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {

        if ([self.labelEight.text isEqualToString:@""]) {

            if (CGRectContainsPoint(self.labelEight.frame, point)) {
                NSLog(@"logged");
                self.labelEight.text = self.whichPlayerLabel.text;

                if ([self.labelEight.text isEqualToString:@"X"]) {
                    self.labelEight.textColor = [UIColor blueColor];
                    self.labelEight.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
                else {
                    self.labelEight.textColor = [UIColor redColor];
                    self.labelEight.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
            }
        }
    }

/////labelNine

    if (panGestureRecognizer.state == UIGestureRecognizerStateEnded) {

        if ([self.labelNine.text isEqualToString:@""]) {

            if (CGRectContainsPoint(self.labelNine.frame, point)) {
                NSLog(@"logged");
                self.labelNine.text = self.whichPlayerLabel.text;

                if ([self.labelNine.text isEqualToString:@"X"]) {
                    self.labelNine.textColor = [UIColor blueColor];
                    self.labelNine.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
                else {
                    self.labelNine.textColor = [UIColor redColor];
                    self.labelNine.font = [UIFont fontWithName:@"Arial" size:85];
                    self.secondsInt = 11;
                    [self turnMethod:self.whichPlayerLabel];
                }
            }
        }
    }
}

//PLAY AS COMPUTER




    

@end
