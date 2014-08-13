//
//  LDHMyScene.m
//  SpaceCat
//
//  Created by admin on 14/8/13.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "LDHMyScene.h"

@implementation LDHMyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        SKSpriteNode *greenNode =[SKSpriteNode spriteNodeWithColor:[SKColor greenColor] size:(CGSizeMake(100, 100))];
        
        greenNode.position = CGPointMake(0, 20);
        greenNode.anchorPoint = CGPointMake(0, 0);
        [self addChild:greenNode];
        
        SKSpriteNode *redNode = [SKSpriteNode spriteNodeWithColor:[SKColor redColor] size:(CGSizeMake(50 , 50))];
        
        redNode.position = CGPointMake(20, 0);
        redNode.anchorPoint = CGPointMake(0, 0);
        
        [self addChild:redNode];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        
        SKSpriteNode *sprite = [SKSpriteNode spriteNodeWithImageNamed:@"Spaceship"];
        
        sprite.position = location;
        
        SKAction *action = [SKAction rotateByAngle:3.14 duration:1];
        
        [sprite runAction:[SKAction repeatActionForever:action]];
        
        [self addChild:sprite];
    }
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
