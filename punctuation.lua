#!/usr/bin/lua
-- Copyright 2014 Usmar A. Padow (amigojapan) usmpadow@gmail.com
-- Table of puctuation pronounciation
punctuation={}
punctuation["\\"]="back slash"
punctuation["!"]="exclamation mark"
punctuation["#"]="hash"
punctuation["$"]="dollar"
punctuation["%"]="percent"
punctuation["&"]="and sign"
punctuation["'"]="single quote"
punctuation["\""]="quote"
punctuation["("]="open parenthesis"
punctuation[")"]="close parenthesis"
punctuation["-"]="minus"
punctuation["="]="equal"
punctuation["^"]="carrot"
punctuation["~"]="tilde"
punctuation["¥"]="Yen"
punctuation["|"]="or sign"
punctuation["@"]="at"
punctuation["`"]="back tick"
punctuation["["]="open bracket"
punctuation["]"]="close bracket"
punctuation["{"]="open curly brace"
punctuation["}"]="close curly brace"
punctuation[";"]="semi colon"
punctuation[":"]="colon"
punctuation["+"]="plus"
punctuation["*"]="asterisk"
punctuation[","]="comma"
punctuation["."]="dot"
punctuation[">"]="more than"
punctuation["<"]="less than"
punctuation["/"]="foward slash"
punctuation["?"]="question mark"
punctuation["_"]="underscore"

function convert_punctuation_to_words(str,sayPunctuation,spaces)
	if spaces then
		str = string.gsub(str,"%s+"," Space ")
	end
	if sayPunctuation then
		for mark, word in pairs(punctuation) do
			str = string.gsub(str,"%" .. mark," " .. word.. " ")
		end
	end
	--print(str)
	return str
end
