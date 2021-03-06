//
//  ViewController.m
//  TipCalculator
//
//  Created by Dorian Holmes on 6/26/18.
//  Copyright © 2018 Dorian Holmes. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;

@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipController;
@property (weak, nonatomic) IBOutlet UILabel *leftTotalLab;

@property (weak, nonatomic) IBOutlet UILabel *LeftTipLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)OnTap:(id)sender {
    NSLog(@"Hello");
          [self.view endEditing:YES];
}
- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    NSArray *percentages = @[@(0.1), @(0.15),@(0.2), @(0.25)];
    
    double tipPercentage = [percentages[self.tipController.selectedSegmentIndex] doubleValue];
    
    double tip = tipPercentage * bill;
    double total = bill + tip;
    
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f",tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f" , total ];
}
- (IBAction)onEditBegin:(id)sender {
    
     [UIView animateWithDuration: 1 animations:^{
         self.billField.frame = CGRectMake(self.billField.frame.origin.x,self.billField.frame.origin.y + 75, self.billField.frame.size.width, self.billField.frame.size.height);
     }];
         
    [UIView animateWithDuration: 0.5 animations:^{ self.tipLabel.alpha = 0;self.tipLabel.alpha = 0; self.totalLabel.alpha=0; self.tipController.alpha=0; self.totalLabel.alpha=0;self.tipLabel.alpha=0; self.leftTotalLab.alpha=0; self.LeftTipLabel.alpha=0;
        
    }];
}
- (IBAction)onEditingEnd:(id)sender {
    CGRect newFrame = self.billField.frame;
    newFrame.origin.y -= 75;
    
    [UIView animateWithDuration: 0.2 animations:^{ self.billField.frame = newFrame;
    }];
    
    [UIView animateWithDuration: 1 animations:^{ self.tipLabel.alpha = 1; self.totalLabel.alpha=1; self.tipController.alpha=1; self.totalLabel.alpha=1; self.tipLabel.alpha=1; self.LeftTipLabel.alpha = 1; self.leftTotalLab.alpha = 1;
    }];
    
}

@end
