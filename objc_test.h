
#import <Foundation/Foundation.h>
#import "_kivytest.h"
NS_ASSUME_NONNULL_BEGIN

@interface ObjcTest: NSObject<KivyTestDelegate>

@property KivyTestCallback callback;

@end


static ObjcTest *test;
NS_ASSUME_NONNULL_END
