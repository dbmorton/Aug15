//
//  View.h
//  Aug15
//
//  Created by david morton on 8/15/13.
//  Copyright (c) 2013 David Morton Enterprises. All rights reserved.
//

#import <UIKit/UIKit.h>

#import <UIKit/UIKit.h>
@class ViewController;

@interface View: UIView {
	ViewController *__weak viewController;
	NSDateFormatter *dateFormatter;
	UIDatePicker *datePicker;
	UITextView *textView;

}

- (id) initWithFrame: (CGRect) frame viewController: (ViewController *__weak) vc;
@end
