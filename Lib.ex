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
end

defmodule DS do # data store
    @全键 {:'$1',:_} ; @全 :'$1'
    def 储 名 do :ets.new 名,[:set,:protected] end # 表
    def 入 库,物 do :ets.insert(库,物) end # 物={名,实}
    def 列 库,式 do :ets.match 库,式 end
end