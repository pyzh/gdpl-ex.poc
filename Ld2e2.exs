#可读性优化版   #参数用英文字母

defmodule Ld2e do 
    @句 "；" ; @言 "，" ; @令 "为" ; @记 "记" ; @求 "求"
    @确定 true ; @此 :Ld2e
    import Lib ; import DS
    @指令1 "List1为'1234234'；记a为List1，b为2；求a中b的个数"
    
    def 开 do 分(); 印 "完" end

    def 分 do 拆( @指令1, @句) |> 特解 end
    
    def 特解 句 do
        [一,二,三] = 句
        仓 = 储 @此
        #生一 一
    end
    
    def 无 我 do 我 end

    def 生 句, 核\\&(&1) do
        # 其 = 拆 句, @令; [名|实] = 其 # todo: |>
        # 键 = 转 名; 值 = 核.(实); 入 键,值 
    end

    def 生一 言 do 
        印 1
        # 生 言,&(文去 &1,"'") 
    end
    def 生二 言 do 
        印 2
    end
    def 生三 言 do
        印 2
    end
end

Ld2e.开