//
//  LDHprojectTileNode.m
//  SpaceCat
//
//  Created by admin on 14/8/13.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "LDHprojectTileNode.h"
#import "LDHutil.h"


@implementation LDHprojectTileNode

+ (instancetype) projectTileAtPosition:(CGPoint)position{
    
    LDHprojectTileNode *projectile = [LDHprojectTileNode spriteNodeWithImageNamed:@"projectile_1"];
    projectile.position = position;
    
    // calling a method from a method cant use "self"
    [projectile projAnimation];
    
    return projectile;
}

- (void)projAnimation {
    NSArray *textures = @[[SKTexture textureWithImageNamed:@"projectile_1"],
                          [SKTexture textureWithImageNamed:@"projectile_2"],
                          [SKTexture textureWithImageNamed:@"projectile_3"]];


    SKAction *projAnimation = [SKAction animateWithTextures:textures timePerFrame:0.1];
    SKAction *repeatAction = [SKAction repeatActionForever:projAnimation];
    [self runAction:repeatAction];


}

- (void) moveTowardsPosition:(CGPoint)position {
    
    // slope = (Y3 - Y1) / (X3 - X1)
    float slope = (position.y - self.position.y) / (position.x - self.position.x);
    
    // slope = (Y2 - Y1) / (X2 - X1)
    // Y2 - Y1 = slope ( X2 - X1 )
    // Y2 = slope * X2 - slope * X1 + Y1
    
    float offscreenX;
    
    if ( position.x <= self.position.x) {
        offscreenX = -10;
    }
    else {
        offscreenX = self.parent.frame.size.width + 10;
    }
    
    float offscreenY = slope * offscreenX - slope * self.position.x + self.position.y;

    CGPoint pointOffscreen = CGPointMake(offscreenX, offscreenY);
    
    float distanceA = pointOffscreen.y - self.position.y;
    float distanceB = pointOffscreen.x - self.position.x;
    
    float distanceC = sqrtf(powf(distanceA, 2)+ powf(distanceB, 2));
    
    // distance = speed * time
    // time = distance / speed
    
    float time = distanceC / LDHprojectileSpeed;
    float waitToFade = time * 0.75;
    float fadeTime = time - waitToFade;
    
    SKAction *moveProjectile = [SKAction moveTo:pointOffscreen duration:time];
    [self runAction:moveProjectile];
    
    NSArray *sequence = @[[SKAction waitForDuration:waitToFade],
                          [SKAction fadeOutWithDuration:fadeTime],
                          [SKAction removeFromParent]];
    
    [self runAction:[SKAction sequence:sequence]];

    
    
    
}

@end
