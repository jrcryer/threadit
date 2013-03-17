//
//  ViewController.h
//  ThreadIt
//
//  Created by James Cryer on 17/03/2013.
//  Copyright (c) 2013 James Cryer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController {
    NSOperationQueue *queue;
}

@property (strong, nonatomic) IBOutlet UILabel *label1;
@property (strong, nonatomic) IBOutlet UILabel *label2;
@property (strong, nonatomic) IBOutlet UILabel *label3;

- (IBAction)didPressFirstColor:(id)sender;
- (IBAction)didPressSecondColor:(id)sender;
- (IBAction)didPressThirdColor:(id)sender;

- (void)counterTask;
- (void)colorRatatorTask;

@end
