//
//  Question.m
//  StackOverFlowClient
//
//  Created by Annemarie Ketola on 2/17/15.
//  Copyright (c) 2015 Up Early, LLC. All rights reserved.
//

#import "Question.h"

@implementation Question

+(NSArray *)questionsFromJson:(NSData *)jsconData {
  
  NSError *error;
  NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:jsconData options:0 error:&error];
  if (error) {
    NSLog(@"%@", error.localizedDescription);
    return nil;
  }
  
  NSArray *items = [jsonDictionary objectForKey:@"items"];
  
  NSMutableArray *temp = [[NSMutableArray alloc] init];
  
  for (NSDictionary *item in items) {
    Question *question = [[Question alloc] init];
    question.title = item[@"title"];
    NSDictionary *userInfo = item[@"owner"];
    question.avatarURL = userInfo[@"profile_image"];
    question.userName = userInfo[@"display_name"];
    question.userID = userInfo[@"user_id"];
    
//    NSLog(@"userName: %@", question.userName);
//    NSLog(@"userID: %@", question.userID);
    
    [temp addObject:question];
  }
  NSArray *final = [[NSArray alloc] initWithArray:temp];
  return final;
}

@end
