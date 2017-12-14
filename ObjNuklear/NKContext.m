//
//  NKContext.m
//  ObjNuklear
//
//  Created by Yury Vovk on 14.12.2017.
//  Copyright © 2017 GunGraveKoga. All rights reserved.
//

#define NK_INCLUDE_FIXED_TYPES
#define NK_INCLUDE_STANDARD_IO
#define NK_INCLUDE_STANDARD_VARARGS
#define NK_INCLUDE_DEFAULT_ALLOCATOR
#define NK_INCLUDE_VERTEX_BUFFER_OUTPUT
#define NK_INCLUDE_FONT_BAKING
#define NK_INCLUDE_DEFAULT_FONT
#define NK_IMPLEMENTATION
#import "NKContext.h"
#import "NKConvertConfig.h"

@implementation NKContext

@synthesize convertConfig = _convertConfig;

+ (instancetype)context {
    return [[[self alloc] init] autorelease];
}

- (instancetype)init {
    self = [super init];
    
    @try {
        if (!(nk_init_default(&_context, 0)))
            @throw [OFInitializationFailedException exceptionWithClass:[self class]];
        
        nk_buffer_init_default(&_commands);
            
    }
    @catch (id e) {
        [self release];
        
        @throw e;
    }
    
    return self;
}

- (struct nk_context *)contextHandle {
    return &_context;
}

- (struct nk_buffer *)commandsHandle {
    return &_commands;
}

- (void)clear {
    nk_clear(&_context);
}

- (void)convertIntoVertexBuffer:(struct nk_buffer *)vbuf elemntsBUffer:(struct nk_buffer *)ebuf {
    nk_flags rc = nk_convert(&_context, &_commands, vbuf, ebuf, [_convertConfig configHandle]);
    
    if ((rc & NK_CONVERT_COMMAND_BUFFER_FULL) == NK_CONVERT_COMMAND_BUFFER_FULL) {
        @throw [OFOutOfMemoryException exceptionWithRequestedSize:_commands.needed];
    }
    
    if ((rc & NK_CONVERT_VERTEX_BUFFER_FULL) == NK_CONVERT_VERTEX_BUFFER_FULL) {
        @throw [OFOutOfMemoryException exceptionWithRequestedSize:vbuf->needed];
    }
    
    if ((rc & NK_CONVERT_ELEMENT_BUFFER_FULL) == NK_CONVERT_ELEMENT_BUFFER_FULL) {
        @throw [OFOutOfMemoryException exceptionWithRequestedSize:ebuf->needed];
    }
}

- (void)dealloc {
    nk_buffer_free(&_commands);
    nk_free(&_context);
    
    [super dealloc];
}

@end
