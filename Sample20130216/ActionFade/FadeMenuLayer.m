//
//  FadeMenuLayer.m
//  Sample20130216
//
//  Created by 村田 知常 on 13/02/09.
//  Copyright 2013年 murata. All rights reserved.
//

#import "FadeMenuLayer.h"
#import "FadeInTestLayer.h"
#import "FadeOutTestLayer.h"
#import "FadeToTestLayer.h"

@implementation FadeMenuLayer

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	FadeMenuLayer *layer = [FadeMenuLayer node];
	
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
        
        CCLabelTTF *label1 = [CCLabelTTF labelWithString:@"CCFadeIn" fontName:@"Marker Felt" fontSize:30];
        CCMenuItemLabel *itemLabel1 = [CCMenuItemLabel itemWithLabel:label1 block:^(id sender) {
            [[CCDirector sharedDirector] pushScene:[FadeInTestLayer scene]];
        }];
		
        CCLabelTTF *label2 = [CCLabelTTF labelWithString:@"CCFadeOut" fontName:@"Marker Felt" fontSize:30];
        CCMenuItemLabel *itemLabel2 = [CCMenuItemLabel itemWithLabel:label2 block:^(id sender) {
            [[CCDirector sharedDirector] pushScene:[FadeOutTestLayer scene]];
        }];
		
        CCLabelTTF *label3 = [CCLabelTTF labelWithString:@"CCFadeTo" fontName:@"Marker Felt" fontSize:30];
        CCMenuItemLabel *itemLabel3 = [CCMenuItemLabel itemWithLabel:label3 block:^(id sender) {
            [[CCDirector sharedDirector] pushScene:[FadeToTestLayer scene]];
        }];

		CCMenu *menu = [CCMenu menuWithItems:itemLabel1, itemLabel2, itemLabel3, nil];
		
		[menu setPosition:ccp( size.width/2, size.height/2)];
        
        [menu alignItemsVerticallyWithPadding:20.0];
		
		// Add the menu to the layer
		[self addChild:menu];
        
	}
	return self;
}

@end
