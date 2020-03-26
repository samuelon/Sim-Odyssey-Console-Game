/*
 * Code for class EV_PIXEL_BUFFER_ITERATOR
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern void F1196_10510(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F1196_10511(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F1196_10512(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1196_10513(EIF_REFERENCE);
extern void F1196_10514(EIF_REFERENCE);
extern void F1196_10515(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1196_10516(EIF_REFERENCE);
extern void F1196_10517(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1196_10518(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1196_10519(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1196_10520(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1196_10521(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1196_10522(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1196_10523(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1196_10524(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1196_10525(EIF_REFERENCE);
extern void F1196_10526(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F1196_10527(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F1196_10528(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F1196_10529(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1196_10530(EIF_REFERENCE);
extern void EIF_Minit1196(void);

#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif

/* {EV_PIXEL_BUFFER_ITERATOR}.make_for_pixel_buffer */
void F1196_10510 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "make_for_pixel_buffer";
	RTEX;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(4);
	RTLR(0,arg1);
	RTLR(1,tr1);
	RTLR(2,ur1);
	RTLR(3,Current);
	RTLIU(4);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1195, Current, 0, 1, 17113);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1195, Current, 17113);
	RTCC(arg1, 1195, l_feature_name, 1, eif_new_type(1290, 0x01), 0x01);
	RTIV(Current, RTAL);
	RTHOOK(1);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(8722, "implementation", arg1))(arg1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr1);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(8086, dtype))(Current, ur1x);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef up1
#undef ur1
#undef arg1
}

/* {EV_PIXEL_BUFFER_ITERATOR}.make_for_pixel_buffer_i */
void F1196_10511 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "make_for_pixel_buffer_i";
	RTEX;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE up2x = {{0}, SK_POINTER};
#define up2 up2x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_NATURAL_32 tu4_1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(5);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLR(2,tr1);
	RTLR(3,tr2);
	RTLR(4,ur1);
	RTLIU(5);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1195, Current, 0, 1, 17114);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1195, Current, 17114);
	RTCC(arg1, 1195, l_feature_name, 1, RTWCT(8095, dtype, Dftype(Current)), 0x00);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 8095, 0xF8000571, 0); /* pixel_buffer */
	tr1 = RTCCL(arg1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(8095, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 8094, 0xF80003C9, 0); /* internal_item */
	tr1 = RTLNSMART(RTWCT(8094, dtype, Dftype(Current)).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
	RTNHOOK(2,1);
	tr1 = RTCCL(tr1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(8094, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(3);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(8094, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(3,1);
	tr2 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(8095, dtype))(Current)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
	ur1 = RTCCL(tr2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(6149, "set_pixel_buffer", tr1))(tr1, ur1x);
	RTHOOK(4);
	RTDBGAA(Current, dtype, 8090, 0x38000000, 1); /* max_row_value */
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(9786, "height", arg1))(arg1)).it_i4);
	RTNHOOK(4,1);
	tu4_1 = (EIF_NATURAL_32) ti4_1;
	*(EIF_NATURAL_32 *)(Current + RTWA(8090, dtype)) = (EIF_NATURAL_32) tu4_1;
	RTHOOK(5);
	RTDBGAA(Current, dtype, 8089, 0x38000000, 1); /* max_column_value */
	ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(9785, "width", arg1))(arg1)).it_i4);
	RTNHOOK(5,1);
	tu4_1 = (EIF_NATURAL_32) ti4_1;
	*(EIF_NATURAL_32 *)(Current + RTWA(8089, dtype)) = (EIF_NATURAL_32) tu4_1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(6);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef up1
#undef up2
#undef ur1
#undef arg1
}

/* {EV_PIXEL_BUFFER_ITERATOR}.start */
void F1196_10512 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "start";
	RTEX;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1195, Current, 0, 0, 17115);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1195, Current, 17115);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 8087, 0x38000000, 1); /* column */
	*(EIF_NATURAL_32 *)(Current + RTWA(8087, dtype)) = (EIF_NATURAL_32) (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L);
	RTHOOK(2);
	RTDBGAA(Current, dtype, 8088, 0x38000000, 1); /* row */
	*(EIF_NATURAL_32 *)(Current + RTWA(8088, dtype)) = (EIF_NATURAL_32) (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
}

