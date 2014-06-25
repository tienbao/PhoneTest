//
//  PhoneViewController.h
//  PhoneTest
//
//  Created by Tien Bao Nguyen on 6/25/14.
//  Copyright (c) 2014 TSO. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CountryPicker.h"

@interface PhoneViewController : UIViewController <CountryPickerDelegate>

@property (nonatomic, retain) IBOutlet UITextField * tfPhoneNumber;
@property (nonatomic, retain) IBOutlet UILabel * lbValid;
@property (nonatomic, retain) IBOutlet CountryPicker * picker;
@end
