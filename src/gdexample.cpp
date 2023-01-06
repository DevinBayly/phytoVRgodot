#include "gdexample.h"

using namespace godot;

void GDExample::_register_methods() {
    register_method("_process", &GDExample::_process);    
	register_property<GDExample, float>("amplitude", &GDExample::amplitude, 10.0);
	register_property<GDExample, String>("path", &GDExample::path, String("./test"));

}

GDExample::GDExample() {
}

GDExample::~GDExample() {
    // add your cleanup here
}

void GDExample::_init() {
    // initialize any variables here
    time_passed = 0.0;
	amplitude = 10.0;
	path = "./test";
}

void GDExample::_process(float delta) {
	Godot::print(String::num_scientific(amplitude));
	Godot::print(path);
    time_passed += delta;

    Vector2 new_position = Vector2(
        amplitude + (amplitude * sin(time_passed * 2.0)),
        amplitude + (amplitude * cos(time_passed * 1.5))
    );

    set_position(new_position);
}