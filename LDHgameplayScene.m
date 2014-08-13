//
//  LDHgameplayScene.m
//  SpaceCat
//
//  Created by admin on 14/8/13.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "LDHgameplayScene.h"

@implementation LDHgameplayScene
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        SKSpriteNode *backgnd = [SKSpriteNode spriteNodeWithImageNamed:@"background_1"];
        backgnd.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:backgnd];
        
        
    }
    return self;
}
@end
