local sanitizers = { }

local mflags = {
    release = {},
    debug = {
        "-Wno-unused-function", "-Wno-unused-parameter", "-Wno-unused-variable"
    },
    regular = {
        "-Wall", "-Wextra", "-Werror",

        "-Wno-unused-variable", "-Wno-unused-parameter",
    }
}

local ldflags = {
    release = {},
    debug = {},
    regular = {
    }
}

set_languages {
    "gnulatest"
}

add_rules("mode.debug", "mode.release")

add_requires("objfw", "libui master", { configs = { shared = is_kind("shared") } })

target("ObjUI")
do
    set_kind(is_kind("shared") and "shared" or "static")
    add_packages("objfw", "libui")

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
