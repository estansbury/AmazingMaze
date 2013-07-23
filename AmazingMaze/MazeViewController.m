//
//  MazeViewController.m
//  AmazingMaze
//
//  Created by Emily Stansbury on 7/22/13.
//  Copyright (c) 2013 Emily Stansbury. All rights reserved.
//

#import "MazeViewController.h"
#import "MazeScene.h"
#import <SpriteKit/SpriteKit.h>

@interface MazeViewController ()

@end

@implementation MazeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	SKView *mazeView = (SKView*) self.view;
    mazeView.showsNodeCount = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) viewWillAppear:(BOOL)animated
{
    MazeScene *maze = [[MazeScene alloc] initWithSize:CGSizeMake(640, 1136)];
    [((SKView *) self.view) presentScene:maze];
}



                                            
@end
