//
//  NSObject+Weak.m
//  WeakAssociatedObject
//
//  Created by Jiang LinShan on 2023/6/14.
//

#import "NSObject+Weak.h"
#import <objc/runtime.h>

typedef id(^WeakWrapperBlock)(void);
@implementation NSObject (Weak)


- (id)weakAssObject {
    WeakWrapperBlock wrapper = objc_getAssociatedObject(self, @selector(weakAssObject));
    return wrapper ? wrapper() : nil;
}

- (void)setWeakAssObject:(id)obj {
    //这是一种简洁优雅的实现方式，__weak 本身就会把指针指向 nil，那直接利用就是了。使用 OBJC_ASSOCIATION_COPY 关联策略将 block copy 到堆上，利用 block 把持有的 weak 对象返回，如果对象不存在了，返回的便是空值。
    id __weak weakObject = obj;
    WeakWrapperBlock wrap = ^{
        return weakObject;
    };
    objc_setAssociatedObject(self, @selector(weakAssObject), wrap, OBJC_ASSOCIATION_COPY);
}
@end
