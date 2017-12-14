//
//  main.m
//  Examples
//
//  Created by Yury Vovk on 14.12.2017.
//  Copyright © 2017 GunGraveKoga. All rights reserved.
//

#import <ObjFW/ObjFW.h>

static OF_INLINE uintptr_t DISGUISE(int value) {
    return ~(uintptr_t)(value);
}
static OF_INLINE int UNDISGUISE(uintptr_t uptr) {
    return (int)(~uptr);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        void *obj1 = (void *)DISGUISE(1);
        void *obj2 = (void *)DISGUISE(2);
        of_log(@"%p %p", (void *)DISGUISE(1), (void *)DISGUISE(2));
        of_log(@"%p %p", (void *)DISGUISE(1), (void *)DISGUISE(2));
        of_log(@"%p %p", (void *)DISGUISE(1), (void *)DISGUISE(2));
        of_log(@"%p %p", (void *)DISGUISE(1), (void *)DISGUISE(2));
        of_log(@"%p", (void *)DISGUISE(0));
        of_log(@"%d %d", UNDISGUISE((uintptr_t)obj1), UNDISGUISE((uintptr_t)obj2));
    }
    return 0;
}
