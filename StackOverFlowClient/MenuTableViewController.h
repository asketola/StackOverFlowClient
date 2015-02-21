//
//  MenuTableViewController.h
//  StackOverFlowClient
//
//  Created by Annemarie Ketola on 2/17/15.
//  Copyright (c) 2015 Up Early, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MenuPressedDelegate.h"

@interface MenuTableViewController : UITableViewController

@property (weak, nonatomic) id<MenuPressedDelegate> delegate;

@end
