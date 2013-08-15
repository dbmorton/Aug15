//
//  View.m
//  Aug15
//
//  Created by david morton on 8/15/13.
//  Copyright (c) 2013 David Morton Enterprises. All rights reserved.
//

#import "View.h"
#import "ViewController.h"

@implementation View

/*
 - (id) initWithFrame: (CGRect) frame
 {
 self = [super initWithFrame: frame];
 if (self) {
 // Initialization code
 }
 return self;
 }
 */

- (id) initWithFrame: (CGRect) frame viewController: (ViewController *__weak) vc
{
	self = [super initWithFrame: frame];
	if (self) {
		// Initialization code
		self.backgroundColor = [UIColor whiteColor];
			
		dateFormatter = [[NSDateFormatter alloc] init];
		[dateFormatter setDateStyle: NSDateFormatterShortStyle];
		[dateFormatter setTimeStyle: NSDateFormatterShortStyle];
		[dateFormatter setTimeZone:[NSTimeZone systemTimeZone]];
		
		 //Let the date picker assume its natural size.
		 datePicker = [[UIDatePicker alloc] initWithFrame: CGRectZero];
		 datePicker.datePickerMode = UIDatePickerModeDateAndTime; //vs. UIDatePickerModeTime
		 
		 //Center the picker in the DatePickerView.
		 CGRect b = self.bounds;
		 
		 datePicker.frame = CGRectMake(
		 b.origin.x,
		 b.origin.y,
		 datePicker.bounds.size.width,
		 datePicker.bounds.size.height
		 );
		 
		 [datePicker addTarget: self
		 action: @selector(valueChanged)
		 forControlEvents: UIControlEventValueChanged
		 ];
		 
		 [self addSubview: datePicker];
		 
		 //TextView occupies all of the View below the picker.
		 
		 CGRect f = CGRectMake(
		 b.origin.x,
		 b.origin.y + datePicker.bounds.size.height,
		 b.size.width,
		 b.size.height - datePicker.bounds.size.height
		 );
		 
		 textView = [[UITextView alloc] initWithFrame: f];
		 textView.editable = NO;
		 textView.font = [UIFont systemFontOfSize: 16];
		 [self valueChanged];
		 [self addSubview: textView];
	}
	
	return self;
}

- (void) valueChanged
{	NSMutableString *str=[[NSMutableString alloc] initWithString:@"Local Time: "];
	[dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"EST"]];
	[str appendString:[dateFormatter stringFromDate: datePicker.date]];
	
	[str appendString: @"\r\nParis Time: "];
	[dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"CEST"]];
	[str appendString:[dateFormatter stringFromDate: datePicker.date]];
	
	[str appendString: @"\r\nHong Kong Time: "];
	[dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"HKT"]];
	[str appendString:[dateFormatter stringFromDate: datePicker.date]];
	
	[str appendString: @"\r\nLondon Time: "];
	[dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"BST"]];
	[str appendString:[dateFormatter stringFromDate: datePicker.date]];
	
	[str appendString: @"\r\nHonolulu: "];
	[dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"HST"]];
	[str appendString:[dateFormatter stringFromDate: datePicker.date]];
	
	[str appendString: @"\r\nMoscow: "];
	[dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"MSD"]];
	[str appendString:[dateFormatter stringFromDate: datePicker.date]];
										
	textView.text = str;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void) drawRect: (CGRect) rect
 {
 // Drawing code
 }
 */

@end
