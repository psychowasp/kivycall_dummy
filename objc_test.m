//
//  NSObject+objc_test_m.m
//  test
//
//  Created by MusicMaker on 19/09/2021.
//

#import "objc_test.h"

@implementation ObjcTest

- (instancetype)init
{
    self = [super init];
    if (self) {
        InitKivyTestDelegate(self);
    }
    return self;
}

- (void)send_python_list:(const long * _Nonnull)l l_size:(long)l_size {
    
    
    long array[5] = {1000,200,300,400,500};
    self.callback.get_swift_array(array, 5);
}

- (void)send_python_string:(const char * _Nonnull)s {
    NSString *str = [NSString stringWithUTF8String:s];
    NSLog(@"%@", str);
    
    NSString *return_str = @"Hallo from objc";
    const char* return_ptr = [return_str UTF8String];
    self.callback.get_swift_string( return_ptr );
}

- (void)set_KivyTest_Callback:(struct KivyTestCallback)callback {
    KivyTestCallback test = callback;
    self.callback = callback;
    
}

@end



