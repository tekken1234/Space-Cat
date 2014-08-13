//
//  LDHspaceCat.m
//  SpaceCat
//
//  Created by admin on 14/8/13.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "LDHspaceCatNode.h"

@interface LDHspaceCatNode ()

// below is private property
@property(nonatomic) SKAction *tapAction;

@end

@implementation LDHspaceCatNode

+ (instancetype) spaceCatAtPosition:(CGPoint)position{
    
    LDHspaceCatNode *spaceCat = [self spriteNodeWithImageNamed:@"spacecat_1"];
    spaceCat.position = position;
    spaceCat.anchorPoint = CGPointMake(0.5, 0);
    // childNodeWithName method
    spaceCat.name = @"spaceCat";
    
    return spaceCat;
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
    
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"spacecat_2"],
                          [SKTexture textureWithImageNamed:@"spacecat_1"]];

    _tapAction = [SKAction animateWithTextures:textures timePerFrame:0.25];

    return _tapAction;
}

@end
