function convert( chars, dist, inv )
	return string.char( ( string.byte( chars ) - 32 + ( inv and -dist or dist ) ) % 95 + 32 )
end
function crypt(str,k,inv)
local enc= "";
for i=1,#str do
if(#str-k[5] >= i or not inv)then
for inc=0,3 do
if(i%4 == inc)then
enc = enc .. convert(string.sub(str,i,i),k[inc+1],inv);
break;
end
end
end
end
if(not inv)then
for i=1,k[5] do
enc = enc .. string.char(math.random(32,126));
end
end
return enc;
end
enc1 = {23, 09, 99, 31, 26};
dofile("app0:/game.lua")