/* {EV_PIXEL_BUFFER_ITERATOR}.after */
EIF_TYPED_VALUE F1196_10513 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "after";
	RTEX;
	EIF_NATURAL_32 tu4_1;
	EIF_NATURAL_32 tu4_2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1195, Current, 0, 0, 17116);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1195, Current, 17116);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(0, 0x04000000, 1,0); /* Result */
	tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(8088, dtype));
	tu4_2 = *(EIF_NATURAL_32 *)(Current + RTWA(8090, dtype));
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN) (tu4_1 > tu4_2);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
}

/* {EV_PIXEL_BUFFER_ITERATOR}.finish */
void F1196_10514 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "finish";
	RTEX;
	EIF_NATURAL_32 tu4_1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1195, Current, 0, 0, 17117);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1195, Current, 17117);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 8088, 0x38000000, 1); /* row */
	tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(8090, dtype));
	*(EIF_NATURAL_32 *)(Current + RTWA(8088, dtype)) = (EIF_NATURAL_32) tu4_1;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 8087, 0x38000000, 1); /* column */
	tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(8089, dtype));
	*(EIF_NATURAL_32 *)(Current + RTWA(8087, dtype)) = (EIF_NATURAL_32) tu4_1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
}

/* {EV_PIXEL_BUFFER_ITERATOR}.forth */
void F1196_10515 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "forth";
	RTEX;
	EIF_NATURAL_32 tu4_1;
	EIF_NATURAL_32 tu4_2;
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1195, Current, 0, 0, 17118);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1195, Current, 17118);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("not_after", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(2423, dtype))(Current)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCK;
		RTHOOK(2);
		RTCT("valid_position", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(3146, dtype))(Current)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_2);
		RTCK;
		RTJB;
label_2:
		RTCF;
	}
body:;
	RTHOOK(3);
	tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(8087, dtype));
	tu4_2 = *(EIF_NATURAL_32 *)(Current + RTWA(8089, dtype));
	if ((EIF_BOOLEAN)(tu4_1 == tu4_2)) {
		RTHOOK(4);
		RTDBGAA(Current, dtype, 8087, 0x38000000, 1); /* column */
		*(EIF_NATURAL_32 *)(Current + RTWA(8087, dtype)) = (EIF_NATURAL_32) (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L);
		RTHOOK(5);
		RTDBGAA(Current, dtype, 8088, 0x38000000, 1); /* row */
		(*(EIF_NATURAL_32 *)(Current + RTWA(8088, dtype))) += (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L);
	} else {
		RTHOOK(6);
		RTDBGAA(Current, dtype, 8087, 0x38000000, 1); /* column */
		(*(EIF_NATURAL_32 *)(Current + RTWA(8087, dtype))) += (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L);
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(7);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
}

/* {EV_PIXEL_BUFFER_ITERATOR}.before */
EIF_TYPED_VALUE F1196_10516 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "before";
	RTEX;
	EIF_NATURAL_32 tu4_1;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1195, Current, 0, 0, 17119);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1195, Current, 17119);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(0, 0x04000000, 1,0); /* Result */
	tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(8088, dtype));
	Result = (EIF_BOOLEAN) (EIF_BOOLEAN)(tu4_1 == (EIF_NATURAL_32) ((EIF_INTEGER_32) 0L));
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
}

