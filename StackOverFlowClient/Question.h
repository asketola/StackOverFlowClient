//
//  Question.h
//  StackOverFlowClient
//
//  Created by Annemarie Ketola on 2/17/15.
//  Copyright (c) 2015 Up Early, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Question : NSObject

+(NSArray *)questionsFromJson:(NSData *)jsconData;

@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *avatarURL;
@property (strong, nonatomic) UIImage *image;

@end
