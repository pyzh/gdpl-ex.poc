#视觉可读性优化版
defmodule T3 do
    defmacro 是字符串(x) do quote do is_bitstring(unquote(x)) end end
    defmacro 符号类型(x) do quote do is_atom(unquote(x)) end end
    defmacro 是列表(x) do quote do is_list(unquote(x)) end end
    
    def 印(文) when 是字符串 文 do IO.puts 文 end
    def 印原 项,参\\[] do IO.inspect 项,参 end
    def 印 前缀,体 do 印原 体, label: 前缀 end
    
    def 拆(文,间隔) when 是字符串 文 do String.split 文, 间隔 end
    def 拆成单字 文 do 拆 文,"" end

    @全键 {:'$1',:_}
    def 储 名 do :ets.new 名,[:set,:protected,:named_table] end # 表
    def 入 库,物 do :ets.insert(库,物) end # 物={名,实}
    
    @此 :Ld2e ;  @求 "求" ; @记 "记" 
    def 存入索引区 条目 do 入 @此, 条目 end
    def 初始化索引 do 储 @此 end

    def 转符号(名) when 是字符串 名 do String.to_atom 名 end
    def 转元组(组) when 是列表 组 do List.to_tuple 组 end

    def 循映 组,函 do Enum.map 组,函 end
    def 全转符号型 列表 do 循映 列表, &转符号/1 end
    
    def 文去 文,式 do String.trim 文, 式 end
    def 去除单引号 x do 文去 x,"'" end

    def 文移 文,位 do String.slice 文, 位, String.length(文) end
    def 除去第一个字 x do 文移(x,1) end
    
    def 文起 文,前 do String.starts_with? 文, 前 end
    def 第一个字是记 x do 文起 x,@记 end
    def 第一个字是求 x do 文起 x,@求 end
    def 含有(文,子集) when 是字符串 文 do String.contains? 文,子集 end

    def 列 库,式 do :ets.match 库,式 end
    def 列出所有键 库 do 列 库,@全键 end
    def 列此出所有键 do 列出所有键 @此 end
    
    def 循平 组,函\\(& &1) do Enum.flat_map 组,函 end
    def 平铺 列表 do 循平 列表 end
    
    def 组位 组,值 do Enum.find_index 组, &(&1 == 值) end
    def 组去 组,位 do List.delete_at 组,位 end
    def 去除首项 list do 组去(list,0) end
    def 去除末项 list do 组去(list,-1) end

    def 取值 库,键 do [{^键,值}] = :ets.lookup 库,键; 值 end
    def 索引值 名 do 取值 @此, 名 end
    
    def 取(组,位) when is_tuple 组 and is_number 位 do elem 组,位 end
    def 取(组,键) when 是列表 组 and 符号类型 键 do Keyword.get 组,键 end # 领取

    def 计数(文,字) when 是字符串 文 and 是字符串 字 do 计数 拆(文,""),&(&1==字) end
    def 计数(组,函) when 是列表 组 and is_function 函,1 do Enum.count 组,函 end
end

defmodule Ld2e do import T3 
    @断句符 "；" ; @断言符 "，" ; @令 "为" ; @确定 true 
    @指令1 "List1为'12332234'；记a为List1，b为2；求a中b的个数"
    
    def 运行 do 断句(); 印 "完" end
    def 断句 do 拆(@指令1, @断句符) |> 特解 end

    def 特解 句 do  初始化索引()
        句 |> 分析第一句 |> 第二句 |> 第三句 end

    def 索引解析 句, 回调\\&(&1) do [名,实|_] = 拆 句, @令
        键 = 转符号 名; 值 = 回调.(实)
        存入索引区 {键,值} end

    def 分析第一句 [内容|余项] do 索引解析 内容,&去除单引号/1; 余项 end

    def 第二句 [内容|余项] do @确定 = 内容 |> 第一个字是记
        
        [前句,后句] = 内容 |> 除去第一个字 |> 拆(@断言符)
        索引解析 前句,&转符号/1
        索引解析 后句 ;   余项 end

    def 第三句 [内容|_] do @确定 = 内容 |> 第一个字是求
        
        键集 = 列此出所有键() |> 平铺
        组 = 内容 |> 除去第一个字 |> 拆成单字 |> 去除首项 |> 去除末项 |> 全转符号型

        键值 = for 键 <- 组, 键 in 键集, do: {键, 寻值 键} # 查找索引对应值
    
        {上,下} = 定位 组, 键值

        if 内容 |>含有("个数") do
            印 "A, B =", [上,下]
            印 "A中B的个数= ",计数(上,下)  end end

    def 定位 组, 键值 do @确定 = :中 in 组 
        组位值 = fn i -> 取 转元组(组),i end
        对应索引值 = fn x -> 取 键值, 组位值.(x) end
        中位 = _中字所在位置 = 组位(组, :中)
        左 =对应索引值.(中位-1) 
        右 =对应索引值.(中位+1) 
        {左,右} end

    def 寻值(名) when 符号类型 名 do 其 =  名 |> 索引值
        case 符号类型 其 do 
            @确定 -> 其 |> 寻值 
            _ -> 其 end end
end

Ld2e.运行

