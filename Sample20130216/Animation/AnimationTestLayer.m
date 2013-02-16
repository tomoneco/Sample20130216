//
//  AnimationTestLayer.m
//  Sample20130216
//
//  Created by 村田 知常 on 13/02/09.
//  Copyright 2013年 murata. All rights reserved.
//

#import "AnimationTestLayer.h"


@implementation AnimationTestLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	AnimationTestLayer *layer = [AnimationTestLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        CGPoint center = ccp( size.width /2 , size.height/2 );
        
        
        CCSprite *sprite = [CCSprite spriteWithFile:@"grossini_dance_01.png"];
        sprite.position = center;
        
        [self addChild:sprite];

        //アニメーション用のオブジェクトを作成
        CCAnimation* animation = [CCAnimation animation];
        
        // 画像を登録
        for (int i = 1; i <= 14; i++) {
            [animation addSpriteFrameWithFilename:[NSString stringWithFormat:@"grossini_dance_%02d.png", i]];
        }
        
        // アニメーションの設定
        animation.delayPerUnit = 0.25f;
        animation.loops = -1; // 無限ループ
        
        // アクションの実行
        [sprite runAction:[CCAnimate actionWithAnimation:animation]];
        
	}
	return self;
}


@end
