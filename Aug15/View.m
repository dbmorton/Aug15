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
		[dateFormatter setDateStyle: NSDateFormatterMediumStyle];
		[dateFormatter setTimeStyle: NSDateFormatterShortStyle];
		 
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
	[str appendString:[dateFormatter stringFromDate: datePicker.date]];
	
	NSDate *newDate;
	NSDateComponents *dateComponents = [[NSCalendar currentCalendar] components:~ NSTimeZoneCalendarUnit fromDate:datePicker.date];
	newDate = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
	[dateComponents setTimeZone:[NSTimeZone timeZoneWithName:@"Europe/Paris"]];
	newDate = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
	
	[str appendString: @"\r\nParis Time: "];
	[str appendString:[dateFormatter stringFromDate: newDate]];
	
	dateComponents = [[NSCalendar currentCalendar] components:~ NSTimeZoneCalendarUnit fromDate:datePicker.date];
	newDate = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
	[dateComponents setTimeZone:[NSTimeZone timeZoneWithName:@"Australia/Sydney"]];
	newDate = [[NSCalendar currentCalendar] dateFromComponents:dateComponents];
	[str appendString: @"\r\nSydney Time: "];
	[str appendString:[dateFormatter stringFromDate: newDate]];

	
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
