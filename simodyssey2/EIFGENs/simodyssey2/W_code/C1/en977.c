/*
 * Code for class ENTITY_ALPHABET
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern void F977_8454(EIF_REFERENCE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F977_8455(EIF_REFERENCE);
extern EIF_TYPED_VALUE F977_8456(EIF_REFERENCE);
extern EIF_TYPED_VALUE F977_8457(EIF_REFERENCE, EIF_TYPED_VALUE);
extern EIF_TYPED_VALUE F977_8458(EIF_REFERENCE);
extern EIF_TYPED_VALUE F977_8459(EIF_REFERENCE);
extern EIF_TYPED_VALUE F977_8460(EIF_REFERENCE);
extern EIF_TYPED_VALUE F977_8461(EIF_REFERENCE);
extern EIF_TYPED_VALUE F977_8462(EIF_REFERENCE);
extern EIF_TYPED_VALUE F977_8463(EIF_REFERENCE);
extern EIF_TYPED_VALUE F977_8464(EIF_REFERENCE);
extern EIF_TYPED_VALUE F977_8465(EIF_REFERENCE);
extern EIF_TYPED_VALUE F977_8466(EIF_REFERENCE);
extern void F977_16757(EIF_REFERENCE, int);
extern void EIF_Minit977(void);

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

/* {ENTITY_ALPHABET}.make */
void F977_8454 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "make";
	RTEX;
#define arg1 arg1x.it_c1
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	if ((arg1x.type & SK_HEAD) == SK_REF) arg1x.it_c1 = * (EIF_CHARACTER_8 *) arg1x.it_r;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU(SK_CHAR8,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 976, Current, 0, 1, 14759);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(976, Current, 14759);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 6244, 0x08000000, 1); /* item */
	*(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype)) = (EIF_CHARACTER_8) arg1;
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

/* {ENTITY_ALPHABET}.item */
EIF_TYPED_VALUE F977_8455 (EIF_REFERENCE Current)
{
	EIF_TYPED_VALUE r;
	r.type = SK_CHAR8;
	r.it_c1 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244,Dtype(Current)));
	return r;
}


/* {ENTITY_ALPHABET}.out */
EIF_TYPED_VALUE F977_8456 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "out";
	RTEX;
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_REFERENCE tr1 = NULL;
	EIF_CHARACTER_8 tc1;
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
	
	RTEAA(l_feature_name, 976, Current, 0, 0, 14761);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(976, Current, 14761);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAL(0, 0xF80000E8, 0,0); /* Result */
	tc1 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	tr1 = c_outc(tc1);
	Result = (EIF_REFERENCE) RTCCL(tr1);
	if (RTAL & CK_ENSURE) {
		RTHOOK(2);
		RTCT("out_not_void", EX_POST);
		if ((EIF_BOOLEAN)(Result != NULL)) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_REF; r.it_r = Result; return r; }
#undef up1
}

/* {ENTITY_ALPHABET}.is_equal */
EIF_TYPED_VALUE F977_8457 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "is_equal";
	RTEX;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE uc1x = {{0}, SK_CHAR8};
#define uc1 uc1x.it_c1
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	EIF_CHARACTER_8 tc1;
	EIF_CHARACTER_8 tc2;
	EIF_BOOLEAN Result = ((EIF_BOOLEAN) 0);
	
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	RTLI(3);
	RTLR(0,arg1);
	RTLR(1,Current);
	RTLR(2,ur1);
	RTLIU(3);
	RTLU (SK_BOOL, &Result);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 976, Current, 0, 1, 14762);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(976, Current, 14762);
	RTCC(arg1, 976, l_feature_name, 1, eif_new_type(976, 0x01), 0x01);
	RTIV(Current, RTAL);
	if ((RTAL & CK_REQUIRE) || RTAC) {
		RTHOOK(1);
		RTCT("other_not_void", EX_PRE);
		RTTE((EIF_BOOLEAN)(arg1 != NULL), label_1);
		RTCK;
		RTJB;
label_1:
		RTCF;
	}
body:;
	RTHOOK(2);
	RTDBGAL(0, 0x04000000, 1,0); /* Result */
	tc1 = *(EIF_CHARACTER_8 *)(Current + RTVA(6244, "item", Current));
	RTNHOOK(2,1);
	tc2 = *(EIF_CHARACTER_8 *)(arg1 + RTVA(6244, "item", arg1));
	uc1 = tc2;
	tb1 = tc1 == uc1;
	Result = (EIF_BOOLEAN) tb1;
	if (RTAL & CK_ENSURE) {
		RTHOOK(3);
		RTCT("symmetric", EX_POST);
		if ((!(Result) || (RTEQ(arg1, Current)))) {
			RTCK;
		} else {
			RTCF;
		}
		RTHOOK(4);
		RTCT("consistent", EX_POST);
		tb1 = '\01';
		ur1 = RTCCL(arg1);
		tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWF(12, dtype))(Current, ur1x)).it_b);
		if (tb2) {
			tb1 = Result;
		}
		if (tb1) {
			RTCK;
		} else {
			RTCF;
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(5);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(3);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
#undef ur1
#undef uc1
#undef arg1
}

