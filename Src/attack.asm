.386
.model flat, stdcall
option casemap : none

include canvas.inc
include boxing.inc
include data.inc 
include levels.inc
include logistic.inc
include canvas-utils.inc
include attack.inc


.data
tempTime1    dd	  0
tempTime2    dd	  0

.code

;计算分数
Cal_Score proc flag : dword     ;flag判断是谁添加分数（0为初始化，1为玩家一加分，2为玩家二加分）
	xor ecx, ecx
	.if flag == 0    ;初始化
		mov Score1, ecx
		mov Score2, ecx
	.elseif flag == 1
	    inc UserScore_1
	.elseif flag == 2
	    inc UserScore_2
	.endif
	mov eax, flag
	ret
Cal_Score endp




releaseBuff proc CF : dword
    mov eax,CF
	.if CurrentMode==1   ;普通
		.if eax > tempTime1 && tempTime1 
			mov syPlayerFace_1,SY_FACE_DOWN
			mov tempTime1,0
		.endif

		.if eax > tempTime2  && tempTime2
			mov syPlayerFace_2,SY_FACE_DOWN
			mov tempTime2,0
		.endif
	.endif

	.if CurrentMode==2    ;击鼓传花
		.if eax > tempTime1 && tempTime1 
			mov syPlayerFace_1,SY_FACE_DOWN
			mov tempTime1,0
		.endif

		.if eax > tempTime2  && tempTime2
			mov syPlayerFace_2,SY_FACE_DOWN
			mov tempTime2,0
		.endif

		.if UserBuff == 0
			inc UserScore_1
		.elseif UserBuff ==1
			inc UserScore_2
		.endif
	.endif

	.if CurrentMode==3     ;死亡模式
		.if eax > tempTime1 && tempTime1 
			mov syPlayerFace_1,SY_FACE_DOWN
			mov tempTime1,0
		.endif

		.if eax > tempTime2  && tempTime2
			mov syPlayerFace_2,SY_FACE_DOWN
			mov tempTime2,0
		.endif

		.if UserBuff == 0
			dec UserScore_2
		.elseif UserBuff ==1
			dec UserScore_1
		.endif
	.endif

	ret
releaseBuff endp
			
; 被砍后更换图片切换
ChangePictures  proc pic_num : dword ,direction : dword    
    .if CurrentMode==1    ;1正常模式，2击鼓传花，3死亡模式
		.if pic_num == 1        ;被砍的是1
			xor eax, eax
			mov eax, SY_FACE_INJURE                  ;eax中放SY_FACE_INJURE
			mov syPlayerFace_1,eax   	             ;玩家一死亡
			mov ebx,CurrentFrame
			mov tempTime1,ebx
			add tempTime1,WAIT_TIME
		.endif

		.if pic_num == 2        ;被砍的是2
			xor eax, eax
			mov eax,SY_FACE_INJURE                  ;eax中放SY_FACE_INJURE
			mov syPlayerFace_2,eax   	            ;玩家二死亡
			mov ebx,CurrentFrame
			mov tempTime2,ebx
			add tempTime2,WAIT_TIME
		.endif
	.endif

    .if CurrentMode==2    ;1正常模式，2击鼓传花，3死亡模式
		.if pic_num == 1  &&  UserBuff==0       ;被砍的是1，且buff在1身上，buff给2
			;mov ebx,1
			mov UserBuff,1
			xor eax, eax
			mov eax, SY_FACE_INJURE                  ;eax中放SY_FACE_INJURE
			mov syPlayerFace_1,eax   	             ;玩家一死亡
			mov ebx,CurrentFrame
			mov tempTime1,ebx
			add tempTime1,WAIT_TIME

		.endif
		.if pic_num == 2 &&  UserBuff==1       ;被砍的是2,且buff在2身上，buff给1
			;mov ebx,0
			mov UserBuff,0
			xor eax, eax
			mov eax,SY_FACE_INJURE                  ;eax中放SY_FACE_INJURE
			mov syPlayerFace_2,eax   	            ;玩家二死亡
			mov ebx,CurrentFrame
			mov tempTime2,ebx
			add tempTime2,WAIT_TIME
		.endif
	.endif

    .if CurrentMode==3    ;1正常模式，2击鼓传花，3死亡模式
		.if pic_num == 2   &&  UserBuff==1    ;被砍的是1，炸弹在2的头上，炸弹给1
			;mov ebx,0
			mov UserBuff,0
			xor eax, eax
			mov eax, SY_FACE_INJURE                  ;eax中放SY_FACE_INJURE
			mov syPlayerFace_2,eax   	             ;玩家一死亡
			mov ebx,CurrentFrame
			mov tempTime2,ebx
			add tempTime2,WAIT_TIME

		.endif

		.if pic_num == 2   &&  UserBuff == 0    ;被砍的是1，炸弹在1的头上
			xor eax, eax
			mov eax, SY_FACE_INJURE                  ;eax中放SY_FACE_INJURE
			mov syPlayerFace_2,eax   	             ;玩家一死亡
			mov ebx,CurrentFrame
			mov tempTime2,ebx
			add tempTime2,WAIT_TIME

		.endif

		.if pic_num == 1   &&  UserBuff == 1    ;被砍的是2，炸弹在2的头上
			xor eax, eax
			mov eax, SY_FACE_INJURE                  ;eax中放SY_FACE_INJURE
			mov syPlayerFace_1,eax   	             ;玩家一死亡
			mov ebx,CurrentFrame
			mov tempTime2,ebx
			add tempTime2,WAIT_TIME

		.endif

		.if pic_num == 1  &&  UserBuff==0      ;被砍的是2，炸弹在1的头上，炸弹给2
			;mov ebx,1
			mov UserBuff,1
			xor eax, eax
			mov eax,SY_FACE_INJURE                  ;eax中放SY_FACE_INJURE
			mov syPlayerFace_1,eax   	            ;玩家二死亡
			mov ebx,CurrentFrame
			mov tempTime1,ebx
			add tempTime1,WAIT_TIME
		.endif
	.endif
	
	ret
