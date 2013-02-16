//
//  CallFuncTestLayer.m
//  Sample20130216
//
//  Created by 村田 知常 on 13/02/09.
//  Copyright 2013年 murata. All rights reserved.
//

#import "CallFuncTestLayer.h"


@implementation CallFuncTestLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	CallFuncTestLayer *layer = [CallFuncTestLayer node];
	
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
        
        
        CCSprite *sprite = [CCSprite spriteWithFile:@"powered.png"];
        sprite.scale = 0.5f;
        sprite.position = center;
        [self addChild:sprite];
        
        
        CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"CCCallFunc" fontName:@"Marker Felt" fontSize:30];
        CCMenuItemLabel *itemLabel1 = [CCMenuItemLabel itemWithLabel:label1 block:^(id sender) {
            // 左上へ移動
            id move = [CCMoveTo actionWithDuration:1 position:ccp(50, size.height - 50)];
            // 4回転
            id rotate = [CCRotateBy actionWithDuration:1 angle:(360 * 4)];
            // scale=0.1に縮小
            id scale = [CCScaleTo actionWithDuration:1 scale:0.1];
            // 呼び出すメソッド
            id callFunc = [CCCallFuncN actionWithTarget:self selector:@selector(doATask:)];
            // 上記２アクションを同時に実行したのち、soATaskを呼び出す
            [sprite runAction:[CCSequence actions:[CCSpawn actions:move, rotate, scale, nil], callFunc, nil]];
        }];
		
		
		CCMenu *menu = [CCMenu menuWithItems:itemLabel1, nil];
        menu.anchorPoint = ccp(0.5, 0.0);
		[menu setPosition:ccp( center.x,  50)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
	}
	return self;
}

-(void) doATask:(id)node
{
    CCSprite *sprite = node;
    
    // 画像がアニメーションで移動した位置でパーティクルを作成
    id particle = [CCParticleSystemQuad particleWithFile:@"CallFuncParticle.plist"];
    [particle setPosition:sprite.position];
    [particle setAutoRemoveOnFinish:YES];
    
    // 画像を削除
    [sprite removeFromParent];
    
    // パーティクルを追加
    [self addChild:particle];
}

@end
