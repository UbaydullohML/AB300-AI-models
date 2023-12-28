(gst-plugin-scanner:7929): GStreamer-WARNING **: 02:39:27.979: Failed to load plugin '/usr/lib/aarch64-linux-gnu/gstreamer-1.0/libgstqtimlesnpe.so': /usr/lib/aarch64-linux-gnu/gstreamer-1.0/libgstqtimlesnpe.so: undefined symbol: _ZN3mle29gst_mle_input_format_get_typeEv
, this was the error to not be able to use qtimlesnpe plugin, so check below and how to fix issue error ,,

root@qrb5165:~# nm -D /usr/lib/aarch64-linux-gnu/gstreamer-1.0/libgstqtimlesnpe.so
                 w _ITM_deregisterTMCloneTable
                 w _ITM_registerTMCloneTable
                 U _Unwind_Resume
                 U _ZN3mle13SNPEDetectionC1ERNS_8MLConfigE
                 U _ZN3mle13SNPESingleSSDC1ERNS_8MLConfigE
                 U _ZN3mle16SNPESegmentationC1ERNS_8MLConfigE
                 U _ZN3mle17SNPEYoloDetectionC1ERNS_8MLConfigE
                 U _ZN3mle29gst_mle_input_format_get_typeEv
                 U _ZN3mle34gst_mle_snpe_runtime_type_get_typeEv
                 U _ZN3mle35gst_mle_preprocessing_mode_get_typeEv
                 U _ZN3mle36gst_mle_preprocessing_accel_get_typeEv
                 U _ZN3mle8MLEngine4InitEPKNS_14MLEInputParamsE
                 U _ZN3mle8MLEngine7ProcessEP14_GstVideoFrame
                 U _ZN3mle8SNPEBaseC1ERNS_8MLConfigE
0000000000005310 W _ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_M_realloc_insertIJRKS5_EEEvN9__gnu_cxx17__normal_iteratorIPS5_S7_EEDpOT_
0000000000005618 W _ZNSt6vectorINSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEEESaIS5_EE17_M_realloc_insertIJS5_EEEvN9__gnu_cxx17__normal_iteratorIPS5_S7_EEDpOT_
                 U _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE10_M_replaceEmmPKcm
                 U _ZNSt7__cxx1112basic_stringIcSt11char_traitsIcESaIcEE9_M_createERmm
                 U _ZNSt8ios_base4InitC1Ev
                 U _ZNSt8ios_base4InitD1Ev
                 U _ZSt19__throw_logic_errorPKc
                 U _ZdlPv
                 U _ZdlPvm
                 U _Znwm
0000000000018088 B __bss_end__
0000000000018048 B __bss_start
0000000000018048 B __bss_start__
                 U __cxa_atexit
                 U __cxa_begin_catch
                 U __cxa_end_catch
                 w __cxa_finalize
                 U __cxa_rethrow
0000000000018088 B __end__
                 w __gmon_start__
                 U __gxx_personality_v0
                 U __stack_chk_fail
                 U __stack_chk_guard
0000000000018088 B _bss_end__
0000000000018048 D _edata
0000000000018088 B _end
0000000000005858 T _fini
                 U _gst_debug_category_new
                 U _gst_debug_min
                 U _gst_debug_register_funcptr
                 U _gst_structure_type
                 U _gst_value_array_type
00000000000026e0 T _init
                 U g_clear_error
                 U g_file_get_contents
                 U g_file_test
                 U g_free
                 U g_intern_static_string
                 U g_log
                 U g_mutex_lock
                 U g_mutex_unlock
                 U g_object_class_install_property
                 U g_once_init_enter
                 U g_once_init_leave
                 U g_param_spec_double
                 U g_param_spec_enum
                 U g_param_spec_float
                 U g_param_spec_string
                 U g_strchomp
                 U g_strchug
                 U g_strcmp0
                 U g_strdelimit
                 U g_strdup
                 U g_type_check_class_cast
                 U g_type_check_instance_cast
                 U g_type_check_value_holds
                 U g_type_class_adjust_private_offset
                 U g_type_class_peek_parent
                 U g_type_name
                 U g_type_register_static_simple
                 U g_value_dup_boxed
                 U g_value_get_double
                 U g_value_get_enum
                 U g_value_get_float
                 U g_value_get_string
                 U g_value_init
                 
