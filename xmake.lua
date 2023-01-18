includes("package.lua")

--Config:
local packages = {
    "ObjFW-local",
    "libui",
}

local sanitizers = { }



local mflags = {
    release = {},
    debug = {
        "-Wno-unused-function", "-Wno-unused-parameter", "-Wno-unused-variable"
    },
    regular = {
        "-Wall", "-Wextra", "-Werror",
        "-fmodules",
        "-fexceptions", "-fobjc-exceptions", "-funwind-tables", "-fconstant-string-class=OFConstantString", "-Xclang", "-fno-constant-cfstrings", "-Xclang", "-fblocks", "-fobjc-arc", "-fobjc-arc-exceptions",
        "-Wno-unused-variable", "-Wno-unused-parameter",
    }
}

local ldflags = {
    release = {},
    debug = {},
    regular = {
        -- "-L/usr/local/lib", "-lobjfw",
        "-lm", "-ldl", "-lpthread", "", "-fexceptions", "-Wl,-U,_NSFoundationVersionNumber",
        -- "-Wl,-rpath,/usr/local/lib"
    }
}

set_languages {
    "gnulatest"
}

add_rules("mode.debug", "mode.release")

add_requires(packages)

target("ObjUI")
do
    set_kind("shared")
    add_packages(packages)

    add_files("src/**.m")
    add_headerfiles("src/**.h")

    add_includedirs("src/", { public = true })

    add_mflags(mflags.regular)
    add_ldflags(ldflags.regular)

    if is_mode("debug") then
        add_mflags(mflags.debug)
        add_ldflags(ldflags.debug)

        for _, v in ipairs(sanitizers) do
            add_mflags("-fsanitize=" .. v)
            add_ldflags("-fsanitize=" .. v)
        end

        add_defines("PROJECT_DEBUG")
    elseif is_mode("release") then
        add_mflags(mflags.release)
        add_ldflags(ldflags.release)
    end
end
target_end()

includes("test")