/* {ENTITY_ALPHABET}.is_stationary */
EIF_TYPED_VALUE F977_8458 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "is_stationary";
	RTEX;
	EIF_CHARACTER_8 tc1;
	EIF_CHARACTER_8 tc2;
	EIF_CHARACTER_8 tc3;
	EIF_CHARACTER_8 tc4;
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
	
	RTEAA(l_feature_name, 976, Current, 0, 0, 14763);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(976, Current, 14763);
	RTIV(Current, RTAL);
	RTHOOK(1);
	tc1 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	tc2 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	tc3 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	tc4 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	if ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN)(tc1 == (EIF_CHARACTER_8) 'W') || (EIF_BOOLEAN)(tc2 == (EIF_CHARACTER_8) 'Y')) || (EIF_BOOLEAN)(tc3 == (EIF_CHARACTER_8) '*')) || (EIF_BOOLEAN)(tc4 == (EIF_CHARACTER_8) 'O'))) {
		RTHOOK(2);
		RTDBGAL(0, 0x04000000, 1,0); /* Result */
		Result = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
}

/* {ENTITY_ALPHABET}.is_star */
EIF_TYPED_VALUE F977_8459 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "is_star";
	RTEX;
	EIF_CHARACTER_8 tc1;
	EIF_CHARACTER_8 tc2;
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
	
	RTEAA(l_feature_name, 976, Current, 0, 0, 14764);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(976, Current, 14764);
	RTIV(Current, RTAL);
	RTHOOK(1);
	tc1 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	tc2 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	if ((EIF_BOOLEAN) ((EIF_BOOLEAN)(tc1 == (EIF_CHARACTER_8) 'Y') || (EIF_BOOLEAN)(tc2 == (EIF_CHARACTER_8) '*'))) {
		RTHOOK(2);
		RTDBGAL(0, 0x04000000, 1,0); /* Result */
		Result = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
}

/* {ENTITY_ALPHABET}.is_yellow_dwarf */
EIF_TYPED_VALUE F977_8460 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "is_yellow_dwarf";
	RTEX;
	EIF_CHARACTER_8 tc1;
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
	
	RTEAA(l_feature_name, 976, Current, 0, 0, 14765);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(976, Current, 14765);
	RTIV(Current, RTAL);
	RTHOOK(1);
	tc1 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	if ((EIF_BOOLEAN)(tc1 == (EIF_CHARACTER_8) 'Y')) {
		RTHOOK(2);
		RTDBGAL(0, 0x04000000, 1,0); /* Result */
		Result = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
}

/* {ENTITY_ALPHABET}.is_blackhole */
EIF_TYPED_VALUE F977_8461 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "is_blackhole";
	RTEX;
	EIF_CHARACTER_8 tc1;
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
	
	RTEAA(l_feature_name, 976, Current, 0, 0, 14766);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(976, Current, 14766);
	RTIV(Current, RTAL);
	RTHOOK(1);
	tc1 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	if ((EIF_BOOLEAN)(tc1 == (EIF_CHARACTER_8) 'O')) {
		RTHOOK(2);
		RTDBGAL(0, 0x04000000, 1,0); /* Result */
		Result = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
}

/* {ENTITY_ALPHABET}.is_planet */
EIF_TYPED_VALUE F977_8462 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "is_planet";
	RTEX;
	EIF_CHARACTER_8 tc1;
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
	
	RTEAA(l_feature_name, 976, Current, 0, 0, 14767);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(976, Current, 14767);
	RTIV(Current, RTAL);
	RTHOOK(1);
	tc1 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	if ((EIF_BOOLEAN)(tc1 == (EIF_CHARACTER_8) 'P')) {
		RTHOOK(2);
		RTDBGAL(0, 0x04000000, 1,0); /* Result */
		Result = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
}

/* {ENTITY_ALPHABET}.is_wormhole */
EIF_TYPED_VALUE F977_8463 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "is_wormhole";
	RTEX;
	EIF_CHARACTER_8 tc1;
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
	
	RTEAA(l_feature_name, 976, Current, 0, 0, 14754);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(976, Current, 14754);
	RTIV(Current, RTAL);
	RTHOOK(1);
	tc1 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	if ((EIF_BOOLEAN)(tc1 == (EIF_CHARACTER_8) 'W')) {
		RTHOOK(2);
		RTDBGAL(0, 0x04000000, 1,0); /* Result */
		Result = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
}

