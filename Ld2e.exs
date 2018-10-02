defmodule Lib do
    # 文="字符串"
    def 印 文 do IO.puts 文 end
    def 拆 文,间隔 do String.split 文, 间隔 end
    def 文去 文,式 do String.trim 文, 式 end
    def 文起 文,前 do String.starts_with? 文, 前 end
    def 文移 文,位 do String.slice 文, 位, String.length(文) end
    def 组去 组,位 do List.delete_at 组,位 end
    def 循映 组,函 do Enum.map 组,函 end
    def 转 名 when is_bitstring 名 do String.to_atom 名 end

    def draftHelp do
        #a = String.split("1,2", ",")
        #[h|t] =a

        #[首句|后文] = 断句
        #子句 = 拆 首句, @言
    end
    def todo do
        #0. 用管道符优化顺序
        #1. 语义：结合=>BEAM进程
        #2. 实现通解
        #3. 用defmacro改进DSL，
        # 去除括号等结构化标点/提高可读性（speak，not read；
        # 参照：
        #https://github.com/elixir-lang/elixir/blob/58fb5c122c15b856cd42ef73e3d2ffaa7200f151/lib/elixir/lib/kernel.ex#L3221
        #4. 完善标准库映射[elixir,ETS, N2O, ...]
        #5. 基于N2O写一个demo，用中文
        #3.1 别名/可以用macro优化，实现a=String,b=a.to_charlist,b "x"
        #0.1 规范4处理一下
    end
    def 规范 do
        #1. 一行两三句，分号隔开，不超过五句。
        #2. 模块属性分隔，用[ ; ]的形式，即分号前后有空格
        #3. 写完了，认为stable的代码，可以适当合并行。
        #4. 非函数，最好用英文字母，大小写随意
    end
end

defmodule DS do # data store
    @全键 {:'$1',:_} ; @全 :'$1'
    def 储 名 do :ets.new 名,[:set,:protected] end # 表
    def 入 库,物 do :ets.insert(库,物) end # 物={名,实}
    def 列 库,式 do :ets.match 库,式 end
end

defmodule Ld2e do #原;为 '，' #原,为 '/'
    @句 "；" ; @言 "，" ; @令 "为" ; @记 "记" ; @求 "求"
    @确定 true
    @指令1 "List1为'1234234'；记a为List1，b为2；求a中b的个数"
    @此 :Ld2e

    def 分 do import Lib
        断句 = 拆 @指令1, @句 
        特解 断句
    end
    def 特解 句 do import DS
        [一,二,三] = 句; 仓 = 储 @此
        生一 一;生二 二;生三 三
    end
    def 通解 句 do end #略

    def 入 名,实 do import DS; 入 @此, {名,实} end

    def 无 我 do 我 end

    def 生 句, 核 \\ &无 do
        其 = 拆 句, @令; [名|实] = 其
        键 = 转 名; 值 = 核.(实); 入 键,值 end

    def 生一 言 do import Lib; 生 言,&(文去 &1,"'") end

    def 生二 言 do import Lib
        @确定 = 文前 言,@记; 文 = 文移 言,1
        句二 = 拆 文,@言; [言一,言二] = 句二
        生 言一,&转; 生 言二
    end

    def 列 do import DS; 列 @此, @全键 end

    def 查 言 do end
    def 生三 言 do import Lib
        @确定 = 文前 言,@求; 文 = 文移 言,1
        键集 = 列
        组 = 文去 文, ""
        组一 = 组去 组,0
        组二 = 组去 组,-1
        循映 组二, &转
        # 比较键集/组集
        # 取键组，
        # 按[中]设层级
        # 设置缩略语[[的]个数]]
        # 求[个数]
    end

    def 开 do
        #IO.puts @指令1
        #库 = Lib
        import Lib
        
        印 分
        #印 "1"
    end
end

Ld2e.开