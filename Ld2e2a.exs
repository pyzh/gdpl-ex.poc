#可读性优化版   #参数用英文字母

defmodule Ld2e do 
    @句 "；" ; @言 "，" ; @令 "为" ; @求 "求" ; @记 "记"
    @此 :Ld2e
    import Lib ; import DS
    @指令1 "List1为'1234234'；记a为List1，b为2；求a中b的个数"
    
    def 开 do 分(); 印 "完" end

    def 分 do 拆( @指令1, @句) |> 特解 end

    def 特解 z do  _仓= 储 @此; z |> 生一 |> 生二 |> 生三 end

    def 生 z, 核\\&(&1) do [a,b|_] = 拆 z, @令
        k = 转 a; v = 核.(b)
        入 @此, {k,v} end

    def 生一 [z|t] do 生 z,&(文去 &1,"'"); t end
    
    def 生二 [z|t] do true = 文起 z,@记
        [z1,z2] = 文移(z,1) |> 拆(@言)
        生 z1,&转/1; 生 z2;   t    end

    def 生三 [z|_] do true = 文起 z,@求
        kli = 列(@此,全键()) |> 循平
        sli = 文移(z,1) |> 拆("") |> 组去(0) |> 组去(-1) |> 循映(&转/1)
        vsli = for k<-sli, k in kli, do: {k, 解 k}
        true = :中 in sli
        {x,y} = 定位 转(sli), vsli, 组位(sli, :中)
        if 文有 z, "个数" do
            印 "A, B =", [x,y]
            印 "A中B的个数= ",计数(x,y)
        end
    end
    def 定位 t, vlis, 中位 do 定 = &(取 vlis, (取 t,&1))
        {定.(中位-1),定.(中位+1)} end

    def 解(a) when is_atom a do a2 = 取值(@此, a)
        case is_atom a2 do true -> 解 a2; _ -> a2 end end
end
Ld2e.开