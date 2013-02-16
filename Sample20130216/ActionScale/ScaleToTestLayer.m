//
//  ScaleToTestLayer.m
//  Sample20130216
//
//  Created by 村田 知常 on 13/02/09.
//  Copyright 2013年 murata. All rights reserved.
//

#import "ScaleToTestLayer.h"


@implementation ScaleToTestLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	ScaleToTestLayer *layer = [ScaleToTestLayer node];
	
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
        
        
        CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"CCScaleTo" fontName:@"Marker Felt" fontSize:30];
        CCMenuItemLabel *itemLabel1 = [CCMenuItemLabel itemWithLabel:label1 block:^(id sender) {
            // 今いるpositionから1.0秒かけて、x座標に110、y座標に320移動
            sprite.scale = 0.5f;
            [sprite runAction:[CCScaleTo actionWithDuration:1.0f scale:1.0f]];
        }];
		
		
		CCMenu *menu = [CCMenu menuWithItems:itemLabel1, nil];
        menu.anchorPoint = ccp(0.5, 0.0);
		[menu setPosition:ccp( center.x,  50)];
		
		// Add the menu to the layer
		[self addChild:menu];
        
	}
	return self;
}

@end
