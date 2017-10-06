//
//  ViewController.h
//  Calculator
//
//  Created by Ayman Eldeeb on 9/28/17.
//  Copyright © 2017 Ayman Eldeeb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)numberPressed:(id)sender;
- (IBAction)symbolPressed:(id)sender;

- (IBAction)equalPressed:(id)sender;
- (IBAction)deletePressed:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *outputLbl;
- (IBAction)clearPressed:(id)sender;

@property bool result;

- (void) insertText: (NSString*) s;

@end

