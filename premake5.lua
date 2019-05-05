project "GLFW"
    kind "StaticLib"
    language "c"
    toolset "gcc"

    configuration { "gmake2" }
        targetextension (".a")

	-- targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    -- objdir ("obj/" .. outputdir .. "/%{prj.name}")

    targetdir ("lib")
    objdir ("obj")

    makesettings [[
        CC = gcc
    ]]

	files
	{
        "include/GLFW/glfw3.h",
        "include/GLFW/glfw3native.h",
        "src/glfw_config.h",
        "src/context.c",
        "src/init.c",
        "src/input.c",
        "src/monitor.c",
        "src/vulkan.c",
        "src/window.c"
    }

    links {
        "gdi32"
    }

	filter "system:windows"
        buildoptions { "-std=c11" }
        systemversion "latest"
        staticruntime "on"
        toolset "gcc"

        files
        {
            "src/win32_init.c",
            "src/win32_joystick.c",
            "src/win32_monitor.c",
            "src/win32_time.c",
            "src/win32_thread.c",
            "src/win32_window.c",
            "src/wgl_context.c",
            "src/egl_context.c",
            "src/osmesa_context.c"
        }

		defines
		{
            "_GLFW_WIN32",
            "_CRT_SECURE_NO_WARNINGS"
        }

    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"