/* {EV_PIXEL_BUFFER_ITERATOR}.back */
void F1196_10517 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "back";
	RTEX;
	EIF_NATURAL_32 tu4_1;
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1195, Current, 0, 0, 17120);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1195, Current, 17120);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("not_before", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(2476, dtype))(Current)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(8087, dtype));
	if ((EIF_BOOLEAN)(tu4_1 == (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L))) {
		RTHOOK(3);
		RTDBGAA(Current, dtype, 8087, 0x38000000, 1); /* column */
		tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(8089, dtype));
		*(EIF_NATURAL_32 *)(Current + RTWA(8087, dtype)) = (EIF_NATURAL_32) tu4_1;
		RTHOOK(4);
		RTDBGAA(Current, dtype, 8088, 0x38000000, 1); /* row */
		(*(EIF_NATURAL_32 *)(Current + RTWA(8088, dtype))) -= (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L);
	} else {
		RTHOOK(5);
		RTDBGAA(Current, dtype, 8087, 0x38000000, 1); /* column */
		(*(EIF_NATURAL_32 *)(Current + RTWA(8087, dtype))) -= (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L);
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(6);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
}

/* {EV_PIXEL_BUFFER_ITERATOR}.item */
EIF_TYPED_VALUE F1196_10518 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "item";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE uu4_1x = {{0}, SK_UINT32};
#define uu4_1 uu4_1x.it_n4
	EIF_TYPED_VALUE uu4_2x = {{0}, SK_UINT32};
#define uu4_2 uu4_2x.it_n4
	EIF_REFERENCE tr1 = NULL;
	EIF_NATURAL_32 tu4_1;
	EIF_NATURAL_32 tu4_2;
	EIF_BOOLEAN tb1;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(3);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,Result);
	RTLIU(3);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1195, Current, 0, 0, 17121);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1195, Current, 17121);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("not_off", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(2408, dtype))(Current)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_1);
		RTCK;
		RTJB;
label_1:
		RTCK;
		RTHOOK(2);
		RTCT("valid_position", EX_PRE);
		tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(3146, dtype))(Current)).it_b);
		RTTE((EIF_BOOLEAN) !tb1, label_2);
		RTCK;
		RTJB;
label_2:
		RTCF;
	}
body:;
	RTHOOK(3);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(8095, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(3,1);
	tb1 = *(EIF_BOOLEAN *)(tr1 + RTVA(9783, "is_locked", tr1));
	if (tb1) {
		RTHOOK(4);
		RTDBGAL(0, 0xF80003C9, 0,0); /* Result */
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(8094, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		Result = (EIF_REFERENCE) RTCCL(tr1);
		RTHOOK(5);
		tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(8087, dtype));
		uu4_1 = (EIF_NATURAL_32) (tu4_1 - (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L));
		tu4_2 = *(EIF_NATURAL_32 *)(Current + RTWA(8088, dtype));
		uu4_2 = (EIF_NATURAL_32) (tu4_2 - (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L));
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(6150, "sync_with_pixel_buffer_value", Result))(Result, uu4_1x, uu4_2x);
	} else {
		RTHOOK(6);
		RTDBGAL(0, 0xF80003C9, 0,0); /* Result */
		tr1 = RTLN(eif_new_type(969, 0x01).id);
		(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(32, Dtype(tr1)))(tr1);
		RTNHOOK(6,1);
		Result = (EIF_REFERENCE) RTCCL(tr1);
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(7);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef up1
#undef uu4_1
#undef uu4_2
}

/* {EV_PIXEL_BUFFER_ITERATOR}.index */
EIF_TYPED_VALUE F1196_10519 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "index";
	RTEX;
	EIF_INTEGER_32 ti4_1;
	EIF_NATURAL_32 tu4_1;
	EIF_NATURAL_32 tu4_2;
	EIF_NATURAL_32 tu4_3;
	EIF_INTEGER_32 Result = ((EIF_INTEGER_32) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_INT32, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1195, Current, 0, 0, 17122);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1195, Current, 17122);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(0, 0x10000000, 1,0); /* Result */
	tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(8088, dtype));
	tu4_2 = *(EIF_NATURAL_32 *)(Current + RTWA(8089, dtype));
	tu4_3 = *(EIF_NATURAL_32 *)(Current + RTWA(8087, dtype));
	ti4_1 = (EIF_INTEGER_32) ((EIF_NATURAL_32) ((EIF_NATURAL_32) (((EIF_NATURAL_32) (tu4_1 - (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L))) * tu4_2) + tu4_3));
	Result = (EIF_INTEGER_32) ti4_1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_INT32; r.it_i4 = Result; return r; }
}

