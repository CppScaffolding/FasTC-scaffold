-- scaffold geniefile for FasTC

FasTC_script = path.getabsolute(path.getdirectory(_SCRIPT))
FasTC_root = path.join(FasTC_script, "FasTC")

FasTC_includedirs = {
	path.join(FasTC_script, "config"),
	FasTC_root,
}

FasTC_libdirs = {}
FasTC_links = {}
FasTC_defines = {}

----
return {
	_add_includedirs = function()
		includedirs { FasTC_includedirs }
	end,

	_add_defines = function()
		defines { FasTC_defines }
	end,

	_add_libdirs = function()
		libdirs { FasTC_libdirs }
	end,

	_add_external_links = function()
		links { FasTC_links }
	end,

	_add_self_links = function()
		links { "FasTC" }
	end,

	_create_projects = function()

project "FasTC"
	kind "StaticLib"
	language "C++"
	flags {}

	includedirs {
		FasTC_includedirs,
	}

	defines {}

	files {
		path.join(FasTC_script, "config", "**.h"),
		path.join(FasTC_root, "**.h"),
		path.join(FasTC_root, "**.cpp"),
	}

end, -- _create_projects()
}

---
