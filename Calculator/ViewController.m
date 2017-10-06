//
//  ViewController.m
//  Calculator
//
//  Created by Ayman Eldeeb on 9/28/17.
//  Copyright © 2017 Ayman Eldeeb. All rights reserved.
//

#import "ViewController.h"
#import <math.h>

@interface ViewController ()

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

- (void)insertText:(NSString *)s {
    if([[_outputLbl text] isEqualToString:@"0.0"])
        [_outputLbl setText:@""];
    
    [_outputLbl setText: [[_outputLbl text] stringByAppendingString:s ] ];
}

- (IBAction)numberPressed:(UIButton*)sender {
    if (_result) {
        _result = false;
        [_outputLbl setText:@""];
    }
    [self insertText:[sender currentTitle]];
}

- (IBAction)symbolPressed:(id)sender {
    [self insertText:[sender currentTitle]];
    _result = false;
}

- (IBAction)equalPressed:(id)sender {
    NSString *input = [[_outputLbl text] stringByReplacingOccurrencesOfString:@"x" withString:@"*"];
    printf("%s", [input UTF8String]);
    NSExpression *exp = [NSExpression expressionWithFormat:input];
    NSNumber *val = [exp expressionValueWithObject:nil context:nil];
    [_outputLbl setText: [val stringValue]];
    _result = true;
}

- (IBAction)deletePressed:(id)sender {
    if([[_outputLbl text] length] > 0)
        [_outputLbl setText: [[_outputLbl text] substringToIndex:[[_outputLbl text] length] - 1 ]];

}
- (IBAction)clearPressed:(id)sender {
    [_outputLbl setText:@"0.0"];
}
@end
