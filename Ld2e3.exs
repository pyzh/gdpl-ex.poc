# full english notation version. cmd1 is also in english
# however, this is simple than totally english version.
# the total english version - 
# en:cmd1 = "List1 is '1234234'；set a as List1，b as 2；calc: count b in a"
# cn:cmd1 = "List1为'1234234'；记a为List1，b为2；求a中b的个数"
# math:cmd1="List1='1234234'; &a->List1,b->2; >>a/count/b"
# math:...  ">>count a<-b", ">>b/[a]", ">>b#a"

defmodule Ld2e do 
    @sentence "," ; @word " " ; @set "is" ; @as "->" ; @mark "set" ; @do "calc"
    @sure true ; @here :Ld2e
    import Lib ; import DS
    @cmd1 "List1='1234234'; &a->List1,b->2; >>a/count/b"