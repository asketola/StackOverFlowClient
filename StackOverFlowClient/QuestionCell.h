//
//  QuestionCell.h
//  StackOverFlowClient
//
//  Created by Annemarie Ketola on 2/17/15.
//  Copyright (c) 2015 Up Early, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QuestionCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *avatarImage;
@property (weak, nonatomic) IBOutlet UITextView *questionResultsText;

@end
