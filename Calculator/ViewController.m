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

- (void)setText:(NSString *)s {
    [_outputLbl setText:s];
}

- (IBAction)numberPressed:(UIButton*)sender {
    if (_result) {
        _result = false;
        [_outputLbl setText:@""];
    }
    else {
        NSString *sym = [sender currentTitle];
        NSString *current = [_outputLbl text];
        NSString *lastChar = [current substringFromIndex:[current length] - 1];
        
        if([lastChar isEqualToString:@"."] && [sym isEqualToString:@"."])
            return;
    }
    
    [self insertText:[sender currentTitle]];
}

- (IBAction)symbolPressed:(id)sender {
    _result = false;
    NSArray *operators = @[@"+", @"-", @"x", @"/"];
    NSString *sym = [sender currentTitle];
    NSString *current = [_outputLbl text];
    NSString *lastChar = [current substringFromIndex:[current length] - 1];
    
    if([sym isEqualToString:lastChar])
        return;
    
    if([sym isEqualToString:@"("] && ![operators containsObject:lastChar]) {
        current = [[current stringByAppendingString:@"x"] stringByAppendingString:sym];
        [self setText:current];
        return;
    }
    
    if([operators containsObject:lastChar] && ![sym isEqualToString:@"("]) {
        printf("replace\n");
        NSRange range;
        range.location = [current length] - 1;
        range.length = 1;
        
        current = [current stringByReplacingCharactersInRange:range withString:sym];
        [self setText:current];
        return;
    }
    
    [self insertText:[sender currentTitle]];
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
    if([[_outputLbl text] isEqualToString:@"0.0"])
        return;
    
    if([[_outputLbl text] length] > 1) {
        [self setText: [[_outputLbl text] substringToIndex:[[_outputLbl text] length] - 1 ]];
    }
    else if([[_outputLbl text] length] == 1)
        [self setText:@"0.0"];

}
- (IBAction)clearPressed:(id)sender {
    [self setText:@"0.0"];
}
@end
