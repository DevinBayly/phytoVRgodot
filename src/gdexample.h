#ifndef GDEXAMPLE_H
#define GDEXAMPLE_H

#include <godot_cpp/classes/sprite2d.hpp>
#include <godot_cpp/godot.hpp>
// #include <File.hpp>
#include <vector>
#include <chrono>
#include <iostream>
#include <godot_cpp/classes/resource_loader.hpp>
#include <godot_cpp/classes/material.hpp>
#include <fstream>
// #include <String.hpp>
#include <godot_cpp/classes/os.hpp>
#include <godot_cpp/classes/node3d.hpp>
#include <godot_cpp/classes/array_mesh.hpp>
#include <godot_cpp/classes/mesh_instance3d.hpp>
#include <godot_cpp/variant/packed_vector3_array.hpp>
#include <godot_cpp/variant/packed_color_array.hpp>
#include <godot_cpp/variant/utility_functions.hpp>
namespace godot
{

    class GDExample : public Node3D
    {
        GDCLASS(GDExample, Node3D)

    private:
        float time_passed;
        float speed;
        float amplitude;
        float time_emit;
        int point_skip;
        String file_pth;
        MeshInstance3D *mesh_instance;
        ArrayMesh *array_mesh;
    protected:
        static void _bind_methods();

    public:
        GDExample();
        ~GDExample();

        void _init(); // our initializer called by Godot
        void _ready();
        void _process(float delta);
        void set_speed(float p_speed);
        float get_speed();
        void make_cloud();
        void set_file_path(String pth);

        void set_point_skip(int num);

        String get_file_path();
        int get_point_skip();
    };

}

#endif

