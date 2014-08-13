//
//  LDHmachineNode.m
//  SpaceCat
//
//  Created by admin on 14/8/13.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "LDHmachineNode.h"

@interface LDHmachineNode ()

@property (nonatomic) SKAction *tapAction;

@end

@implementation LDHmachineNode

+(instancetype) machineAtPosition:(CGPoint)position{
    
    LDHmachineNode *machine = [self spriteNodeWithImageNamed:@"machine_1"];
    machine.position = position;
    machine.anchorPoint = CGPointMake(0.5, 0);
    machine.name = @"machine";
    /*  machine repeating forever
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"machine_1"],
                           [SKTexture textureWithImageNamed:@"machine_2"]];
    
    SKAction *machineAnimation = [SKAction animateWithTextures:textures timePerFrame:0.2];
    
    SKAction *machineRepeat = [SKAction repeatActionForever:machineAnimation];
    
    [machine runAction:machineRepeat];
   */
    return machine;
}

// perform tapping action
-(void)performTap {
    [self runAction:self.tapAction];
}

// setup tapaction while screen is tapped.
- (SKAction *) tapAction {
    // tapped
    if (_tapAction != nil) {
        return _tapAction;
    }
    // hasnt tap
    
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"machine_1"],
                          [SKTexture textureWithImageNamed:@"machine_2"],
                          [SKTexture textureWithImageNamed:@"machine_1"]];
    
    _tapAction = [SKAction animateWithTextures:textures timePerFrame:0.15];
    
    return _tapAction;
}

@end
