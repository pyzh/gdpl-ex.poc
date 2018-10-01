defmodule Lib do
    # 文="字符串"
    def 印 文 do: IO.puts 文 
    def 拆 文,间隔 do: String.split 文, 间隔
    def 文去 文,式 do: String.trim 文, 式 
    def 文起 文,前 do: String.starts_with? 文, 前
    def 文移 文,位 do: String.slice 文, 位, String.length(文)
    def 转 名 when is_bitstring 名 do: String.to_atom 名

    def draftHelp do
        #a = String.split("1,2", ",")
        #[h|t] =a

        #[首句|后文] = 断句
        #子句 = 拆 首句, @言
    end
    def todo do
        #1. 语义：结合=>BEAM进程
        #2. 实现通解
        #3. 用defmacro改进DSL，参照：
        #https://github.com/elixir-lang/elixir/blob/58fb5c122c15b856cd42ef73e3d2ffaa7200f151/lib/elixir/lib/kernel.ex#L3221
    end
end

def DS do # data store
    def 储 名 do: :ets.new 名,{:set,:protected} # 表
    def 入 库,物 do: :ets.insert(库,物) # 物={名,实}
end

defmodule Ld2e do
    @句 "；" #原为 '，'
    @言 "，" #原为 '/'
    @令 "为"
    @记 "记"
    @确定 true
    @指令1 "List1为'1234234'；记a为List1，b为2；求a中b的个数"
    @此 :Ld2e

    def 分 do import Lib
        断句 = 拆 @指令1, @句 end
    def 特解 句 do import DS
        [一,二,三] = 断句
        仓 = 储 @此
        生一 一
        生二 二
        生三 三
    end
    def 通解 句 do: #略

    def 入 名,实 do import DS
        入 @此, {名,实}
    end
    def 生 文,何 do
        其 = 拆 文, @令
        [名|实] = 其
        键 = 转 名
        值 = 何.(实)
        入 键,值
    end
    def 生一 言 do import Lib
        句一 = 拆 言, @令
        [名|实] = 句一
        值 = 文去 实,"'"
        键 = 转 名
        入 键,值
    end
    def 生二 言 do import Lib
        @确定 = 文前 言,@记
        文 = 文移 言,1
        句二 = 拆 文,@言
        [言一,言二] = 句二


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