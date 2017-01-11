Use Client


if OBJECT_ID (N'dbo.keygen_d', N'FN') IS NOT NULL  
    drop function keygen_d; 

go

create function keygen_d(@p int, @q int, @e int)
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
			if (@e * @i) % @m = 1
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