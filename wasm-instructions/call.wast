(module
  (type (;0;) (func (param i32 i64 i64)))
  (type (;1;) (func (param i64)))
  (type (;2;) (func (param i32 i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (result i32)))
  (type (;5;) (func (param i32 i32) (result i32)))
  (type (;6;) (func))
  (type (;7;) (func (param i32) (result i32)))
  (type (;8;) (func (param i32)))
  (type (;9;) (func (param i64 i64 i64)))
  (type (;10;) (func (param i64 i64 i32) (result i32)))
  (import "env" "printui" (func (;0;) (type 1)))
  (import "env" "wasm_assert" (func (;1;) (type 2)))
  (import "env" "memset" (func (;2;) (type 3)))
  (import "env" "action_data_size" (func (;3;) (type 4)))
  (import "env" "read_action_data" (func (;4;) (type 5)))
  (import "env" "memcpy" (func (;5;) (type 3)))
  (func (;6;) (type 6)
    call 9) (;执行9号函数;)
  (func (;7;) (type 7) (param i32) (result i32) (;malloc/calloc;)
    (local i32 i32 i32)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            get_local 0          (;申请字节数Z;)
            i32.eqz
            br_if 0 (;@4;)       (;申请字节数Z为0, 转65;)
            i32.const 0
            i32.const 0
            i32.load offset=8204 (;从8204获得当前页数1(入栈);)
            get_local 0          
            i32.const 16
            i32.shr_u            (;字节数(出栈)右移16位(出栈) = 申请页数A(入栈);)
            tee_local 1          (;申请页数A放1号变量;)
            i32.add              (;申请页数A(出栈) + 当前页数(出栈) = 总页数B(入栈);)
            tee_local 2          (;总页数B放2号变量;)
            i32.store offset=8204 (;新页数B放8204;)
            i32.const 0
            i32.const 0
            i32.load offset=8196 (;从8196获得内存尾部地址8248(入栈);)
            tee_local 3          (;内存尾部地址end放3号变量;)
            get_local 0
            i32.add              (;内存尾部地址end(出栈) + 申请字节数Z(出栈) = new_end(入栈);)
            i32.const 7
            i32.add
            i32.const -8
            i32.and
            tee_local 0           (;( new_end + 7) / 8 = new_end2(new_end 8字节对齐)放0号变量;)
            i32.store offset=8196 (;new_end2放8196;)
            get_local 2
            i32.const 16
            i32.shl               (;总页数B左移16位，即总页数BX64K;)
            get_local 0           (;new_end2(入栈);)
            i32.le_u              (;new_end2和总页数X64K对比;)
            br_if 1 (;@3;)        (;大于需要+1页，转68;)
            get_local 1          
            memory.grow           (;增加页数A;)
            i32.const -1
            i32.eq
            br_if 2 (;@2;)        (;失败转81;)
            br 3 (;@1;)           (;成功转87;)
          end
          i32.const 0             (;返回值0(入栈);)
          return
        end
        i32.const 0
        get_local 2               (;总页数+1(入栈);)
        i32.const 1
        i32.add
        i32.store offset=8204     (;总页数+1放8204;)
        get_local 1               (;申请页数+1(入栈);)
        i32.const 1
        i32.add                   (;申请页数(出栈)+1(出栈);)
        memory.grow               
        i32.const -1
        i32.ne
        br_if 1 (;@1;)
      end
      i32.const 0
      i32.const 8216
      call 1                  (;失败;)
      get_local 3
      return
    end
    get_local 3)              (;成功，返回首地址;)
  (func (;8;) (type 8) (param i32))
  (func (;9;) (type 6)        (;初始化8204放页数/8196放内存尾地址;)
    (local i32)
    get_global 0 (;0号全局变量8176(入栈);)
    i32.const 16 (;常量16(入栈);)
    i32.sub      (;8176(出栈）-16（出栈） = 8160(入栈);)
    tee_local 0  (;8160 付值给0号变量;)
    i32.const 0  (;常量0(入栈);)
    i32.store offset=12 (;常量0(出栈)付值给8160(出栈) + 12 = 8172, 即[8172]=0 ;)
    i32.const 0  (;常量0(入栈);)
    get_local 0  (;8160(入栈);)
    i32.load offset=12 (;8160(出栈)+ 12 = 8172地址内的0(入栈);)
    i32.load           (;0（出栈）地址内的值8248?(入栈);)
    i32.const 7        (;常量7(入栈);)
    i32.add            (;8248(出栈）+ 7（出栈）= 8255(人栈);)
    i32.const -8       (;常量-8入栈;)
    i32.and            (;8255(出栈) & -8(出栈) = 8248(入栈), 即(8248+7)/8, 8字节对齐 ;)
    tee_local 0        (;8248付值给0号变量;)
    i32.store offset=8196 (;8248(出栈) 付值给 0(出栈) + 8196 = 8196, 即[8196] = 8248;)
    i32.const 0        (;常量0入栈;)
    get_local 0        (;变量0(8248)入栈;)
    i32.store offset=8192 (;8248(出栈) 付值给 0(出栈) + 8192 = 8192, 即[8192] = 8248;)
    i32.const 0        (;常量0入栈;)
    memory.size        (;内存页数1入栈;)
    i32.store offset=8204) (;内存页数1(出栈) 付值给0(出栈) + 8204 = 8204;)
  (func (;10;) (type 8) (param i32))
  (func (;11;) (type 0) (param i32 i64 i64)
    i32.const 0
    get_local 1
    i64.store32 offset=8208 (;[8208] = i;)
    get_local 0
    i32.const 10
    i32.store offset=28     (;[contract+28] = 10, 即call.balance1 = 10;)
    i32.const 0
    get_local 2
    i64.store32 offset=8212 (;[8212] = j;)
    get_local 1
    i64.const 4294967295
    i64.and
    call 0                  (;打印i;)
    i32.const 0
    i64.load32_u offset=8212
    call 0                  (;打印j;)
    get_local 0
    i64.load32_u offset=28
    call 0                  (;打印call.balance1;)
    get_local 0
    i64.load32_u offset=32
    call 0)                 (;打印call.balance2;)
  (func (;12;) (type 9) (param i64 i64 i64)
    (local i32)
    get_global 0 (;0号全局变量8192入栈, global0本次调用局部变量地址下限，返回前恢复;)
    i32.const 16 (;常量16入栈;)
    i32.sub      (;8192（出栈）-16（出栈） = 8176 入栈;)
    tee_local 3  (;8176 付值给3号变量;)
    set_global 0 (;8176 付值给0号全局变量;)
    call 6       (;执行6号函数, 初始化页数和内存尾地址;)
    block  ;; label = @1
      get_local 1 (;receiver(入栈);)
      get_local 0 (;code(入栈);)
      i64.ne      (;receiver(出栈) 和 code(出栈)相同为0(入栈);)
      br_if 0 (;@1;) (;不为0(出栈)跳出block @1;)
      get_local 2 (;action(入栈);)
      i64.const -3841130677495922688 (;常量(入栈);)
      i64.ne      (;action(出栈) 和 常量(出栈)相同为0(入栈);)
      br_if 0 (;@1;) (;不为0(出栈)跳出block @1;)
      get_local 3 (;3号变量8176入栈;)
      i32.const 0 (;常量0入栈;)
      i32.store offset=12 (;0(出栈)付值给 8176(出栈) + 12 = 8188;)
      get_local 3 (;3号变量8176入栈;)
      i32.const 1 (;常量1入栈;)
      i32.store offset=8 (;1(出栈)付值给 8176(出栈) + 8 = 8184 ;)
      get_local 3 (;3号变量8176入栈;)
      get_local 3 (;3号变量8176入栈;)
      i64.load offset=8 (;8176(出栈) + 8 = 8184 的值1入栈;)
      i64.store (;1(出栈)付值给8176(出栈), 就是把编号1放到3号变量，函数间接地址1通过elem转换指向11号函数;)
      get_local 1 (;recever(入栈);)
      get_local 1 (;code(入栈);)
      get_local 3 (;保存有函数间接地址1的8176(入栈);)
      call 13
      drop
    end
    i32.const 0
    call 10
    get_local 3
    i32.const 16
    i32.add
    set_global 0)
  (func (;13;) (type 10) (param i64 i64 i32) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32)
    get_global 0 (;0号全局变量8176入栈;)
    i32.const 64 (;常量64入栈;)
    i32.sub      (;8176(出栈) - 64（出栈） = 8112 入栈;)
    tee_local 3  (;8112 付值给3号变量;)
    set_local 4  (;8112(出栈)付值给4号变量;)
    get_local 3  (;3号变量8112入栈;)
    set_global 0 (;8112(出栈)给0号全局变量;)
    get_local 2  (;8176入栈;)
    i32.load offset=4 (;8176(出栈) + 4 = 8180的?0入栈;)
    set_local 5  (;0(出栈)付值给5号变量;)
    get_local 2  (;8176入栈;)
    i32.load     (;8176(出栈)的值函数间接地址1入栈;)
    set_local 6  (;函数间接地址1(出栈),付值给6号变量;)
    block  ;; label = @1
      block  ;; label = @2
        block  ;; label = @3
          block  ;; label = @4
            call 3        (;获得参数数据大小16(入栈);)
            tee_local 7   (;16(出栈)付值给7号变量;)
            i32.eqz       (;不等于0,0入栈;)
            br_if 0 (;@4;)(;不等于0,退出;)
            get_local 7   (;大小入栈;)
            i32.const 513 (;常量513入栈;)
            i32.lt_u      (;16(出栈) < 513(出栈), 1入栈;)
            br_if 1 (;@3;)(;1(出栈),跳转到212;)
            get_local 7   (;大小入栈;)
            call 7        (;申请内存;)
            set_local 2   (;内存地址放2号变量;)
            br 2 (;@2;)   (;跳转到222;)
          end
          i32.const 0     (;常量0入栈;)
          set_local 2     (;地址0放2号变量;)
          br 2 (;@1;)     (;跳转到222;)
        end
        get_local 3 (;8112(入栈);)
        get_local 7 (;大小16(入栈);)
        i32.const 15
        i32.add
        i32.const -16
        i32.and
        i32.sub     (;8112(出栈) - 16(大小) = 8096(入栈);)
        tee_local 2 (;buffer地址8096;)
        set_global 0 (;global 0设置成8096;)
      end
      get_local 2 (;buffer地址8096;)
      get_local 7 (;buffer大小;)
      call 4      (;读取参数数据;)
      drop
    end
    get_local 4
    i64.const 0
    i64.store offset=56
    get_local 4
    i64.const 0
    i64.store offset=48
    block  ;; label = @1
      get_local 7
      i32.const 7
      i32.gt_u
      br_if 0 (;@1;)
      i32.const 0
      i32.const 8241
      call 1
    end
    get_local 2
    get_local 7
    i32.add
    set_local 3
    get_local 4
    i32.const 48
    i32.add
    i32.const 8
    i32.add
    set_local 8 (;8号变量是第二个参数， 8112+48+8=8168;)
    get_local 4
    i32.const 48
    i32.add
    get_local 2
    i32.const 8
    call 5     (;复制第一个参数，buffer8096 复制8个字节到8112+48=8160;)
    drop
    get_local 2
    i32.const 8
    i32.add
    set_local 9
    block  ;; label = @1
      get_local 7
      i32.const -8
      i32.and
      i32.const 8
      i32.ne
      br_if 0 (;@1;)
      i32.const 0
      i32.const 8241
      call 1
    end
    get_local 8
    get_local 9
    i32.const 8
    call 5    (;复制第二个参数，buffer+8 8104号变量所指向的地址复制8个字节8号变量所指向的地址;)
    drop
    get_local 4
    i32.const 32
    i32.add
    get_local 3
    i32.store
    get_local 4
    get_local 2
    i32.store offset=24 (;ds设置给T;)
    get_local 4
    i32.const 28
    i32.add
    get_local 2
    i32.const 16
    i32.add
    i32.store
    get_local 4
    get_local 1
    i64.store offset=16 (;code设置给T;)
    get_local 4
    get_local 0
    i64.store offset=8  (;self设置给T;)
    get_local 4
    i32.const 8
    i32.add
    get_local 5
    i32.const 1
    i32.shr_s
    i32.add
    set_local 3         (;确定合约T地址8120;)
    get_local 4
    i32.const 48
    i32.add
    i32.const 8
    i32.add
    i64.load
    set_local 0
    get_local 4
    i64.load offset=48
    set_local 1
    block  ;; label = @1
      get_local 5
      i32.const 1
      i32.and
      i32.eqz
      br_if 0 (;@1;)
      get_local 3
      i32.load
      get_local 6
      i32.add
      i32.load
      set_local 6
    end
    get_local 3
    get_local 1
    get_local 0
    get_local 6 (;函数间接地址1(入栈);)
    call_indirect (type 0) (;函数间接地址1通过elem_table转换成11号函数;)
    block  ;; label = @1
      get_local 7
      i32.const 513
      i32.lt_u
      br_if 0 (;@1;)
      get_local 2
      call 8
    end
    get_local 4
    i32.const 64
    i32.add
    set_global 0
    i32.const 1)
  (table (;0;) 2 2 anyfunc)
  (memory (;0;) 1)
  (global (;0;) (mut i32) (i32.const 8192))
  (global (;1;) i32 (i32.const 8246))
  (global (;2;) i32 (i32.const 8246))
  (export "apply" (func 12))
  (elem (i32.const 1) 11)
  (data (i32.const 8216) "failed to allocate pages\00read\00")
  (data (i32.const 0) "8 \00\00"))
