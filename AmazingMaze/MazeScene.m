//
//  MazeScene.m
//  AmazingMaze
//
//  Created by Emily Stansbury on 7/22/13.
//  Copyright (c) 2013 Emily Stansbury. All rights reserved.
//

#import "MazeScene.h"
#import "WinScene.h"

@interface MazeScene ()

@property BOOL contentCreated;
//@property (strong, nonatomic) CGPoint *touchLocation;
@end


@implementation MazeScene


-(void)didMoveToView:(SKView *)view
{
    if(!self.contentCreated)
    {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}



-(void)createSceneContents
{
    self.backgroundColor = [SKColor whiteColor];
    self.scaleMode = SKSceneScaleModeAspectFit;
    SKNode *maze = [self newMazeNode];
    //[self addChild:maze];
    [self addChild:[self newPlayerNode]];
    [[self physicsWorld] setGravity:CGPointMake(0.0, 0.0)];
    
}




-(SKSpriteNode *)newPlayerNode
{
    SKSpriteNode *player = [[SKSpriteNode alloc] initWithColor:[SKColor redColor] size:CGSizeMake(60, 60)];
    [player setPhysicsBody:[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(60, 60)]];
    [player setPosition:CGPointMake(70, 318)];
    [player setName:@"player"];
    return player;
}

-(SKNode *)newMazeNode
{
    //This comment is leftover from an earlier version. I've left it here for
    //a redesign later
    
    /*CGMutablePathRef mazePath = CGPathCreateMutable();
    CGPathMoveToPoint(mazePath, NULL, 20, 268);
    CGPathAddLineToPoint(mazePath, NULL, 20, 868);
    CGPathAddLineToPoint(mazePath, NULL, 520, 868);
    CGPathMoveToPoint(mazePath, NULL, 520, 868);
    CGPathAddLineToPoint(mazePath, NULL, 520, 368);
    CGPathMoveToPoint(mazePath, NULL, 520, 368);
    CGPathAddLineToPoint(mazePath, NULL, 420, 368);
    CGPathMoveToPoint(mazePath, NULL, 420, 368);
    CGPathAddLineToPoint(mazePath, NULL, 420, 568);
    
    CGPathMoveToPoint(mazePath, NULL, 120, 268);
    CGPathAddLineToPoint(mazePath, NULL, 120, 768);
    CGPathMoveToPoint(mazePath, NULL, 120, 768);
    CGPathAddLineToPoint(mazePath, NULL, 220, 768);
    CGPathAddLineToPoint(mazePath, NULL, 220, 568);
    CGPathMoveToPoint(mazePath, NULL, 320, 768);
    CGPathAddLineToPoint(mazePath, NULL, 320, 368);
    CGPathMoveToPoint(mazePath, NULL, 320, 368);
    CGPathAddLineToPoint(mazePath, NULL, 420, 368);
    
    CGPathMoveToPoint(mazePath, NULL, 120, 268);
    CGPathAddLineToPoint(mazePath, NULL, 220, 268);
    CGPathMoveToPoint(mazePath, NULL, 220, 268);
    CGPathAddLineToPoint(mazePath, NULL, 220, 468);
    CGPathMoveToPoint(mazePath, NULL, 220, 268);
    CGPathAddLineToPoint(mazePath, NULL, 620, 268);
    CGPathMoveToPoint(mazePath, NULL, 620, 268);
    CGPathAddLineToPoint(mazePath, NULL, 620, 868);
    
    SKShapeNode *firstWall = [[SKShapeNode alloc] init];
    [firstWall setPath:mazePath];
    [firstWall setStrokeColor:[SKColor blackColor]];

    [firstWall setPhysicsBody:[SKPhysicsBody bodyWithEdgeChainFromPath:mazePath]];
    firstWall.physicsBody.dynamic = NO;
    [self addChild:firstWall];*/
    
    
    
    
    SKSpriteNode *wall = [[SKSpriteNode alloc] initWithColor: [SKColor blackColor] size:CGSizeMake(10, 600)];
    [wall setPosition:CGPointMake(20, 568)];
    [wall setPhysicsBody:[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(10, 600)]];
    wall.physicsBody.dynamic = NO;
    [self addChild:wall];
    
    
    wall = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(10, 500)];
    [wall setPosition:CGPointMake(120, 518)];
    [wall setPhysicsBody:[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(10, 500)]];
    wall.physicsBody.dynamic = NO;
    [self addChild:wall];
    
    wall = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(500, 10)];
    [wall setPosition:CGPointMake(270, 868)];
    [wall setPhysicsBody:[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(500, 10)]];
    wall.physicsBody.dynamic = NO;
    [self addChild:wall];
    
    wall = [[SKSpriteNode alloc] initWithColor:[SKColor blackColor] size:CGSizeMake(500, 10)];
    [wall setPosition:CGPointMake(370, 768)];
    [wall setPhysicsBody:[SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(500, 10)]];
    wall.physicsBody.dynamic = NO;
    [self addChild:wall];
    
    
    return wall;
    
    
}



-(void)didBeginContact:(SKPhysicsContact *)contact
{
    [[contact bodyA] setVelocity:CGPointZero];
    [[contact bodyB] setVelocity:CGPointZero];
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SKNode * player =[self childNodeWithName:@"player"];
    CGPoint tLoc = [[touches anyObject] locationInNode:self];
    CGPoint pLoc = [player position];
    
    float xDiff = tLoc.x-pLoc.x;
    float yDiff = tLoc.y-pLoc.y;
    float scale = 3.0;
    
    [[player physicsBody] applyForce:CGPointMake(scale*xDiff, scale*yDiff)];
    
    //SKAction *move = [SKAction moveTo:tLoc duration:2];
    //[(SKSpriteNode*)[self childNodeWithName:@"player"] runAction:move];
}


-(void) update:(NSTimeInterval)currentTime
{
    [super update:currentTime];
    [self checkWon];
}



-(void)checkWon
{
    SKNode *player = [self childNodeWithName:@"player"];
    if(player.position.y >= 868)
    {
        SKScene *won = [[WinScene alloc] initWithSize:CGSizeMake(640, 1136)];
        //SKTransition *doors = [SKTransition doorsOpenVerticalWithDuration:0.5];
        [self.view presentScene:won];// transition:doors];
    }
}







@end
