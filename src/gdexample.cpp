/*
#include "gdexample.h"

using namespace godot;

void GDExample::_register_methods() {
    register_method("_process", &GDExample::_process);
}

GDExample::GDExample() {
}

GDExample::~GDExample() {
    // add your cleanup here
}

void GDExample::_init() {
    // initialize any variables here
    time_passed = 0.0;
}

void GDExample::_process(float delta) {
    time_passed += delta;

    Vector2 new_position = Vector2(10.0 + (10.0 * sin(time_passed * 2.0)), 10.0 + (10.0 * cos(time_passed * 1.5)));

    set_position(new_position);
}
*/

#include "gdexample.h"

using namespace godot;

void GDExample::_register_methods() {
	register_method("_process", &GDExample::_process);
	register_property<GDExample, float>("amplitude", &GDExample::amplitude, 10.0);
	register_property<GDExample, float>("speed", &GDExample::set_speed, &GDExample::get_speed, 1.0);

	register_signal<GDExample>((char *)"position_changed", "node", GODOT_VARIANT_TYPE_OBJECT, "new_pos", GODOT_VARIANT_TYPE_VECTOR2);
}

GDExample::GDExample() {
}

GDExample::~GDExample() {
	// add your cleanup here
}

void GDExample::_init() {
	Godot::print("_init");

	// initialize any variables here
	time_passed = 0.0;
	amplitude = 10.0;
	speed = 10.0;

	this->_ready();
}

void GDExample::_ready() {
	Godot::print("_ready");

	// Simple test code adapted from GDscript docs to native C++
	// Might leak if called repeatedly (not sure how that's handled),
	// but it gets a triangle on the screen.
	PoolVector3Array vertices;
	vertices.push_back(Vector3(0, 10, 0));
	vertices.push_back(Vector3(10, 0, 0));
	vertices.push_back(Vector3(0, 0, 0));

	auto mySimpleMesh = ArrayMesh::_new();
	godot::Array arrays; // kind of a struct-of-arrays approach to vertex attributes (or array of arrays with enumerated keys)
	arrays.resize(ArrayMesh::ARRAY_MAX);
	arrays[ArrayMesh::ARRAY_VERTEX] = vertices; // required

	// Vertex colors don't show correctly, probably because there's no material/skin yet.
	PoolColorArray colors;  // optional...
	colors.append(Color(1,0,0));
	colors.append(Color(0,1,0));
	colors.append(Color(0,0,1));
	arrays[ArrayMesh::ARRAY_COLOR] = colors;
	mySimpleMesh->add_surface_from_arrays(Mesh::PRIMITIVE_TRIANGLES, arrays);

	// pMeshInstance = new MeshInstance; // NO! BAD! Will crash the game!
	auto mySimpleMeshInstance = MeshInstance::_new(); // This is how we do things here.
	mySimpleMeshInstance->set_mesh(mySimpleMesh);
	add_child(mySimpleMeshInstance);

}

void GDExample::_process(float delta) {
	// Godot::print("_process");

	time_passed += speed * delta;

	Vector3 new_position = Vector3(
		amplitude + (amplitude * sin(time_passed * 20.0)),
		0,
		amplitude + (amplitude * cos(time_passed * 15.0))
	);

	set_global_translation(new_position);

	time_emit += delta;
	if (time_emit > 1.0) {
		emit_signal("position_changed", this, new_position);

		time_emit = 0.0;
	}
}

void GDExample::set_speed(float p_speed) {
	speed = p_speed;
}

float GDExample::get_speed() {
	return speed;
}

