/*
 * Code for class EXPLORER
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern EIF_TYPED_VALUE F1146_9829(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1146_9830(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1146_9831(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1146_9832(EIF_REFERENCE);
extern void F1146_9833(EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE);
extern void F1146_9834(EIF_REFERENCE);
extern void F1146_9835(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void F1146_9836(EIF_REFERENCE);
extern void F1146_9837(EIF_REFERENCE);
extern void F1146_9838(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1146_9839(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1146_9840(EIF_REFERENCE);
extern void F1146_9841(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1146_9842(EIF_REFERENCE);
extern EIF_TYPED_VALUE F1146_9843(EIF_REFERENCE);
extern void EIF_Minit1146(void);

#ifdef __cplusplus
}
#endif

#include "eif_out.h"

#ifdef __cplusplus
extern "C" {
#endif


#ifdef __cplusplus
}
#endif


#ifdef __cplusplus
extern "C" {
#endif

/* {EXPLORER}.life */
EIF_TYPED_VALUE F1146_9829 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_INT32;
	r.it_i4 = *(EIF_INTEGER_32 *)(Current + RTWA(7522,Dtype(Current)));
	return r;
}


/* {EXPLORER}.landed */
EIF_TYPED_VALUE F1146_9830 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_BOOL;
	r.it_b = *(EIF_BOOLEAN *)(Current + RTWA(7523,Dtype(Current)));
	return r;
}


/* {EXPLORER}.face_error */
EIF_TYPED_VALUE F1146_9831 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_BOOL;
	r.it_b = *(EIF_BOOLEAN *)(Current + RTWA(7524,Dtype(Current)));
	return r;
}


/* {EXPLORER}.wins */
EIF_TYPED_VALUE F1146_9832 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_BOOL;
	r.it_b = *(EIF_BOOLEAN *)(Current + RTWA(7525,Dtype(Current)));
	return r;
}


