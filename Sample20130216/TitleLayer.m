//
//  TitleLayer.m
//  Sample20130216
//
//  Created by 村田 知常 on 13/02/09.
//  Copyright 2013年 murata. All rights reserved.
//

#import "TitleLayer.h"
#import "MoveMenuLayer.h"
#import "JumpMenuLayer.h"
#import "BezierMenuLayer.h"
#import "RotateMenuLayer.h"
#import "ScaleMenuLayer.h"
#import "FadeMenuLayer.h"
#import "CompositionMenuLayer.h"
#import "CallFuncMenuLayer.h"
#import "ParticleSampleLayer.h"

@implementation TitleLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	TitleLayer *layer = [TitleLayer node];
	
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
        
        CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"移動サンプル"
                                                fontName:@"Marker Felt"
                                                fontSize:30];
        CCMenuItemLabel *itemLabel1 = [CCMenuItemLabel itemWithLabel:label1 block:^(id sender) {
            [[CCDirector sharedDirector] pushScene:[MoveMenuLayer scene]];
        }];
		
        CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"回転サンプル"
                                                fontName:@"Marker Felt"
                                                fontSize:30];
        CCMenuItemLabel *itemLabel2 = [CCMenuItemLabel itemWithLabel:label2 block:^(id sender) {
            [[CCDirector sharedDirector] pushScene:[RotateMenuLayer scene]];
        }];

        CCLabelTTF *label3 = [CCLabelTTF labelWithString:@"拡大サンプル"
                                                fontName:@"Marker Felt"
                                                fontSize:30];
        CCMenuItemLabel *itemLabel3 = [CCMenuItemLabel itemWithLabel:label3 block:^(id sender) {
            [[CCDirector sharedDirector] pushScene:[ScaleMenuLayer scene]];
        }];

        CCLabelTTF *label4 = [CCLabelTTF labelWithString:@"ジャンプサンプル"
                                                fontName:@"Marker Felt"
                                                fontSize:30];
        CCMenuItemLabel *itemLabel4 = [CCMenuItemLabel itemWithLabel:label4 block:^(id sender) {
            [[CCDirector sharedDirector] pushScene:[JumpMenuLayer scene]];
        }];

        CCLabelTTF *label5 = [CCLabelTTF labelWithString:@"ベジェ曲線サンプル"
                                                fontName:@"Marker Felt"
                                                fontSize:30];
        CCMenuItemLabel *itemLabel5 = [CCMenuItemLabel itemWithLabel:label5 block:^(id sender) {
            [[CCDirector sharedDirector] pushScene:[BezierMenuLayer scene]];
        }];

        CCLabelTTF *label6 = [CCLabelTTF labelWithString:@"フェードサンプル"
                                                fontName:@"Marker Felt"
                                                fontSize:30];
        CCMenuItemLabel *itemLabel6 = [CCMenuItemLabel itemWithLabel:label6 block:^(id sender) {
            [[CCDirector sharedDirector] pushScene:[FadeMenuLayer scene]];
        }];

        CCLabelTTF *label7 = [CCLabelTTF labelWithString:@"連続アニメーション"
                                                fontName:@"Marker Felt"
                                                fontSize:30];
        CCMenuItemLabel *itemLabel7 = [CCMenuItemLabel itemWithLabel:label7 block:^(id sender) {
            [[CCDirector sharedDirector] pushScene:[CompositionMenuLayer scene]];
        }];

        CCLabelTTF *label8 = [CCLabelTTF labelWithString:@"コールバック"
                                                fontName:@"Marker Felt"
                                                fontSize:30];
        CCMenuItemLabel *itemLabel8 = [CCMenuItemLabel itemWithLabel:label8 block:^(id sender) {
            [[CCDirector sharedDirector] pushScene:[CallFuncMenuLayer scene]];
        }];

        CCLabelTTF *label9 = [CCLabelTTF labelWithString:@"Particle"
                                                fontName:@"Marker Felt"
                                                fontSize:30];
        CCMenuItemLabel *itemLabel9 = [CCMenuItemLabel itemWithLabel:label9 block:^(id sender) {
            [[CCDirector sharedDirector] pushScene:[ParticleSampleLayer scene]];
        }];

        CCMenu *menu = [CCMenu menuWithItems:
                        itemLabel1, itemLabel4, itemLabel5, itemLabel2, itemLabel3, itemLabel6, itemLabel7, itemLabel8, itemLabel9, nil];
		
		[menu setPosition:ccp( size.width/2, size.height/2)];
		
        [menu alignItemsVerticallyWithPadding:20.0];

		// Add the menu to the layer
		[self addChild:menu];
        
	}
	return self;
}

@end
