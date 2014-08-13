//
//  LDHTitleScene.m
//  SpaceCat
//
//  Created by admin on 14/8/13.
//  Copyright (c) 2014年 YEHKUO. All rights reserved.
//

#import "LDHTitleScene.h"
#import "LDHgameplayScene.h"

@implementation LDHTitleScene
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
     
        SKSpriteNode *backgnd = [SKSpriteNode spriteNodeWithImageNamed:@"splash_1"];
        backgnd.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame));
        [self addChild:backgnd];
    
                                 
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    LDHgameplayScene *gameplayScene = [LDHgameplayScene sceneWithSize:self.frame.size];
    SKTransition *transition = [SKTransition flipVerticalWithDuration:1];
    
    [self.view presentScene:gameplayScene transition:transition];

}


@end
