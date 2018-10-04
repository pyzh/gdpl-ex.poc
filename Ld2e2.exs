#可读性优化版   #参数用英文字母

defmodule Ld2e do 
    @句 "；" ; @令 "为" ; @此 :Ld2e
    #@确定 true ; @求 "求" ; @记 "记" ; @言 "，"
    import Lib ; import DS
    @指令1 "List1为'1234234'；记a为List1，b为2；求a中b的个数"
    
    def 开 do 分(); 印 "完" end

    def 分 do 拆( @指令1, @句) |> 特解 end

    def 特解 句 do  _仓= 储 @此; 句 |> 生一 |> 生二 |> 生三  end

    def 无 我 do 我 end

    def 生 句, 核\\&(&1) do
        ([名,实|_] = 拆 句, @令 ) #|> (& 印 &1).()
        键 = 转 名; 值 = 核.(实); 入 @此, {键,值} #列 @此, 全
    end

    def 生一 [一|言] do 
        生 一,&(文去 &1,"'") 
        言
    end
    def 生二 [二|言] do 
        印 2
        言    end
    def 生三 [三|_] do
        印 3
    end
end

Ld2e.开