ChangePictures endp


; ;1号玩家玩家点击攻击键调用攻击函数
AttackUser1 proc
	; 当前人的位置
	xor esi, esi
	movzx esi, UserPos_1_X       ;  esi记录当一号玩家位置(攻击者) x坐标
	mov edi, edi
	movzx edi, UserPos_1_Y       ;  edi记录当一号玩家位置(攻击者) y坐标

	; 目标人的位置
	xor eax, eax
	movzx eax, UserPos_2_X       ;  esi记录当二号玩家位置(攻击者) x坐标
	mov ebx, ebx
	movzx ebx, UserPos_2_Y       ;  edi记录当二号玩家位置(攻击者) y坐标

	.if (syPlayerFace_1 == 0)  &&  (edi >= ebx)  ;攻击者面向上,被攻击者在攻击者上方
		sub esi,eax      ;获得横坐标差值
		sub edi,ebx      ;获得纵坐标差值 
		xor edx,edx      ;edx置零
		mov edx, esi     ;横坐标差值到edx中
		test edx, edx    ; 是负数吗?
		jns l_ok1         ; No, 转走
		neg esi          ; Yes, 求其绝对值
		l_ok1:
		    ; 现在esi中就是原值的绝对值
			.if edi <=ATTACK_DIS && esi <=ATTACK_DIS    ;在攻击范围内
				invoke Cal_Score ,1
				xor ecx, ecx
				mov ecx, syPlayerFace_2
				invoke ChangePictures,2,ecx
		        ;攻击者击杀数+1
			    ;还原初始地图(刷新比分)
            .endif

	.elseif syPlayerFace_1 == 2  &&  edi <= ebx  ;攻击者面向下,被攻击者在攻击者下方
		sub esi,eax      ;获得横坐标差值
		sub ebx,edi      ;获得纵坐标差值 
		xor edx,edx      ;edx置零
		mov edx, esi     ;横坐标差值到edx中
		test edx, edx    ; 是负数吗?
		jns l_ok2         ; No, 转走
		neg esi          ; Yes, 求其绝对值
		l_ok2:
		    ; 现在esi中就是原值的绝对值
			.if esi <=ATTACK_DIS && ebx <=ATTACK_DIS    ;在攻击范围内
				invoke Cal_Score , 1
				xor ecx, ecx
				mov ecx, syPlayerFace_2
				invoke ChangePictures,2,ecx
		        ;攻击者击杀数+1
			    ;还原初始地图(刷新比分)
            .endif

	.elseif syPlayerFace_1 == 1  &&  esi <= eax  ;攻击者面向右,被攻击者在攻击者右方
		sub eax,esi      ;获得横坐标差值
		sub ebx,edi      ;获得纵坐标差值 
		xor edx,edx      ;edx置零
		mov edx, ebx     ;纵坐标差值到edx中
		test edx, edx    ; 是负数吗?
		jns l_ok3         ; No, 转走
		neg ebx          ; Yes, 求其绝对值
		l_ok3:
		    ; 现在ebx中就是原值的绝对值
			.if eax <=ATTACK_DIS && ebx <=ATTACK_DIS   ;在攻击范围内
				invoke Cal_Score , 1
				xor ecx, ecx
				mov ecx, syPlayerFace_2
				invoke ChangePictures,2,ecx
		        ;攻击者击杀数+1
			    ;还原初始地图(刷新比分)
            .endif

	.elseif syPlayerFace_1 == 3  &&  esi >= eax  ;攻击者面向左,被攻击者在攻击者左方
		sub esi,eax      ;获得横坐标差值
		sub ebx,edi      ;获得纵坐标差值 
		xor edx,edx      ;edx置零
		mov edx, ebx     ;纵坐标差值到edx中
		test edx, edx    ; 是负数吗?
		jns l_ok4         ; No, 转走
		neg ebx          ; Yes, 求其绝对值
		l_ok4:
		    ; 现在ebx中就是原值的绝对值
			.if esi <=ATTACK_DIS && ebx <=ATTACK_DIS   ;在攻击范围内
				invoke Cal_Score , 1
				xor ecx, ecx
				mov ecx, syPlayerFace_2
				invoke ChangePictures,2,ecx
		        ;攻击者击杀数+1
			    ;还原初始地图(刷新比分)
            .endif

	.endif
	ret
