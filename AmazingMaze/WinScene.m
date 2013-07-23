//
//  WinScene.m
//  AmazingMaze
//
//  Created by Emily Stansbury on 7/22/13.
//  Copyright (c) 2013 Emily Stansbury. All rights reserved.
//

#import "WinScene.h"


@interface WinScene ()

@property BOOL contentCreated;
-(void)createContent;

@end
@implementation WinScene




-(void)didMoveToView:(SKView *)view
{
    if(!_contentCreated)
    {
        [self createContent];
        [self setContentCreated:YES];
    }
}



-(void)createContent
{
    self.backgroundColor = [SKColor blueColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    SKLabelNode *won = [SKLabelNode labelNodeWithFontNamed:@"Calibri"];
    won.text = @"You Won!";
    won.fontSize = 45;
    won.fontColor = [SKColor whiteColor];
    won.position = CGPointMake(CGRectGetMidX(self.frame),CGRectGetMidY(self.frame));
    [self addChild:won];
}



@end
