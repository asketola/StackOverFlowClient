//
//  StackOverFlowService.m
//  StackOverFlowClient
//
//  Created by Annemarie Ketola on 2/17/15.
//  Copyright (c) 2015 Up Early, LLC. All rights reserved.
//

#import "StackOverFlowService.h"
#import "Question.h"
#import "Profile.h"

@implementation StackOverFlowService

+(id)sharedService {
  static StackOverFlowService *mySharedService;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    mySharedService = [[StackOverFlowService alloc] init];
  });
  return mySharedService;
}

-(void)fetchQuestionWithSearchTerm:(NSString *)searchTerm completionHandler:(void (^)(NSArray *, NSString *))completionHandler {
  NSString *urlString = @"https://api.stackexchange.com/2.2/";
  urlString = [urlString stringByAppendingString:@"search?order=desc&sort=activity&site=stackoverflow&intitle="];
  urlString = [urlString stringByAppendingString:searchTerm];
  NSLog(@"searchTerm = %@", searchTerm);
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSString *token = [defaults objectForKey:@"token"];
  NSLog(@"token = %@", token);
  if (token) {
    urlString = [urlString stringByAppendingString:@"&access_token="];
    urlString = [urlString stringByAppendingString:token];
    urlString = [urlString stringByAppendingString:@"&key=HrZ5yeDUw2toURabicGccA(("];
}

  NSURL *url = [NSURL URLWithString:urlString];
  NSLog(@"urlString = %@", urlString);
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
  NSLog(@"request = %@", request);
  request.HTTPMethod = @"GET";
  NSURLSession *session = [NSURLSession sharedSession];
  
  NSURLSessionTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (error) {
      completionHandler(nil,@"Could not connect");
    } else {
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      NSInteger statusCode = httpResponse.statusCode;
      
      switch (statusCode) {
        case 200 ... 299: {
          NSLog(@"%ld", (long)statusCode);
          NSArray *results = [Question questionsFromJson:data];
          
          dispatch_async(dispatch_get_main_queue(), ^{
            if (results) {
              completionHandler(results, nil);
            } else {
              completionHandler(nil,@"Search could not be completed");
            }
          });
          break;
        }
        default:
          NSLog(@"%ld",(long)statusCode);
          break;
      }
    }
  }];
  [dataTask resume];
}

-(void)fetchUserImage:(NSString *)avatarURL completionHandler:(void (^)(UIImage *))completionHandler {
  dispatch_queue_t imageQueue = dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0);
//  dispatch_async(imageQueue, ^{
   dispatch_async(imageQueue, ^{
    NSURL *url = [NSURL URLWithString:avatarURL];
    NSData *data = [[NSData alloc] initWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
  dispatch_async(dispatch_get_main_queue(), ^{
    completionHandler(image);
  });
});
}

-(void)fetchProfile:(void (^)(NSArray *fetchedUserProfileResults, NSString *error))completionHandler{
  
  NSString *urlString = @"https://api.stackexchange.com/2.2/";
  urlString = [urlString stringByAppendingString:@"me?order=desc&sort=reputation&site=stackoverflow"];
//  NSLog(@"searchTerm = %@", userName);
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSString *token = [defaults objectForKey:@"token"];
//  NSLog(@"token = %@", token);
  if (token) {
    urlString = [urlString stringByAppendingString:@"&access_token="];
    urlString = [urlString stringByAppendingString:token];
    urlString = [urlString stringByAppendingString:@"&key=HrZ5yeDUw2toURabicGccA(("];
  }
  NSURL *url = [NSURL URLWithString:urlString];
  NSLog(@"urlString = %@", urlString);
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
  NSLog(@"request = %@", request);
  request.HTTPMethod = @"GET";
  NSURLSession *session = [NSURLSession sharedSession];
  
  NSURLSessionTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (error) {
      NSLog(@"There was an error");
      completionHandler(nil,@"Could not connect");
    } else {
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      NSInteger statusCode = httpResponse.statusCode;
      
      switch (statusCode) {
        case 200 ... 299: {
          NSLog(@"status code: %ld", (long)statusCode);
          NSArray *results = [Profile profileFromJson:data];
          
          dispatch_async(dispatch_get_main_queue(), ^{
            if (results) {
              completionHandler(results, nil);
            } else {
              completionHandler(nil,@"profile could not be found");
            }
          });
          break;
        }
        default:
          NSLog(@"%ld",(long)statusCode);
          break;
      }
    }
  }];
  [dataTask resume];
}

-(void)fetchSelectedUserProfile:(NSString *)selectedUser completionHandler:(void (^)(NSArray *, NSString *))completionHandler {
  NSString *urlString = @"https://api.stackexchange.com/2.2/";
  urlString = [urlString stringByAppendingString:selectedUser];
  NSLog(@"searchTerm = %@", selectedUser);
  urlString = [urlString stringByAppendingString:@"?order=desc&sort=reputation&site=stackoverflow"];
  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
  NSString *token = [defaults objectForKey:@"token"];
  NSLog(@"token = %@", token);
  if (token) {
    urlString = [urlString stringByAppendingString:@"&access_token="];
    urlString = [urlString stringByAppendingString:token];
    urlString = [urlString stringByAppendingString:@"&key=HrZ5yeDUw2toURabicGccA(("];
  }
  
  NSURL *url = [NSURL URLWithString:urlString];
  NSLog(@"urlString = %@", urlString);
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
  NSLog(@"request = %@", request);
  request.HTTPMethod = @"GET";
  NSURLSession *session = [NSURLSession sharedSession];
  
  NSURLSessionTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    if (error) {
      completionHandler(nil,@"Could not connect");
    } else {
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      NSInteger statusCode = httpResponse.statusCode;
      
      switch (statusCode) {
        case 200 ... 299: {
          NSLog(@"%ld", (long)statusCode);
          NSArray *results = [Question questionsFromJson:data];
          
          dispatch_async(dispatch_get_main_queue(), ^{
            if (results) {
              completionHandler(results, nil);
            } else {
              completionHandler(nil,@"Search could not be completed");
            }
          });
          break;
        }
        default:
          NSLog(@"%ld",(long)statusCode);
          break;
      }
    }
  }];
  [dataTask resume];
}

@end