/* {EV_PIXEL_BUFFER_ITERATOR}.column */
EIF_TYPED_VALUE F1196_10520 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_UINT32;
	r.it_n4 = *(EIF_NATURAL_32 *)(Current + RTWA(8087,Dtype(Current)));
	return r;
}


/* {EV_PIXEL_BUFFER_ITERATOR}.row */
EIF_TYPED_VALUE F1196_10521 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_UINT32;
	r.it_n4 = *(EIF_NATURAL_32 *)(Current + RTWA(8088,Dtype(Current)));
	return r;
}


/* {EV_PIXEL_BUFFER_ITERATOR}.new_cursor */
EIF_TYPED_VALUE F1196_10522 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "new_cursor";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(5);
	RTLR(0,tr1);
	RTLR(1,Current);
	RTLR(2,tr2);
	RTLR(3,ur1);
	RTLR(4,Result);
	RTLIU(5);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1195, Current, 0, 0, 17125);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1195, Current, 17125);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(0, 0xF80004AB, 0,0); /* Result */
	tr1 = RTLN(eif_new_type(1195, 0x01).id);
	tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(8095, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr2);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(8086, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(1,1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTHOOK(2);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(2409, "start", Result))(Result);
	if (RTAL & CK_ENSURE) {
		RTHOOK(3);
		RTCT("result_attached", EX_POST);
		if ((EIF_BOOLEAN)(Result != NULL)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(4);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef up1
#undef ur1
}

/* {EV_PIXEL_BUFFER_ITERATOR}.max_column_value */
EIF_TYPED_VALUE F1196_10523 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_UINT32;
	r.it_n4 = *(EIF_NATURAL_32 *)(Current + RTWA(8089,Dtype(Current)));
	return r;
}


/* {EV_PIXEL_BUFFER_ITERATOR}.max_row_value */
EIF_TYPED_VALUE F1196_10524 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_UINT32;
	r.it_n4 = *(EIF_NATURAL_32 *)(Current + RTWA(8090,Dtype(Current)));
	return r;
}


/* {EV_PIXEL_BUFFER_ITERATOR}.is_empty */
EIF_TYPED_VALUE F1196_10525 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "is_empty";
	RTEX;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_BOOL, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1195, Current, 0, 0, 17128);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1195, Current, 17128);
	RTIV(Current, RTAL);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(1);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
}

/* {EV_PIXEL_BUFFER_ITERATOR}.set_column */
void F1196_10526 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_column";
	RTEX;
#define arg1 arg1x.it_n4
	EIF_NATURAL_32 tu4_1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_n4 = * (EIF_NATURAL_32 *) arg1x.it_r;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU(SK_UINT32,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1195, Current, 0, 1, 17129);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1195, Current, 17129);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("a_column_valid", EX_PRE);
		tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(8089, dtype));
		RTTE((EIF_BOOLEAN) ((EIF_BOOLEAN) (arg1 >= (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L)) && (EIF_BOOLEAN) (arg1 <= tu4_1)), label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 8087, 0x38000000, 1); /* column */
	*(EIF_NATURAL_32 *)(Current + RTWA(8087, dtype)) = (EIF_NATURAL_32) arg1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef arg1
}

/* {EV_PIXEL_BUFFER_ITERATOR}.set_row */
void F1196_10527 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_row";
	RTEX;
