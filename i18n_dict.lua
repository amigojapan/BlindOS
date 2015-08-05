--internationalization and localization implementation by amigojapan
--dictionary for english, kept in seperate file you can include it by require("localizations.lua")
i18n={}
i18n["English"]={
	["Enter command:"]="Enter command:"
	}
i18n["Spanish"]={
	["Enter command:"]="Entre Commando:"
}
i18n["Japanese"]={
	["Enter command:"]="ご命令を："
	}
function i18n_setlang(lang)
	--print(i18n[lang]["Enter command:"])
	return i18n[lang]
end

--translate=i18n_setlang("English")
--print(translate["Hello World"])
--print(translate["Goodbye World"])
--translate=i18n_setlang("Spanish")
--print(translate["Hello World"])
--print(translate["Goodbye World"])
--translate=i18n_setlang("Japanese")
--print(translate["Hello World"])
--print(translate["Goodbye World"])　