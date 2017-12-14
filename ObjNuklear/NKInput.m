//
//  NKInput.m
//  ObjNuklear
//
//  Created by Yury Vovk on 14.12.2017.
//  Copyright © 2017 GunGraveKoga. All rights reserved.
//

#import "NKInput.h"
#import "NKContext.h"

@implementation NKInput

- (instancetype)init {
    self = [super init];
    
    _ctx = NULL;
    
    return self;
}

- (void)beginInputWithContext:(NKContext *)context {
    struct nk_context *ctx = [context contextHandle];
#if defined(OF_HAVE_THREADS)
    while ((of_atomic_ptr_cmpswap((void **)&_ctx, NULL, ctx)) == false) {
        of_thread_yield();
    }
#else
    _ctx = ctx;
#endif
    
    nk_input_begin(_ctx);
}

- (void)doneInput {
    nk_input_end(_ctx);
#if defined(OF_HAVE_THREADS)
    if (!(of_atomic_ptr_cmpswap((void **)&_ctx, _ctx, NULL)))
        @throw [OFException exception];
#else
    _ctx = NULL;
#endif
}

@end
