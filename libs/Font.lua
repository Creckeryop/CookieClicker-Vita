glyph_l = {}
glyph_r = {}
glyph_w = {}
function g_init(char, l, r) --this saves to an array the left and right pixels, as well as the width of each character, and the character's string is the index
    glyph_l[char] = l
    glyph_r[char] = r
    glyph_w[char] = r-l+1
end
g_init('0',414,430)
g_init('1',431,439)
g_init('2',440,454)
g_init('3',455,468)
g_init('4',469,483)
g_init('5',484,497)
g_init('6',498,512)
g_init('7',512,525)
g_init('8',526,540)
g_init('9',541,554)
g_init('A',1,19)
g_init('B',20,35)
g_init('C',36,52)
g_init('D',53,70)
g_init('E',71,84)
g_init('F',85,98)
g_init('G',99,116)
g_init('H',117,133)
g_init('I',134,139)
g_init('J',140,148)
g_init('K',149,164)
g_init('L',165,177)
g_init('M',178,196)
g_init('N',197,213)
g_init('O',214,232)
g_init('P',233,248)
g_init('Q',249,268)
g_init('R',269,284)
g_init('S',285,296)
g_init('T',297,310)
g_init('U',311,327)
g_init('V',328,344)
g_init('W',345,367)
g_init('X',368,383)
g_init('Y',384,399)
g_init('Z',400,413)
g_init('.',562,568)
g_init(' ',580,581)
g_init(':',555,561)
g_init('-',569,580)
g_init('#',582,599)
font_png = Graphics.loadImage(MODE.."/libs/font.png")
Center={}
function gpu_drawtext(x, y, text, font_color)
    local text_u = string.upper(text) --my font system is caps-only.
    local i_str=0 --the current position in the string
    local i_chr='' --the current character in the string
    local str_width = 0 --width in pixels of the string
    local str_length = string.len(text)
    local cw --character width
    while i_str < str_length do
        i_str = i_str + 1
        i_chr = string.sub(text_u, i_str, i_str)
        cw = glyph_w[i_chr]
        if cw ~= nil then --as long as the character exists
            Graphics.drawPartialImage(x+str_width, y,font_png, glyph_l[i_chr], 0, cw, 22, font_color)
            str_width = str_width + cw - 1
        end
    end
end
function gpu_drawCenteredtext(x, y, text, font_color)
    local text_u = string.upper(text) --my font system is caps-only.
    local i_str=0 --the current position in the string
    local i_chr='' --the current character in the string
    local str_width = 0 --width in pixels of the string
    local str_length = string.len(text)
    local cw --character width
	while i_str < str_length do
		i_str = i_str + 1
        i_chr = string.sub(text_u, i_str, i_str)
        cw = glyph_w[i_chr]
		if cw ~= nil then --as long as the character exists
            str_width = str_width + cw + 1
		end
	end
	Center[x*y]=str_width
	local text_u = string.upper(text) --my font system is caps-only.
    local i_str=0 --the current position in the string
    local i_chr='' --the current character in the string
    local str_width = 0 --width in pixels of the string
    local str_length = string.len(text)
    local cw --character width
    while i_str < str_length do
        i_str = i_str + 1
        i_chr = string.sub(text_u, i_str, i_str)
        cw = glyph_w[i_chr]
        if cw ~= nil then --as long as the character exists
			Graphics.drawPartialImage(x-math.floor(Center[x*y]/2)+str_width, y,font_png, glyph_l[i_chr], 0, cw, 22, font_color)
            str_width = str_width + cw + 1
        end
    end
end