//
//  BaseTestLayer.m
//  Sample20130216
//
//  Created by 村田 知常 on 13/02/16.
//  Copyright 2013年 murata. All rights reserved.
//

#import "BaseTestLayer.h"

#define USE_BMF (0)

@implementation BaseTestLayer

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
		// create and initialize a Label
#if USE_BMF
        CCLabelBMFont *label = [CCLabelBMFont labelWithString:@"<< Back" fntFile:@"Back.fnt"];
#else
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"<< Back" fontName:@"Marker Felt" fontSize:32];
        [label setColor:ccc3(255, 255, 0)];
#endif

        CCMenuItemLabel *itemLabel = [CCMenuItemLabel itemWithLabel:label block:^(id sender) {
            // 前の画面に戻る
            [[CCDirector sharedDirector] popScene];
        }];
        itemLabel.anchorPoint = ccp(0.0, 1.0);

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
        
        CCMenu *menu = [CCMenu menuWithItems:itemLabel, nil];
		[menu setPosition:ccp( 0,  size.height)];
		
		// Add the menu to the layer
		[self addChild:menu];

    }
    
    return self;
}

@end
