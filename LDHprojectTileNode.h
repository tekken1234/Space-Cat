//
//  LDHprojectTileNode.h
//  SpaceCat
//
//  Created by admin on 14/8/13.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface LDHprojectTileNode : SKSpriteNode

+ (instancetype) projectTileAtPosition:(CGPoint)position;

- (void) moveTowardsPosition:(CGPoint)position;



@end
