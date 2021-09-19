#cython: language_level=3

import json
from libc.stdlib cimport malloc, free
from libcpp cimport bool as bool_t
cdef extern from "_kivytest.h":
	######## cdef extern Callback Function Pointers: ########
	ctypedef void (*KivyTest_ptr0)(const long* arg0, long arg0_size)
	ctypedef void (*KivyTest_ptr1)(const char* arg0)

	######## cdef extern Callback Struct: ########
	ctypedef struct KivyTestCallback:
		KivyTest_ptr0 get_swift_array
		KivyTest_ptr1 get_swift_string


	######## cdef extern Send Functions: ########
	void set_KivyTest_Callback(KivyTestCallback callback)
	void KivyTest_send_python_list(const long* l, long l_size)
	void KivyTest_send_python_string(const char* s)


######## Callbacks Functions: ########

cdef void KivyTest_get_swift_array(const long* arg0, long arg0_size) with gil:
	(<object> KivyTest_voidptr).get_swift_array([arg0[x] for x in range(arg0_size)])

cdef void KivyTest_get_swift_string(const char* arg0) with gil:
	(<object> KivyTest_voidptr).get_swift_string(arg0.decode('utf-8'))


######## Cython Class: ########

cdef public void* KivyTest_voidptr
cdef class KivyTest:

	@staticmethod
	def default(call: object):
		global KivyTest_shared
		if KivyTest_shared != None:
			return KivyTest_shared
		else:
			KivyTest_shared = KivyTest(call)
			return KivyTest_shared

	def __init__(self,object callback_class):
		global KivyTest_voidptr
		KivyTest_voidptr = <const void*>callback_class
		print("KivyTest_voidptr init:", (<object>KivyTest_voidptr))

		cdef KivyTestCallback callbacks = [
			KivyTest_get_swift_array,
			KivyTest_get_swift_string
			]
		set_KivyTest_Callback(callbacks)


######## Send Functions: ########
	def send_python_list(self,l:list):
		cdef int l_size = len(l)
		cdef long *l_array = <long *> malloc(l_size  * 8)
		cdef int l_i
		for l_i in range(l_size):
			l_array[l_i] = l[l_i]

		KivyTest_send_python_list(l_array, l_size)

		free(l_array)

	def send_python_string(self,s:str):

		KivyTest_send_python_string(s.encode('utf-8'))