AttackUser1 endp


; ;2号玩家玩家点击攻击键调用攻击函数
AttackUser2 proc
	; 目标人的位置
	xor esi, esi
	movzx esi, UserPos_1_X       ;  esi记录当一号玩家位置(攻击者) x坐标
	mov edi, edi
	movzx edi, UserPos_1_Y       ;  edi记录当一号玩家位置(攻击者) y坐标

	; 当前人的位置
	xor eax, eax
	movzx eax, UserPos_2_X       ;  esi记录当二号玩家位置(攻击者) x坐标
	mov ebx, ebx
	movzx ebx, UserPos_2_Y       ;  edi记录当二号玩家位置(攻击者) y坐标

	.if (syPlayerFace_2 == 0  &&  edi <= ebx)  ;攻击者面向上,被攻击者在攻击者上方
		sub esi,eax      ;获得横坐标差值
		sub ebx,edi      ;获得纵坐标差值 
		xor edx,edx      ;edx置零
		mov edx, esi     ;横坐标差值到edx中
		test edx, edx    ; 是负数吗?
		jns l_ok5         ; No, 转走
		neg esi          ; Yes, 求其绝对值
		l_ok5:
		    ; 现在esi中就是原值的绝对值
			.if ebx <=ATTACK_DIS && esi <=ATTACK_DIS    ;在攻击范围内
				invoke Cal_Score , 2
				xor ecx, ecx
				mov ecx, syPlayerFace_1
				invoke ChangePictures,1,ecx
		        ;攻击者击杀数+1
			    ;还原初始地图(刷新比分)
            .endif

	.elseif syPlayerFace_2 == 2  &&  edi >= ebx  ;攻击者面向下,被攻击者在攻击者下方
		sub esi,eax      ;获得横坐标差值
		sub edi,ebx      ;获得纵坐标差值 
		xor edx,edx      ;edx置零
		mov edx, esi     ;横坐标差值到edx中
		test edx, edx    ; 是负数吗?
		jns l_ok6         ; No, 转走
		neg esi          ; Yes, 求其绝对值
		l_ok6:
		    ; 现在esi中就是原值的绝对值
			.if esi <=ATTACK_DIS && edi <=ATTACK_DIS   ;在攻击范围内
				invoke Cal_Score , 2
				xor ecx, ecx
				mov ecx, syPlayerFace_1
				invoke ChangePictures,1,ecx
		        ;攻击者击杀数+1
			    ;还原初始地图(刷新比分)
            .endif

	.elseif syPlayerFace_2 == 1  &&  esi >= eax  ;攻击者面向右,被攻击者在攻击者右方
		sub esi,eax      ;获得横坐标差值
		sub ebx,edi      ;获得纵坐标差值 
		xor edx,edx      ;edx置零
		mov edx, ebx     ;纵坐标差值到edx中
		test edx, edx    ; 是负数吗?
		jns l_ok7         ; No, 转走
		neg ebx          ; Yes, 求其绝对值
		l_ok7:
		    ; 现在ebx中就是原值的绝对值
			.if esi <=ATTACK_DIS && ebx <=ATTACK_DIS    ;在攻击范围内
				invoke Cal_Score , 2
				xor ecx, ecx
				mov ecx, syPlayerFace_1
				invoke ChangePictures,1,ecx
		        ;攻击者击杀数+1
			    ;还原初始地图(刷新比分)
            .endif

	.elseif syPlayerFace_2 == 3  &&  esi <= eax  ;攻击者面向左,被攻击者在攻击者左方
		sub eax,esi      ;获得横坐标差值
		sub ebx,edi      ;获得纵坐标差值 
		xor edx,edx      ;edx置零
		mov edx, ebx     ;纵坐标差值到edx中
		test edx, edx    ; 是负数吗?
		jns l_ok8         ; No, 转走
		neg ebx          ; Yes, 求其绝对值
		l_ok8:
		    ; 现在ebx中就是原值的绝对值
			.if eax <=ATTACK_DIS && ebx <=ATTACK_DIS    ;在攻击范围内
				invoke Cal_Score , 2
				mov ecx, ecx
				mov ecx, syPlayerFace_1
			    invoke ChangePictures,1,ecx
		        ;攻击者击杀数+1
			    ;还原初始地图(刷新比分)
            .endif

	 .endif
	ret
AttackUser2 endp

end