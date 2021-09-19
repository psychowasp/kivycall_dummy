#import <Foundation/Foundation.h>
#import "_kivytest.h"

void InitKivyTestDelegate(id<KivyTestDelegate> _Nonnull callback){
    kivy_test = callback;
    NSLog(@"setting KivyTest delegate %@",kivy_test);
}

void set_KivyTest_Callback(struct KivyTestCallback callback){
    [kivy_test set_KivyTest_Callback:(struct KivyTestCallback)callback];
}

void KivyTest_send_python_list(const long* _Nonnull l, long l_size){
    [kivy_test send_python_list:(const long* _Nonnull)l l_size:(long)l_size];
}

void KivyTest_send_python_string(const char* _Nonnull s){
    [kivy_test send_python_string:(const char* _Nonnull)s];
}
