## 问：为什么这里的参数多是中文？
## 答：因为相对的，这部分API封装较多，而原始API多是英文字符。
#      所以用中文反而视觉可读性更强一点。
## 问：一个井号的注释和两个井号的注释有何区别？
## 答：对机器来说没区别。相对而言，当作高优先级注释好了
#     井号后面有没有空格同理，目前还没有死的规定。

defmodule Lib do
    # 文="字符串"
    def 印 文 do IO.puts 文 end
    def 印原 体,参\\[] do IO.inspect 体,参 end
    def 印 前缀,体 do 印原 体, label: 前缀 end
    def 拆 文,间隔 do String.split 文, 间隔 end
    def 文去 文,式 do String.trim 文, 式 end
    def 文起 文,前 do String.starts_with? 文, 前 end
    def 文移 文,位 do String.slice 文, 位, String.length(文) end
    def 文有 文,有 do String.contains? 文,有 end
    def 组去 组,位 do List.delete_at 组,位 end
    def 组员 组,值,位\\0 do List.keymember? 组, 值,位 end
    def 组位 组,值 do Enum.find_index 组, &(&1 == 值) end
    def 循选 组,函 do Enum.filter 组,函 end
    def 循映 组,函 do Enum.map 组,函 end
    def 循平 组,函\\(& &1) do Enum.flat_map 组,函 end
    def 转(名) when is_bitstring 名 do String.to_atom 名 end
    def 转(组) when is_list 组 do List.to_tuple 组 end
    def 取(组,位) when is_tuple 组 and is_number 位 do elem 组,位 end
    def 取(组,键) when is_list 组 and is_atom 键 do Keyword.get 组,键 end # 领取
    def 计数(组,函) when is_list 组 and is_function 函,1 do Enum.count 组,函 end
    def 计数(文,字) when is_bitstring 文 and is_bitstring 字 do 计数 拆(文,""),&(&1==字) end
end

defmodule DS do # data store
    @全键 {:'$1',:_} ; @全 :'$1'
    def 储 名 do :ets.new 名,[:set,:protected,:named_table] end # 表
    def 入 库,物 do :ets.insert(库,物) end # 物={名,实}
    def 列 库,式 do :ets.match 库,式 end
    def 全 do @全 end  # todo： 用use macro来替代[函数/返回值
    def 全键 do @全键 end
    def 取值 库,键 do [{^键,值}] = :ets.lookup 库,键; 值 end
end