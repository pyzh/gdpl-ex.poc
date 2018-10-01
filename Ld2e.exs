defmodule Lib do
    # 文="字符串"
    def 印 文 do IO.puts 文 end
    def 拆 文 do String.split 文, "，"  end
end

defmodule Ld2e do
    @指令1 "List1为'1234234'，记a为List1/b为2，求a中b的个数"
    #s = String

    def 分 do import Lib
        指令 = 拆 @指令1
    end

    def draft do
        #a = String.split("1,2", ",")
        #[h|t] =a
    end
    # def chai do
    # 1
    # end

    def 开 do
        #IO.puts @指令1
        #库 = Lib
        import Lib
        
        印 分
        #印 "1"
    end
end

Ld2e.开