/* {EXPLORER}.make */
void F1146_9833 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x, EIF_TYPED_VALUE arg2x, EIF_TYPED_VALUE arg3x)
{
	GTCX
	char *l_feature_name = "make";
	RTEX;
#define arg1 arg1x.it_i4
#define arg2 arg2x.it_i4
#define arg3 arg3x.it_i4
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE ui4_2x = {{0}, SK_INT32};
#define ui4_2 ui4_2x.it_i4
	EIF_TYPED_VALUE ui4_3x = {{0}, SK_INT32};
#define ui4_3 ui4_3x.it_i4
	EIF_TYPED_VALUE uc1x = {{0}, SK_CHAR8};
#define uc1 uc1x.it_c1
	EIF_REFERENCE tr1 = NULL;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg3x.type & SK_HEAD) == SK_REF) arg3x.it_i4 = * (EIF_INTEGER_32 *) arg3x.it_r;
	if ((arg2x.type & SK_HEAD) == SK_REF) arg2x.it_i4 = * (EIF_INTEGER_32 *) arg2x.it_r;
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_i4 = * (EIF_INTEGER_32 *) arg1x.it_r;
	
	RTLI(2);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLIU(2);
	RTLU (SK_VOID, NULL);
	RTLU(SK_INT32,&arg1);
	RTLU(SK_INT32,&arg2);
	RTLU(SK_INT32,&arg3);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1145, Current, 0, 3, 16125);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1145, Current, 16125);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 7432, 0x10000000, 1); /* id */
	*(EIF_INTEGER_32 *)(Current + RTWA(7432, dtype)) = (EIF_INTEGER_32) arg1;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 7503, 0x10000000, 1); /* fuel */
	*(EIF_INTEGER_32 *)(Current + RTWA(7503, dtype)) = (EIF_INTEGER_32) ((EIF_INTEGER_32) 3L);
	RTHOOK(3);
	RTDBGAA(Current, dtype, 7522, 0x10000000, 1); /* life */
	*(EIF_INTEGER_32 *)(Current + RTWA(7522, dtype)) = (EIF_INTEGER_32) ((EIF_INTEGER_32) 3L);
	RTHOOK(4);
	RTDBGAA(Current, dtype, 7523, 0x04000000, 1); /* landed */
	*(EIF_BOOLEAN *)(Current + RTWA(7523, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 0;
	RTHOOK(5);
	RTDBGAA(Current, dtype, 7525, 0x04000000, 1); /* wins */
	*(EIF_BOOLEAN *)(Current + RTWA(7525, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 0;
	RTHOOK(6);
	RTDBGAA(Current, dtype, 7435, 0xF80003D0, 0); /* en */
	tr1 = RTLNSMART(RTWCT(7435, dtype, Dftype(Current)).id);
	uc1 = (EIF_CHARACTER_8) 'E';
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(6243, Dtype(tr1)))(tr1, uc1x);
	RTNHOOK(6,1);
	tr1 = RTCCL(tr1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(7435, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(7);
	RTDBGAA(Current, dtype, 7433, 0x10000000, 1); /* row */
	*(EIF_INTEGER_32 *)(Current + RTWA(7433, dtype)) = (EIF_INTEGER_32) arg2;
	RTHOOK(8);
	RTDBGAA(Current, dtype, 7434, 0x10000000, 1); /* col */
	*(EIF_INTEGER_32 *)(Current + RTWA(7434, dtype)) = (EIF_INTEGER_32) arg3;
	RTHOOK(9);
	RTDBGAA(Current, dtype, 7504, 0x10000000, 1); /* max_fuel */
	*(EIF_INTEGER_32 *)(Current + RTWA(7504, dtype)) = (EIF_INTEGER_32) ((EIF_INTEGER_32) 3L);
	RTHOOK(10);
	RTDBGAA(Current, dtype, 7524, 0x04000000, 1); /* face_error */
	*(EIF_BOOLEAN *)(Current + RTWA(7524, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 0;
	RTHOOK(11);
	RTDBGAA(Current, dtype, 7465, 0xF800037D, 0); /* old_pos */
	tr1 = RTLNSMART(RTWCT(7465, dtype, Dftype(Current)).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2880, Dtype(tr1)))(tr1);
	RTNHOOK(11,1);
	tr1 = RTCCL(tr1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(7465, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(12);
	ui4_1 = ((EIF_INTEGER_32) -1L);
	ui4_2 = ((EIF_INTEGER_32) -1L);
	ui4_3 = ((EIF_INTEGER_32) -1L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(7474, dtype))(Current, ui4_1x, ui4_2x, ui4_3x);
	RTHOOK(13);
	RTDBGAA(Current, dtype, 7464, 0xF800037D, 0); /* current_pos */
	tr1 = RTLNSMART(RTWCT(7464, dtype, Dftype(Current)).id);
	(FUNCTION_CAST(void, (EIF_REFERENCE)) RTWC(2880, Dtype(tr1)))(tr1);
	RTNHOOK(13,1);
	tr1 = RTCCL(tr1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(7464, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(14);
	ui4_1 = ((EIF_INTEGER_32) 1L);
	ui4_2 = ((EIF_INTEGER_32) 1L);
	ui4_3 = ((EIF_INTEGER_32) 1L);
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTWF(7473, dtype))(Current, ui4_1x, ui4_2x, ui4_3x);
	RTHOOK(15);
	RTDBGAA(Current, dtype, 7469, 0x04000000, 1); /* use_wormhole */
	*(EIF_BOOLEAN *)(Current + RTWA(7469, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 0;
	RTHOOK(16);
	RTDBGAA(Current, dtype, 7468, 0x04000000, 1); /* devoured */
	*(EIF_BOOLEAN *)(Current + RTWA(7468, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 0;
	RTHOOK(17);
	RTDBGAA(Current, dtype, 7463, 0xF80000E8, 0); /* name */
	tr1 = RTMS_EX_H("Explorer",8,227759218);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(7463, dtype)) = (EIF_REFERENCE) tr1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(18);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(5);
	RTEE;
#undef ui4_1
#undef ui4_2
#undef ui4_3
#undef uc1
#undef arg3
#undef arg2
#undef arg1
}

/* {EXPLORER}.set_wins */
void F1146_9834 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "set_wins";
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
	
	RTEAA(l_feature_name, 1145, Current, 0, 0, 16126);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1145, Current, 16126);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 7525, 0x04000000, 1); /* wins */
	*(EIF_BOOLEAN *)(Current + RTWA(7525, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
}

/* {EXPLORER}.set_life */
void F1146_9835 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "set_life";
	RTEX;
#define arg1 arg1x.it_i4
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_i4 = * (EIF_INTEGER_32 *) arg1x.it_r;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU(SK_INT32,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1145, Current, 0, 1, 16127);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1145, Current, 16127);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 7522, 0x10000000, 1); /* life */
	*(EIF_INTEGER_32 *)(Current + RTWA(7522, dtype)) = (EIF_INTEGER_32) arg1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
#undef arg1
}

/* {EXPLORER}.set_face_error */
void F1146_9836 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "set_face_error";
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
	
	RTEAA(l_feature_name, 1145, Current, 0, 0, 16128);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1145, Current, 16128);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 7524, 0x04000000, 1); /* face_error */
	*(EIF_BOOLEAN *)(Current + RTWA(7524, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
}

/* {EXPLORER}.set_true_landed */
void F1146_9837 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "set_true_landed";
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
	
	RTEAA(l_feature_name, 1145, Current, 0, 0, 16129);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1145, Current, 16129);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 7523, 0x04000000, 1); /* landed */
	*(EIF_BOOLEAN *)(Current + RTWA(7523, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
}

/* {EXPLORER}.set_false_landed */
void F1146_9838 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "set_false_landed";
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
	
	RTEAA(l_feature_name, 1145, Current, 0, 0, 16130);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1145, Current, 16130);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 7523, 0x04000000, 1); /* landed */
	*(EIF_BOOLEAN *)(Current + RTWA(7523, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 0;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
}

/* {EXPLORER}.get_life_out */
EIF_TYPED_VALUE F1146_9839 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "get_life_out";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_REFERENCE tr1 = NULL;
	EIF_INTEGER_32 ti4_1;
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
	
	RTEAA(l_feature_name, 1145, Current, 0, 0, 16131);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1145, Current, 16131);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(0, 0xF80000E8, 0,0); /* Result */
	ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7522, dtype));
	tr1 = c_outi(ti4_1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef up1
}

/* {EXPLORER}.get_fuel_out */
EIF_TYPED_VALUE F1146_9840 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "get_fuel_out";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_REFERENCE tr1 = NULL;
	EIF_INTEGER_32 ti4_1;
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
	
	RTEAA(l_feature_name, 1145, Current, 0, 0, 16132);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1145, Current, 16132);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(0, 0xF80000E8, 0,0); /* Result */
	ti4_1 = *(EIF_INTEGER_32 *)(Current + RTWA(7503, dtype));
	tr1 = c_outi(ti4_1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef up1
}

