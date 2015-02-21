//
//  Profile.h
//  StackOverFlowClient
//
//  Created by Annemarie Ketola on 2/21/15.
//  Copyright (c) 2015 Up Early, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Profile : NSObject

+(NSArray *)profileFromJson:(NSData *)jsconProfileData;

@property (strong, nonatomic) NSString *website;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *age;
@property (strong, nonatomic) NSString *profileViews;
@property (strong, nonatomic) NSString *questionCount;
@property (strong, nonatomic) NSString *answerCount;
@property (strong, nonatomic) NSString *reputation;
@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *avatarURL;
@property (strong, nonatomic) UIImage *userAvatar;
@property (strong, nonatomic) NSString *userDescription;









@end