/* {ENTITY_ALPHABET}.is_explorer */
EIF_TYPED_VALUE F977_8464 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "is_explorer";
	RTEX;
	EIF_CHARACTER_8 tc1;
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
	
	RTEAA(l_feature_name, 976, Current, 0, 0, 14755);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(976, Current, 14755);
	RTIV(Current, RTAL);
	RTHOOK(1);
	tc1 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	if ((EIF_BOOLEAN)(tc1 == (EIF_CHARACTER_8) 'E')) {
		RTHOOK(2);
		RTDBGAL(0, 0x04000000, 1,0); /* Result */
		Result = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
}

/* {ENTITY_ALPHABET}.is_benign */
EIF_TYPED_VALUE F977_8465 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "is_benign";
	RTEX;
	EIF_CHARACTER_8 tc1;
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
	
	RTEAA(l_feature_name, 976, Current, 0, 0, 14756);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(976, Current, 14756);
	RTIV(Current, RTAL);
	RTHOOK(1);
	tc1 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	if ((EIF_BOOLEAN)(tc1 == (EIF_CHARACTER_8) 'B')) {
		RTHOOK(2);
		RTDBGAL(0, 0x04000000, 1,0); /* Result */
		Result = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
}

/* {ENTITY_ALPHABET}.is_empty */
EIF_TYPED_VALUE F977_8466 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "is_empty";
	RTEX;
	EIF_CHARACTER_8 tc1;
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
	
	RTEAA(l_feature_name, 976, Current, 0, 0, 14757);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(976, Current, 14757);
	RTIV(Current, RTAL);
	RTHOOK(1);
	tc1 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	if ((EIF_BOOLEAN)(tc1 == (EIF_CHARACTER_8) '-')) {
		RTHOOK(2);
		RTDBGAL(0, 0x04000000, 1,0); /* Result */
		Result = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
	{ EIF_TYPED_VALUE r; r.type = SK_BOOL; r.it_b = Result; return r; }
}

/* {ENTITY_ALPHABET}._invariant */
void F977_16757 (EIF_REFERENCE Current, int where)
{
	GTCX
	char *l_feature_name = "_invariant";
	RTEX;
	EIF_CHARACTER_8 tc1;
	EIF_CHARACTER_8 tc2;
	EIF_CHARACTER_8 tc3;
	EIF_CHARACTER_8 tc4;
	EIF_CHARACTER_8 tc5;
	EIF_CHARACTER_8 tc6;
	EIF_CHARACTER_8 tc7;
	EIF_CHARACTER_8 tc8;
	EIF_CHARACTER_8 tc9;
	EIF_CHARACTER_8 tc10;
	EIF_CHARACTER_8 tc11;
	RTCDT;
	RTLD;
	RTDA;
	
	RTLI(1);
	RTLR(0,Current);
	RTLIU(1);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	RTEAINV(l_feature_name, 976, Current, 0, 16756);
	RTSA(dtype);
	RTME(dtype, 0);
	RTIT("allowable_symbols", Current);
	tc1 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	tc2 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	tc3 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	tc4 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	tc5 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	tc6 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	tc7 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	tc8 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	tc9 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	tc10 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	tc11 = *(EIF_CHARACTER_8 *)(Current + RTWA(6244, dtype));
	if ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN) ((EIF_BOOLEAN)(tc1 == (EIF_CHARACTER_8) 'E') || (EIF_BOOLEAN)(tc2 == (EIF_CHARACTER_8) 'P')) || (EIF_BOOLEAN)(tc3 == (EIF_CHARACTER_8) 'A')) || (EIF_BOOLEAN)(tc4 == (EIF_CHARACTER_8) 'M')) || (EIF_BOOLEAN)(tc5 == (EIF_CHARACTER_8) 'J')) || (EIF_BOOLEAN)(tc6 == (EIF_CHARACTER_8) 'O')) || (EIF_BOOLEAN)(tc7 == (EIF_CHARACTER_8) 'W')) || (EIF_BOOLEAN)(tc8 == (EIF_CHARACTER_8) 'Y')) || (EIF_BOOLEAN)(tc9 == (EIF_CHARACTER_8) '*')) || (EIF_BOOLEAN)(tc10 == (EIF_CHARACTER_8) 'B')) || (EIF_BOOLEAN)(tc11 == (EIF_CHARACTER_8) '-'))) {
		RTCK;
	} else {
		RTCF;
	}
	RTLO(2);
	RTMD(0);
	RTLE;
	RTEE;
}

void EIF_Minit977 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
