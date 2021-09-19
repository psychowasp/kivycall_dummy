#import <Foundation/Foundation.h>


//######## cdef extern Callback Function Pointers: ########//
typedef void (*KivyTest_ptr0)(const long* _Nonnull arg0, long arg0_size);
typedef void (*KivyTest_ptr1)(const char* _Nonnull arg0);

//######## cdef extern Callback Struct: ########//
typedef struct KivyTestCallback {
	KivyTest_ptr0 _Nonnull get_swift_array;
	KivyTest_ptr1 _Nonnull get_swift_string;
} KivyTestCallback;


//######## cdef extern Send Functions: ########//
@protocol KivyTestDelegate <NSObject>
- (void)set_KivyTest_Callback:(struct KivyTestCallback)callback;
- (void)send_python_list:(const long* _Nonnull)l l_size:(long)l_size;
- (void)send_python_string:(const char* _Nonnull)s;
@end


static id<KivyTestDelegate> _Nonnull kivy_test;
//######## Send Functions: ########//
void InitKivyTestDelegate(id<KivyTestDelegate> _Nonnull callback);

void set_KivyTest_Callback(struct KivyTestCallback callback);

void KivyTest_send_python_list(const long* _Nonnull l, long l_size);

void KivyTest_send_python_string(const char* _Nonnull s);
