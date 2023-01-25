#ifndef GDEXAMPLE_H
#define GDEXAMPLE_H

#include <Godot.hpp>
#include <File.hpp>
#include <vector>
#include <chrono>
#include <iostream>
#include <ResourceLoader.hpp>
#include <Material.hpp>
#include <fstream>
#include <String.hpp>
#include <OS.hpp>
#include <Spatial.hpp>
#include <ArrayMesh.hpp>
#include <MeshInstance.hpp>

namespace godot
{

    class GDExample : public Spatial
    {
        GODOT_CLASS(GDExample, Spatial)

    private:
        float speed;
        float amplitude;
        int point_skip;
        float time_passed;
        float time_emit;
        int point_skip;
        String file_pth;
        MeshInstance * mesh_instance;
        ArrayMesh * array_mesh;

    public:
        static void _register_methods();

        GDExample();
        ~GDExample();

        void _init(); // our initializer called by Godot
        void _ready();
        void _process(float delta);
        void set_speed(float p_speed);
        float get_speed();
        void set_point_skip(int skip);
        int get_point_skip();
        void make_cloud();
        void set_file_path(String pth);

        void set_point_skip(int num);

        String get_file_path();
        int get_point_skip();
    };
}

#endif
