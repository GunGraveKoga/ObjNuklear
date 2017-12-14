//
//  NKContext.h
//  ObjNuklear
//
//  Created by Yury Vovk on 14.12.2017.
//  Copyright © 2017 GunGraveKoga. All rights reserved.
//

#import <ObjFW/ObjFW.h>
#import "nuklear.h"

@class NKConvertConfig;

@interface NKContext : OFObject
{
    struct nk_context _context;
    struct nk_buffer _commands;
    NKConvertConfig *_convertConfig;
}

@property (nonatomic, assign, readonly) struct nk_context *contextHandle OF_RETURNS_INNER_POINTER;
@property (nonatomic, assign, readonly) struct nk_buffer *commandsHandle OF_RETURNS_INNER_POINTER;
@property (nonatomic, retain) NKConvertConfig *convertConfig;

+ (instancetype)context;

- (void)clear;
- (void)convertIntoVertexBuffer:(struct nk_buffer *)vbuf elemntsBUffer:(struct nk_buffer *)ebuf;

@end