#define arg1 arg1x.it_n4
	EIF_NATURAL_32 tu4_1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_n4 = * (EIF_NATURAL_32 *) arg1x.it_r;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU(SK_UINT32,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1195, Current, 0, 1, 17130);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1195, Current, 17130);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("a_row_valid", EX_PRE);
		tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(8090, dtype));
		RTTE((EIF_BOOLEAN) ((EIF_BOOLEAN) (arg1 >= (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L)) && (EIF_BOOLEAN) (arg1 <= tu4_1)), label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 8088, 0x38000000, 1); /* row */
	*(EIF_NATURAL_32 *)(Current + RTWA(8088, dtype)) = (EIF_NATURAL_32) arg1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef arg1
}

/* {EV_PIXEL_BUFFER_ITERATOR}.update_pixel */
void F1196_10528 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x, EIF_TYPED_VALUE arg2x, EIF_TYPED_VALUE arg3x)
{
	GTCX
	char *l_feature_name = "update_pixel";
	RTEX;
#define arg1 arg1x.it_n4
#define arg2 arg2x.it_n4
#define arg3 arg3x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE uu4_1x = {{0}, SK_UINT32};
#define uu4_1 uu4_1x.it_n4
	EIF_TYPED_VALUE uu4_2x = {{0}, SK_UINT32};
#define uu4_2 uu4_2x.it_n4
	EIF_REFERENCE tr1 = NULL;
	EIF_NATURAL_32 tu4_1;
	EIF_BOOLEAN tb1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg2x.type & SK_HEAD) == SK_REF) arg2x.it_n4 = * (EIF_NATURAL_32 *) arg2x.it_r;
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_n4 = * (EIF_NATURAL_32 *) arg1x.it_r;
	
	RTLI(4);
	RTLR(0,arg3);
	RTLR(1,Current);
	RTLR(2,tr1);
	RTLR(3,ur1);
	RTLIU(4);
	RTLU (SK_VOID, NULL);
	RTLU(SK_UINT32,&arg1);
	RTLU(SK_UINT32,&arg2);
	RTLU(SK_REF,&arg3);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1195, Current, 0, 3, 17131);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1195, Current, 17131);
	RTCC(arg3, 1195, l_feature_name, 3, eif_new_type(969, 0x01), 0x01);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("a_column_valid", EX_PRE);
		tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(8089, dtype));
		RTTE((EIF_BOOLEAN) ((EIF_BOOLEAN) (arg1 >= (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L)) && (EIF_BOOLEAN) (arg1 <= tu4_1)), label_1);
		RTCK;
		RTHOOK(2);
		RTCT("a_row_valid", EX_PRE);
		tu4_1 = *(EIF_NATURAL_32 *)(Current + RTWA(8090, dtype));
		RTTE((EIF_BOOLEAN) ((EIF_BOOLEAN) (arg2 >= (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L)) && (EIF_BOOLEAN) (arg2 <= tu4_1)), label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(3);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(8095, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(3,1);
	tb1 = *(EIF_BOOLEAN *)(tr1 + RTVA(9783, "is_locked", tr1));
	if (tb1) {
		RTHOOK(4);
		tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(8095, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
		ur1 = RTCCL(tr1);
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(6149, "set_pixel_buffer", arg3))(arg3, ur1x);
		RTHOOK(5);
		uu4_1 = (EIF_NATURAL_32) (arg1 - (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L));
		uu4_2 = (EIF_NATURAL_32) (arg2 - (EIF_NATURAL_32) ((EIF_INTEGER_32) 1L));
		(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(6150, "sync_with_pixel_buffer_value", arg3))(arg3, uu4_1x, uu4_2x);
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(6);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(5);
	RTEE;
#undef up1
#undef ur1
#undef uu4_1
#undef uu4_2
#undef arg3
#undef arg2
#undef arg1
}

/* {EV_PIXEL_BUFFER_ITERATOR}.internal_item */
EIF_TYPED_VALUE F1196_10529 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(8094,Dtype(Current)));
	return r;
}


/* {EV_PIXEL_BUFFER_ITERATOR}.pixel_buffer */
EIF_TYPED_VALUE F1196_10530 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_REF;
	r.it_r = *(EIF_REFERENCE *)(Current + RTWA(8095,Dtype(Current)));
	return r;
}


void EIF_Minit1196 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
