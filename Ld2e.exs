defmodule Ld2e do #原;为 '，' #原,为 '/'
    @句 "；" ; @言 "，" ; @令 "为" ; @记 "记" ; @求 "求"
    @确定 true ; @此 :Ld2e
    @指令1 "List1为'1234234'；记a为List1，b为2；求a中b的个数"
    import Lib ; import DS

    def 分 do 拆( @指令1, @句) |> 特解 end
    
    def 特解 句 do  _仓= 储 @此; 句 |> 生一 |> 生二 |> 生三  end
    
    def 通解 句 do end #略

    def 仓入 名,实 do 入 @此, {名,实} end

    def 无 我 do 我 end

    def 生 句, 核\\&(&1) do
        [名,实|_] = 拆 句, @令
        键 = 转 名; 值 = 核.(实); 入 @此, {键,值} end

    def 生一 言 do import Lib; 生 言,&(文去 &1,"'") end

    def 生二 言 do import Lib
        @确定 = 文起 言,@记; 文 = 文移 言,1
        句二 = 拆 文,@言; [言一,言二] = 句二
        生 言一,&转; 生 言二
    end

    def 列 do import DS; 列 @此, @全键 end

    def 查 言 do end
    def 生三 言 do import Lib
        @确定 = 文起 言,@求; 文 = 文移 言,1
        键集 = 列 # 得：已有token集
        组 = 拆 文, "" # 拆分成单字
        组一 = 组去 组,0; 组二 = 组去 组,-1 # 去除组内多余空项
        循映 组二, &转 # 文转符/bitstring->atom
        # 比较键集/组集
        List.keymember
        Enum.filter        
        # 取键组，
        # 按[中]设层级
        # 设置缩略语[[的]个数]]
        # 求[个数]
    end

    def 开 do 分(); 印 "完" end
end

Ld2e.开