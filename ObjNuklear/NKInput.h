//
//  NKInput.h
//  ObjNuklear
//
//  Created by Yury Vovk on 14.12.2017.
//  Copyright © 2017 GunGraveKoga. All rights reserved.
//

#import <ObjFW/ObjFW.h>
#include "nuklear.h"

@class NKContext;

@interface NKInput : OFObject
{
    struct nk_context *_ctx;
    OFMapTable *_keysMap;
    OFMapTable *_mouseButtonsMap;
}

- (void)pressKey:(int)key;
- (void)releaseKey:(int)key;
- (void)pressMouseButton:(int)button inLocation:(of_point_t)location;
- (void)releaseMousebutton:(int)button inLocation:(of_point_t)location;
- (void)mouseMotion:(of_point_t)location;
- (void)mouseDoubleClickInLocation:(of_point_t)location;
- (void)srollWithOffsetX:(float)offsetX offsetY:(float)offsetY;
- (void)inputASCIICharacter:(char)character;
- (void)inputUTF8Character:(char [])character;
- (void)inputUnicodeCharacter:(char32_t)character;
- (void)beginInputWithContext:(NKContext *)context;
- (void)doneInput;

@end
