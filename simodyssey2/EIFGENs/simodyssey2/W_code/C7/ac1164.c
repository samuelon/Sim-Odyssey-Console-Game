/*
 * Code for class ACT_WORMHOLE
 */

#include "eif_eiffel.h"
#include "../E1/estructure.h"


#ifdef __cplusplus
extern "C" {
#endif

extern void F1164_10263(EIF_REFERENCE);
extern void F1164_10264(EIF_REFERENCE, EIF_TYPED_VALUE);
extern void EIF_Minit1164(void);

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

/* {ACT_WORMHOLE}.make */
void F1164_10263 (EIF_REFERENCE Current)
{
	GTCX
	char *l_feature_name = "make";
	RTEX;
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	RTLI(4);
	RTLR(0,Current);
	RTLR(1,tr1);
	RTLR(2,tr2);
	RTLR(3,ur1);
	RTLIU(4);
	RTLU (SK_VOID, NULL);
	RTLU (SK_REF, &Current);
	
	RTEAA(l_feature_name, 1163, Current, 0, 0, 16550);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1163, Current, 16550);
	RTIV(Current, RTAL);
	RTHOOK(1);
	RTDBGAA(Current, dtype, 7900, 0xF80003DA, 0); /* act_name */
	tr1 = RTLNSMART(RTWCT(7900, dtype, Dftype(Current)).id);
	tr2 = RTMS_EX_H("wormhole",8,2038174821);
	ur1 = tr2;
	(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTWC(6319, Dtype(tr1)))(tr1, ur1x);
	RTNHOOK(1,1);
	tr1 = RTCCL(tr1);
	RTAR(Current, tr1);
	*(EIF_REFERENCE *)(Current + RTWA(7900, dtype)) = (EIF_REFERENCE) tr1;
	RTHOOK(2);
	RTDBGAA(Current, dtype, 7901, 0x04000000, 1); /* invalid */
	*(EIF_BOOLEAN *)(Current + RTWA(7901, dtype)) = (EIF_BOOLEAN) (EIF_BOOLEAN) 0;
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(3);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(2);
	RTEE;
#undef ur1
}

