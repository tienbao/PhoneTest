//
//  PhoneViewController.m
//  PhoneTest
//
//  Created by Tien Bao Nguyen on 6/25/14.
//  Copyright (c) 2014 TSO. All rights reserved.
//

#import "PhoneViewController.h"
#import "NBPhoneNumberUtil.h"
@interface PhoneViewController ()

@end

@implementation PhoneViewController
@synthesize lbValid, tfPhoneNumber, picker;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [tfPhoneNumber addTarget:self action:@selector(editingChanged:) forControlEvents:UIControlEventEditingChanged];
    [picker setSelectedCountryCode:@"VN"];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                   initWithTarget:self
                                   action:@selector(dismissKeyboard)];
    
    [self.view addGestureRecognizer:tap];
}

- (void)dismissKeyboard
{
    [tfPhoneNumber resignFirstResponder];
}

- (void)countryPicker:(__unused CountryPicker *)picker didSelectCountryWithName:(NSString *)name code:(NSString *)code
{
    [tfPhoneNumber setText:@""];
    [lbValid setText:@""];
}

- (void) editingChanged:(id) sender
{
    NBPhoneNumberUtil *phoneUtil = [NBPhoneNumberUtil sharedInstance];
    
    NSError *aError = nil;
    NBPhoneNumber *myNumber = [phoneUtil parse:tfPhoneNumber.text
                                 defaultRegion:picker.selectedCountryCode error:&aError];
    NSLog(@"Country Code: %@", picker.selectedCountryCode);
    
    if (aError == nil) {
        
        if ([phoneUtil isValidNumber:myNumber])
        {
            [lbValid setText:@"is valid"];
            [lbValid setTextColor:[UIColor blueColor]];
        }
        else
        {
            [lbValid setText:@"is not valid"];
            [lbValid setTextColor:[UIColor redColor]];
        }
        
        
    } else {
        NSLog(@"Error : %@", [aError localizedDescription]);
    }
    
    if ([tfPhoneNumber.text isEqualToString:@""])
    {
        [lbValid setText:@""];
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
