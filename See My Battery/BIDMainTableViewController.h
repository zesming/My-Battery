//
//  BIDMainTableViewController.h
//  See My Battery
//
//  Created by Ming on 14-7-24.
//  Copyright (c) 2014年 Ming. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BIDBatteryInfo.h"

@interface BIDMainTableViewController : UITableViewController
@property (strong, nonatomic) IBOutlet UITableView *mainTableView;

@property (weak, nonatomic) IBOutlet UILabel *deviceLabel;

@property (weak, nonatomic) IBOutlet UILabel *currentCap;
@property (weak, nonatomic) IBOutlet UILabel *maxCap;

@property (weak, nonatomic) IBOutlet UILabel *currentBatteryLevel;
@property (weak, nonatomic) IBOutlet UILabel *batteryTempLabel;

@property (weak, nonatomic) IBOutlet UILabel *chargingOrDrainingLabel;
@property (weak, nonatomic) IBOutlet UILabel *currentLabel;
@property (weak, nonatomic) IBOutlet UILabel *useOrRemainingLabel;
@property (weak, nonatomic) IBOutlet UILabel *remainingTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *batteryHeath;
@property (weak, nonatomic) IBOutlet UILabel *cycleLabel;

@property (weak, nonatomic) IBOutlet UILabel *designCap;

@property (weak, nonatomic) IBOutlet UILabel *voltageLabel;
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UILabel *fullyChargedLabel;


@property (strong, nonatomic) BIDBatteryInfo *batteryInfo;

@property (strong, nonatomic) NSTimer *refreshTimer;

- (void)setTableViewFrame;
- (NSString *)getDevicePlatform;
- (void)showBatteryInfo;

@end
