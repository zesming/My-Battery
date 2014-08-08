//
//  BIDAboutViewController.m
//  See My Battery
//
//  Created by Ming on 14-7-24.
//  Copyright (c) 2014年 Ming. All rights reserved.
//

#import "BIDAboutViewController.h"

@interface BIDAboutViewController ()

@end

@implementation BIDAboutViewController

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
    // Do any additional setup after loading the view.
    [self setTextView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.mainScrollView.contentSize = CGSizeMake(320, 650);
    
}

- (void)setTextView
{
    NSString *appText, *meText;
    appText = [[NSString alloc] initWithFormat:NSLocalizedString(@"This is a APP with ChargingHelper, to display some information of the battery. It displays some of the data, and will be refreshed once every few seconds.", @"about app text")];
    self.appTextView.text = appText;
    
    meText = [[NSString alloc] initWithFormat:NSLocalizedString(@"A Chinese Developer, self-study iOS development, just to make the favorite features to become a reality! Advocating free and open source, of course, welcome to donate!", @"about me text")];
    self.meTextView.text = meText;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
