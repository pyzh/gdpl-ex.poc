#内联API，无封装版
defmodule Ld2e do  @this :Ld2e
    @cmd1 "List1为'1234234'；记a为List1，b为2；求a中b的个数"
    
    def run do split(); IO.puts "完" end
    
    def split do String.split(@cmd1, "；") |> sub end

    def sub z do  _table= :ets.new(@this, [:set,:protected,:named_table])
        z |> s1 |> s2 |> s3 end

    def s z, f\\&(&1) do 
        [a,b|_] = String.split z, "为"
        k = String.to_atom a; v = f.(b)
        :ets.insert @this, {k,v} end

    def s1 [z|t] do s z,&(String.trim &1,"'"); t end
    
    def s2 [z|t] do true = String.starts_with? z,"记"
        [z1,z2] = String.slice(z,1,String.length(z)) |> String.split("，")
        s z1,&String.to_atom/1; s z2;   t    end

    def s3 [z|_] do true = String.starts_with? z,"求"
        kli = :ets.match(@this,{:'$1',:_}) |> Enum.flat_map((& &1))
        sli = String.slice(z,1,String.length(z)) |> String.split("") |> List.delete_at(0) |> List.delete_at(-1) |> Enum.map(&String.to_atom/1)
        vsli = for k<-sli, k in kli, do: {k, find k}
        true = :中 in sli
        {x,y} = loc List.to_tuple(sli), vsli, Enum.find_index(sli,&(&1==:中))
        if String.contains? z, "个数" do
            IO.inspect [x,y], label: "A, B ="
            IO.inspect Enum.count(String.split(x,""),&(&1==y)), label: "A中B的个数= "
        end
    end
    def loc t, vlis, mid do set = &(Keyword.get vlis, (elem t,&1))
        {set.(mid-1),set.(mid+1)} end

    def find(a) when is_atom a do [{^a,a2}] = :ets.lookup(@this, a)
        case is_atom a2 do true -> find a2; _ -> a2 end end
end
Ld2e.run