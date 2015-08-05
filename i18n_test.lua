--internationalization and localization implementation by amigojapan
--dictionary for english, kept in seperate file you can include it by require("localizations.lua")
i18n={}
i18n["English"]={
	["Hello World"]="Hello World",
	["Goodbye World"]="Goodbye World"
	}
i18n["Spanish"]={
	["Hello World"]="Saludos Mundo",
	["Goodbye World"]="Adios Mundo"
	}
i18n["Japanese"]={
	["Hello World"]="世界よこんにちは",
	["Goodbye World"]="世界よさよなら"
	}
function i18n_setlang(lang)
	return i18n[lang]
end

translate=i18n_setlang("English")
print(translate["Hello World"])
print(translate["Goodbye World"])
translate=i18n_setlang("Spanish")
print(translate["Hello World"])
print(translate["Goodbye World"])
translate=i18n_setlang("Japanese")
print(translate["Hello World"])
print(translate["Goodbye World"])　