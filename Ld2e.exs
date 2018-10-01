defmodule Lib do
    # 文="字符串"
    def 印 文 do IO.puts 文 end
    def 拆 文,间隔 do String.split 文, 间隔  end
    
    def draft do
        #a = String.split("1,2", ",")
        #[h|t] =a

        #[首句|后文] = 断句
        #子句 = 拆 首句, @言
    end
end

defmodule Ld2e do
    @句 "，"
    @言 "/"
    @令 "为"
    @指令1 "List1为'1234234'，记a为List1/b为2，求a中b的个数"

    def 储 do
        %{}
    end

    def 分 do import Lib
        断句 = 拆 @指令1, @句
        [一,二,三] = 断句
        仓 = 储
        存一 一,仓
        存二 二,仓
        存三 三,仓
    end
    def 入 库,名 
    def 存一 言,库 do import Lib
        句一 = 拆 言, @令
        [名|实] = 句一
        库
        
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