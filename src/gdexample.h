#ifndef GDEXAMPLE_H
#define GDEXAMPLE_H

#include <Godot.hpp>
#include <Spatial.hpp>
#include <ArrayMesh.hpp>
#include <MeshInstance.hpp>

namespace godot {

class GDExample : public Spatial {
    GODOT_CLASS(GDExample, Spatial)

private:
    float speed;
    float amplitude;
    float time_passed;
    float time_emit;

public:
    static void _register_methods();

    GDExample();
    ~GDExample();

    void _init(); // our initializer called by Godot
    void _ready();
    void _process(float delta);
void set_speed(float p_speed);
float get_speed();

};
}

#endif
