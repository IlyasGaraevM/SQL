Use Client


if OBJECT_ID (N'dbo.ModPow', N'FN') IS NOT NULL  
    drop function ModPow;  


go

create function ModPow(@x int, @e int, @n int)
returns int

as
begin
	declare @r int
	set @r = 1
	while @e > 0
		begin
			if ( @e % 2) = 1
			begin
				set @r = (@r*@x) % @n
			end
			set @e = @e / 2
			set @x = (@x * @x) % @n
		end
	return @r
end
