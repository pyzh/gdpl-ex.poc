defmodule A do
    @a 1 ;  @b 2
    import Lib

    def run do 
        t930()
        t102a()
    end

    def t930 do   @a + @b   end
    def t102a do
        印 1 #Lib.印
        import DS
        全() 
    end
end

IO.puts A.run