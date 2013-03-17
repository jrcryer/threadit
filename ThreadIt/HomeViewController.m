//
//  ViewController.m
//  ThreadIt
//
//  Created by James Cryer on 17/03/2013.
//  Copyright (c) 2013 James Cryer. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize label1 = _label1,
            label2 = _label2,
            label3 = _label3;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    queue = [[NSOperationQueue alloc] init];
    
    NSInvocationOperation *counterOp = [[NSInvocationOperation alloc] initWithTarget:self
                                                                           selector:@selector(counterTask)
                                                                             object:nil];
    [queue addOperation:counterOp];
    NSInvocationOperation *colorOp = [[NSInvocationOperation alloc] initWithTarget:self
                                                                            selector:@selector(colorRatatorTask)
                                                                              object:nil];
    [queue addOperation:colorOp];
    
}

#pragma mark - Operations

- (void)counterTask
{
    for (int i = 0; i < 10000000; i++) {
        if (i % 100 == 0) {
            [_label1 performSelectorOnMainThread:@selector(setText:)
                                     withObject:[NSString stringWithFormat:@"%d", i]
                                  waitUntilDone:YES];
        }
    }
    [_label1 performSelectorOnMainThread:@selector(setText:) withObject:@"Thread #1 finished" waitUntilDone:NO];
}

- (void)colorRatatorTask
{
    UIColor *customColor;
    
    for (int i=0; i < 500; i++) {
        
        float redColorValue = (arc4random() % 100) * 1.0 / 100;
        float greenColorValue = (arc4random() % 100) * 1.0 / 100;
        float blueColorValue = (arc4random() % 100) * 1.0 / 100;
        
        customColor = [UIColor colorWithRed:redColorValue green:greenColorValue blue:blueColorValue alpha:1.0];
        
        [_label2 performSelectorOnMainThread:@selector(setBackgroundColor:) withObject:customColor waitUntilDone:YES];
        
        [_label3 performSelectorOnMainThread:@selector(setText:)
                                 withObject:[NSString stringWithFormat:@"Red: %.2f\nGreen: %.2f\nBlue: %.2f\nIteration #: %d", redColorValue, greenColorValue, blueColorValue, i]
                              waitUntilDone:YES];
        
        [NSThread sleepForTimeInterval:0.4];
    }
    [_label3 performSelectorOnMainThread:@selector(setText:) withObject:@"Thread #2 has finished." waitUntilDone:NO];
}

#pragma mark - Actions

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)didPressFirstColor:(id)sender {
    [self.view setBackgroundColor:[UIColor colorWithRed:255.0/255.0 green:204.0/255.0 blue:102.0/255.0 alpha:1.0]];
}

- (IBAction)didPressSecondColor:(id)sender {
    [self.view setBackgroundColor:[UIColor colorWithRed:204.0/255.0 green:255.0/255.0 blue:102.0/255.0 alpha:1.0]];
}

- (IBAction)didPressThirdColor:(id)sender {
    [self.view setBackgroundColor:[UIColor whiteColor]];
}

@end
