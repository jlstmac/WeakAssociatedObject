//
//  NSObject+Weak.h
//  WeakAssociatedObject
//
//  Created by Jiang LinShan on 2023/6/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Weak)
- (id)weakAssObject;
- (void)setWeakAssObject:(id)obj;
@end

NS_ASSUME_NONNULL_END
