//
//  LDHgameplayScene.m
//  SpaceCat
//
//  Created by admin on 14/8/13.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "LDHgameplayScene.h"
#import "LDHmachineNode.h"
#import "LDHspaceCatNode.h"
#import "LDHprojectTileNode.h"

@implementation LDHgameplayScene
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        SKSpriteNode *backgnd = [SKSpriteNode spriteNodeWithImageNamed:@"background_1"];
        backgnd.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:backgnd];
        
        LDHmachineNode *machine = [LDHmachineNode machineAtPosition:
                                   CGPointMake(CGRectGetMidX(self.frame), 12)];
        
        [self addChild:machine];
        
        LDHspaceCatNode *spaceCat = [LDHspaceCatNode spaceCatAtPosition:CGPointMake(machine.position.x, machine.position.y-2)];
        [self addChild:spaceCat];
        
    }
    return self;
}
// runloop update

/* // gaming runloop for each every 60 secs till the game is finished or killed
 
 -(void)update:(NSTimeInterval)currentTime {
    NSLog(@"%f",fmod(currentTime, 60));
}
*/

// call method performTap:
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    for (UITouch *touch in touches){
        CGPoint position = [touch locationInNode:self];
        [self shootProjectileTowardsPosition:position];
    }
    
    
    
    // Type casting
    
    LDHmachineNode *machine = (LDHmachineNode *) [self childNodeWithName:@"machine"];
    [machine performTap];
    
}

- (void) shootProjectileTowardsPosition:(CGPoint)position {
    
    LDHspaceCatNode *spaceCat = (LDHspaceCatNode *) [self childNodeWithName:@"spaceCat"];
    [spaceCat performTap];
    
    LDHmachineNode *machine = (LDHmachineNode *) [self childNodeWithName:@"machine"];

    LDHprojectTileNode *projectile = [LDHprojectTileNode projectTileAtPosition:CGPointMake(machine.position.x, machine.position.y+machine.frame.size.height-10)];

    [self addChild:projectile];
    [projectile moveTowardsPosition:position];

}








@end
