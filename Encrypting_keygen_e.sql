Use Client


if OBJECT_ID (N'dbo.keygen_e', N'FN') IS NOT NULL  
    drop function keygen_e; 


go

create function keygen_e(@p int, @q int)
returns int

as
begin
	declare @n int
	declare @m int
	declare @i int
	declare @final int
	set @final = 0
	set @i = 2
	set @n = @p * @q
	set @m = (@p - 1) * (@q - 1)
	while @i < @m
		begin
			if dbo.gcd(@m,@i) = 1
				begin
					set @final = @i
					break
				end
			if @i = @m
				begin
					return 0
				end
			set @i = @i + 1
		end
	return @final
end