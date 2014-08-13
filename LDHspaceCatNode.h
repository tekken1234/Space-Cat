//
//  LDHspaceCat.h
//  SpaceCat
//
//  Created by admin on 14/8/13.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface LDHspaceCatNode : SKSpriteNode

+ (instancetype) spaceCatAtPosition:(CGPoint)position;

-(void)performTap;

@end
