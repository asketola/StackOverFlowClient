//
//  MenuPressedDelegate.h
//  StackOverFlowClient
//
//  Created by Annemarie Ketola on 2/18/15.
//  Copyright (c) 2015 Up Early, LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MenuPressedDelegate <NSObject>

-(void)menuOptionSelected:(NSInteger)selectedRow;

@end
