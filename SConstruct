#!/usr/bin/env python
from pathlib import Path
import os
import sys

env = SConscript("godot-cpp/SConstruct")

# For reference:
# - CCFLAGS are compilation flags shared between C and C++
# - CFLAGS are for C-specific compilation flags
# - CXXFLAGS are for C++-specific compilation flags
# - CPPFLAGS are for pre-processor flags
# - CPPDEFINES are for pre-processor defines
# - LINKFLAGS are for linking flags

# tweak this if you want to use different folders, or more folders, to store your source code in.
env.Append(CPPPATH=["src/"])
sources = Glob("src/*.cpp")

if env["platform"] == "macos":
    library = env.SharedLibrary(
        "binary/bin/libgdexample.{}.{}.framework/libgdexample.{}.{}".format(
            env["platform"], env["target"], env["platform"], env["target"]
        ),
        source=sources,
    )
else:
    library = env.SharedLibrary(
        "binary/bin/libgdexample{}{}".format(env["suffix"], env["SHLIBSUFFIX"]),
        source=sources,
    )

# create the configuration file using information from the compilation
conf = Path("example.gdextension").write_text(f"""
[configuration]

entry_symbol = "example_library_init"

[libraries]

windows.debug.x86_32 = "res://binary/bin/libgdexample.windows.template_debug.x86_32.dll"
windows.release.x86_32 = "res://binary/bin/libgdexample.windows.template_release.x86_32.dll"
windows.debug.x86_64 = "res://binary/bin/libgdexample.windows.template_debug.x86_64.dll"
windows.release.x86_64 = "res://binary/bin/libgdexample.windows.template_release.x86_64.dll"
linux.debug.x86_64 = "res://binary/bin/libgdexample.linux.template_debug.x86_64.so"
linux.release.x86_64 = "res://binary/bin/libgdexample.linux.template_release.x86_64.so"
linux.debug.arm64 = "res://binary/bin/libgdexample.linux.template_debug.arm64.so"
linux.release.arm64 = "res://binary/bin/libgdexample.linux.template_release.arm64.so"
linux.debug.rv64 = "res://binary/bin/libgdexample.linux.template_debug.rv64.so"
linux.release.rv64 = "res://binary/bin/libgdexample.linux.template_release.rv64.so"
""".strip())

Default(library)