/* {EXPLORER}.dec_life */
void F1146_9841 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "dec_life";
	RTEX;
	EIF_INTEGER_32 ti4_1;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1145, Current, 0, 0, 16133);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1145, Current, 16133);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 7522, 0x10000000, 1); /* life */
	(*(EIF_INTEGER_32 *)(Current + RTWA(7522, dtype)))--;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
}

/* {EXPLORER}.return_landed */
EIF_TYPED_VALUE F1146_9842 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "return_landed";
	RTEX;
	EIF_REFERENCE tr1 = NULL;
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
	
	RTEAA(l_feature_name, 1145, Current, 0, 0, 16134);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1145, Current, 16134);
	RTIV(Current, RTAL);
	RTHOOK(1);
	tb1 = *(EIF_BOOLEAN *)(Current + RTWA(7523, dtype));
	if (tb1) {
		RTHOOK(2);
		RTDBGAL(0, 0xF80000E8, 0,0); /* Result */
		tr1 = RTMS_EX_H("T",1,84);
		Result = (EIF_REFERENCE) tr1;
	} else {
		RTHOOK(3);
		RTDBGAL(0, 0xF80000E8, 0,0); /* Result */
		tr1 = RTMS_EX_H("F",1,70);
		Result = (EIF_REFERENCE) tr1;
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
}

/* {EXPLORER}.dmsg_death_malevolent */
EIF_TYPED_VALUE F1146_9843 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "dmsg_death_malevolent";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_REFERENCE tr3 = NULL;
	EIF_REFERENCE Result = ((EIF_REFERENCE) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(6);
	RTLR(0,tr1);
	RTLR(1,Current);
	RTLR(2,tr2);
	RTLR(3,tr3);
	RTLR(4,ur1);
	RTLR(5,Result);
	RTLIU(6);
	RTLU (SK_REF, &Result);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1145, Current, 0, 0, 16135);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1145, Current, 16135);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(0, 0xF80000E8, 0,0); /* Result */
	tr1 = RTMS_EX_H("Explorer got lost in space - out of life support at Sector:",59,1527144506);
	tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(7456, "get_sector", Current))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(1,1);
	tr3 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(6291, "print_sector", tr2))(tr2)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	ur1 = RTCCL(tr3);
	tr2 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(4721, "plus", tr1))(tr1, ur1x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	Result = (EIF_REFERENCE) RTCCL(tr2);
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(2);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef up1
#undef ur1
}

void EIF_Minit1146 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
