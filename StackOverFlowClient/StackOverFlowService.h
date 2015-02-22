//
//  StackOverFlowService.h
//  StackOverFlowClient
//
//  Created by Annemarie Ketola on 2/17/15.
//  Copyright (c) 2015 Up Early, LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StackOverFlowService : NSObject

+(id)sharedService;

-(void)fetchQuestionWithSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray *results, NSString * error))completionHandler;

-(void)fetchUserImage:(NSString *)avatarURL completionHandler:(void (^) (UIImage *image))completionHandler;

-(void)fetchProfile:(void (^)(NSArray *fetchedUserProfileResults, NSString *error))completionHandler;

-(void)fetchSelectedUserProfile:(NSString *)selectedUser completionHandler:(void (^)(NSArray *results, NSString * error))completionHandler;

@end