/* {ACT_WORMHOLE}.wormhole */
void F1164_10264 (EIF_REFERENCE Current, EIF_TYPED_VALUE arg1x)
{
	GTCX
	char *l_feature_name = "wormhole";
	RTEX;
	EIF_BOOLEAN loc1 = (EIF_BOOLEAN) 0;
	struct eif_ex_984 sloc2;
	EIF_REFERENCE loc2 = (EIF_REFERENCE) sloc2.data;
	EIF_INTEGER_32 loc3 = (EIF_INTEGER_32) 0;
	EIF_INTEGER_32 loc4 = (EIF_INTEGER_32) 0;
	EIF_REFERENCE loc5 = (EIF_REFERENCE) 0;
	EIF_REFERENCE loc6 = (EIF_REFERENCE) 0;
#define arg1 arg1x.it_r
	EIF_TYPED_VALUE up1x = {{0}, SK_POINTER};
#define up1 up1x.it_p
	EIF_TYPED_VALUE up2x = {{0}, SK_POINTER};
#define up2 up2x.it_p
	EIF_TYPED_VALUE ur1x = {{0}, SK_REF};
#define ur1 ur1x.it_r
	EIF_TYPED_VALUE ur2x = {{0}, SK_REF};
#define ur2 ur2x.it_r
	EIF_TYPED_VALUE ur3x = {{0}, SK_REF};
#define ur3 ur3x.it_r
	EIF_TYPED_VALUE ui4_1x = {{0}, SK_INT32};
#define ui4_1 ui4_1x.it_i4
	EIF_TYPED_VALUE ui4_2x = {{0}, SK_INT32};
#define ui4_2 ui4_2x.it_i4
	EIF_REFERENCE tr1 = NULL;
	EIF_REFERENCE tr2 = NULL;
	EIF_INTEGER_32 ti4_1;
	EIF_BOOLEAN tb1;
	EIF_BOOLEAN tb2;
	EIF_BOOLEAN tb3;
	RTCFDT;
	RTCDT;
	RTSN;
	RTDA;
	RTLD;
	
	
	memset (&sloc2.overhead, 0, OVERHEAD + 0);
	sloc2.overhead.ov_flags = EO_EXP | EO_STACK;
	RT_DFS(&sloc2.overhead, eif_new_type(984, 0x00).id);
	RTLI(9);
	RTLR(0,arg1);
	RTLR(1,loc5);
	RTLR(2,Current);
	RTLR(3,tr1);
	RTLR(4,tr2);
	RTLR(5,loc2);
	RTLR(6,ur1);
	RTLR(7,ur2);
	RTLR(8,ur3);
	RTLIU(9);
	RTLU (SK_VOID, NULL);
	RTLU(SK_REF,&arg1);
	RTLU (SK_REF, &Current);
	RTLU(SK_BOOL, &loc1);
	RTLU(SK_REF, &loc2);
	RTLU(SK_INT32, &loc3);
	RTLU(SK_INT32, &loc4);
	RTLU(SK_REF, &loc5);
	RTLU(SK_REF, &loc6);
	
	RTEAA(l_feature_name, 1163, Current, 6, 1, 16551);
	RTSA(dtype);
	RTSC;
	RTME(dtype, 0);
	RTGC;
	RTDBGEAA(1163, Current, 16551);
	RTCC(arg1, 1163, l_feature_name, 1, eif_new_type(1138, 0x01), 0x01);
	RTIV(Current, RTAL);
	wstdinit(loc2,loc2);
	RTLXI(loc2);
	RTHOOK(1);
	RTDBGAL(5, 0xF80003DB, 0, 0); /* loc5 */
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7897, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(1,1);
	tr2 = ((up2x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(6437, "galaxy", tr1))(tr1)), (((up2x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up2x.it_r = RTBU(up2x))), (up2x.type = SK_POINTER), up2x.it_r);
	loc5 = (EIF_REFERENCE) RTCCL(tr2);
	RTHOOK(2);
	tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(7456, "get_sector", arg1))(arg1)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
	RTNHOOK(2,1);
	tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(6300, "has_wormhole", tr1))(tr1)).it_b);
	if (tb1) {
		RTHOOK(3);
		tb1 = '\01';
		tb2 = '\01';
		tb3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(7449, "is_explorer", arg1))(arg1)).it_b);
		if (!tb3) {
			tb3 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(7451, "is_benign", arg1))(arg1)).it_b);
			tb2 = tb3;
		}
		if (!tb2) {
			tb2 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(7450, "is_malevolent", arg1))(arg1)).it_b);
			tb1 = tb2;
		}
		if (tb1) {
			RTHOOK(4);
			RTDBGAL(1, 0x04000000, 1, 0); /* loc1 */
			loc1 = (EIF_BOOLEAN) (EIF_BOOLEAN) 0;
			for (;;) {
				RTHOOK(5);
				if (loc1) break;
				RTHOOK(6);
				RTDBGAL(3, 0x10000000, 1, 0); /* loc3 */
				ui4_1 = ((EIF_INTEGER_32) 1L);
				ui4_2 = ((EIF_INTEGER_32) 5L);
				ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(6317, "rchoose", loc2))(loc2, ui4_1x, ui4_2x)).it_i4);
				loc3 = (EIF_INTEGER_32) ti4_1;
				RTHOOK(7);
				RTDBGAL(4, 0x10000000, 1, 0); /* loc4 */
				ui4_1 = ((EIF_INTEGER_32) 1L);
				ui4_2 = ((EIF_INTEGER_32) 5L);
				ti4_1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(6317, "rchoose", loc2))(loc2, ui4_1x, ui4_2x)).it_i4);
				loc4 = (EIF_INTEGER_32) ti4_1;
				RTHOOK(8);
				{
					static EIF_TYPE_INDEX typarr0[] = {0xFF01,0xFFF9,2,186,221,221,0xFFFF};
					EIF_TYPE typres0;
					static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
					
					typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
					tr1 = RTLNTS(typres0.id, 3, 1);
				}
				((EIF_TYPED_VALUE *)tr1+1)->it_i4 = loc3;
				((EIF_TYPED_VALUE *)tr1+2)->it_i4 = loc4;
				ur1 = RTCCL(tr1);
				tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(6355, "get_sector", loc5))(loc5, ur1x)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
				RTNHOOK(8,1);
				tb1 = (((FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTVF(6293, "is_full", tr1))(tr1)).it_b);
				if ((EIF_BOOLEAN) !tb1) {
					RTHOOK(9);
					{
						static EIF_TYPE_INDEX typarr0[] = {0xFF01,0xFFF9,2,186,221,221,0xFFFF};
						EIF_TYPE typres0;
						static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
						
						typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
						tr1 = RTLNTS(typres0.id, 3, 1);
					}
					ti4_1 = *(EIF_INTEGER_32 *)(arg1 + RTVA(7433, "row", arg1));
					((EIF_TYPED_VALUE *)tr1+1)->it_i4 = ti4_1;
					ti4_1 = *(EIF_INTEGER_32 *)(arg1 + RTVA(7434, "col", arg1));
					((EIF_TYPED_VALUE *)tr1+2)->it_i4 = ti4_1;
					ur1 = RTCCL(tr1);
					{
						static EIF_TYPE_INDEX typarr0[] = {0xFF01,0xFFF9,2,186,221,221,0xFFFF};
						EIF_TYPE typres0;
						static EIF_TYPE typcache0 = {INVALID_DTYPE, 0};
						
						typres0 = (typcache0.id != INVALID_DTYPE ? typcache0 : (typcache0 = eif_compound_id(dftype, typarr0)));
						tr2 = RTLNTS(typres0.id, 3, 1);
					}
					((EIF_TYPED_VALUE *)tr2+1)->it_i4 = loc3;
					((EIF_TYPED_VALUE *)tr2+2)->it_i4 = loc4;
					ur2 = RTCCL(tr2);
					ur3 = RTCCL(arg1);
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE, EIF_TYPED_VALUE, EIF_TYPED_VALUE)) RTVF(6356, "place_ent", loc5))(loc5, ur1x, ur2x, ur3x);
					RTHOOK(10);
					tr1 = ((up1x = (FUNCTION_CAST(EIF_TYPED_VALUE, (EIF_REFERENCE)) RTWF(7897, dtype))(Current)), (((up1x.type & SK_HEAD) == SK_REF)? (EIF_REFERENCE) 0: (up1x.it_r = RTBU(up1x))), (up1x.type = SK_POINTER), up1x.it_r);
					RTNHOOK(10,1);
					ur1 = RTCCL(arg1);
					(FUNCTION_CAST(void, (EIF_REFERENCE, EIF_TYPED_VALUE)) RTVF(6441, "add_move_this_turn", tr1))(tr1, ur1x);
					RTHOOK(11);
					RTDBGAL(1, 0x04000000, 1, 0); /* loc1 */
					loc1 = (EIF_BOOLEAN) (EIF_BOOLEAN) 1;
					RTHOOK(12);
					(FUNCTION_CAST(void, (EIF_REFERENCE)) RTVF(7478, "set_use_wormhole", arg1))(arg1);
				}
			}
		}
	}
	RTVI(Current, RTAL);
	RTRS;
	RTHOOK(13);
	RTDBGLE;
	RTMD(0);
	RTLE;
	RTLO(9);
	RTEE;
#undef up1
#undef up2
#undef ur1
#undef ur2
#undef ur3
#undef ui4_1
#undef ui4_2
#undef arg1
}

void EIF_Minit1164 (void)
{
	GTCX
}


#ifdef __cplusplus
}
#endif
