//
//  BIDAboutViewController.h
//  See My Battery
//
//  Created by Ming on 14-7-24.
//  Copyright (c) 2014年 Ming. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BIDAboutViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;
@property (weak, nonatomic) IBOutlet UIView *introduceTextView;
@property (weak, nonatomic) IBOutlet UITextView *appTextView;
@property (weak, nonatomic) IBOutlet UITextView *meTextView;

- (void)setTextView;
@end
