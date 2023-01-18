package("ObjFW-local")
do
    set_homepage("https://objfw.nil.im")
    set_description("Portable, lightweight framework for the Objective-C language")
    set_urls("https://github.com/ObjFW/ObjFW.git")

    -- add_versions("0.90.2", "728a593e0f3456e62948abcdbe2799e64aa74290")

    add_deps {
        "libtool", "autoconf", "automake"
    }

    on_install("linux", "macosx", function (package)
        import("package.tools.autoconf").install(package)
    end)

    on_load(function (package)
        import("lib.detect.find_tool")
        local objfw_config = find_tool("objfw-config")
        if not objfw_config then raise("Objfw-config not found!") end

        print("Objc flags: ", os.iorunv(objfw_config.program, { "--objcflags" }))
        print("Linker flags: ", os.iorunv(objfw_config.program,  { "--libs", "--ldflags", "--rpath" }))
        package:add("mflags", os.iorunv(objfw_config.program, { "--objcflags" }))
        package:add("ldflags", os.iorunv(objfw_config.program,  { "--libs", "--ldflags", "--rpath" }))
    end)
end
package_end()

package("libui")
do
    set_homepage("https://libui-ng.github.io/libui-ng/")
    set_description("A portable GUI library for C")

    set_urls("https://github.com/libui-ng/libui-ng.git")
    add_versions("0.1.0", "8c82e737eea2f8ab3667e227142abd2fd221f038")

    add_deps {
        "meson", "ninja"
    }

    on_install("linux", "macosx", function (package)
        local configs = {
            "-Dexamples=false",
            "-Dtests=false",
            "--default-library=shared",
        }

        import("package.tools.meson").install(package, configs)
    end)
end
package_end()
