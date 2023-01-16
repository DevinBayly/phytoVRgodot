#include "gdexample.h"

using namespace godot;
using namespace std;

void GDExample::_register_methods()
{
	register_method("_process", &GDExample::_process);
	register_property<GDExample, float>("amplitude", &GDExample::amplitude, 10.0);
	register_property<GDExample, float>("speed", &GDExample::set_speed, &GDExample::get_speed, 1.0);
	register_property<GDExample, String>("file_pth", &GDExample::set_file_path, &GDExample::get_file_path, "specify plant ply file");
	register_property<GDExample, int>("point_skip", &GDExample::set_point_skip, &GDExample::get_point_skip, 1);

	register_signal<GDExample>((char *)"position_changed", "node", GODOT_VARIANT_TYPE_OBJECT, "new_pos", GODOT_VARIANT_TYPE_VECTOR2);
}

GDExample::GDExample()
{
}

GDExample::~GDExample()
{
	// add your cleanup here
}

void GDExample::_init()
{
	Godot::print("_init");

	// for some reason the tutorial initializes values here, which seems like it overrides the values set in the property window of the editor.
	time_passed = 0.0;
	amplitude = 10.0;
	speed = 10.0;
	point_skip = 1;
	already_rendered = false;

	// but if I don't set them here then they remain un initialized. How do I get the values typed into the property window to get used for my class members?

	this->_ready();
}

struct point
{
	double x;
	double z;
	double y;
	unsigned char r;
	unsigned char g;
	unsigned char b;
};

void GDExample::make_cloud()
{
	already_rendered = true;
	auto mat = ResourceLoader::get_singleton()->load("res://mat.tres");
	Godot::print("_ready printing point skip");
	Godot::print(String::num_scientific(point_skip));
	// Simple test code adapted from GDscript docs to native C++
	// Might leak if called repeatedly (not sure how that's handled),
	// but it gets a triangle on the screen.
	PoolVector3Array vertices;

	std::chrono::steady_clock::time_point beg = std::chrono::steady_clock::now();
	auto mySimpleMesh = ArrayMesh::_new();
	godot::Array arrays; // kind of a struct-of-arrays approach to vertex attributes (or array of arrays with enumerated keys)

	// Vertex colors don't show correctly, probably because there's no material/skin yet.
	PoolColorArray colors; // optional...
	//
	// read file, and populate the verts and colors
	// see if using the gd FILe type is faster than some c++ method

	// auto f = File::_new();
	ifstream f(file_pth.alloc_c_string(), ios::binary);
	cout << amplitude << endl;
	Godot::print("loading file");
	Godot::print(file_pth);
	string s;
	for (int i = 0; i < 11; i++)
	{
		getline(f, s);
	}
	int fbeg = int(f.tellg());
	f.seekg(0, ios::end);
	int fend = int(f.tellg());
	f.seekg(fbeg, ios::beg);
	// vector<char> buf(fend-fbeg);
	// f.read(buf.data(),fend-fbeg);
	//  figure out from the size of the data how many points we can have and print that
	int correct_size = 27;
	int buf_size = fend - fbeg;
	int size = (buf_size) / correct_size;
	cout << "printing buffer size and number of points" << endl;
	cout << buf_size << endl;
	cout << size << endl;
	// convert the entire thing into a vector of structs that we can iterate over

	vector<point *> points;
	std::chrono::steady_clock::time_point begin = std::chrono::steady_clock::now();
	vector<char> buf(fend - fbeg);
	f.read(buf.data(), fend - fbeg);
	for (int i = 0; i < size; i +=1)
	{

		// cout << i << endl;
		//  read 27 bytes and assign them to the parts of a point that matter
		point *p = reinterpret_cast<point *>(buf.data() + i * 27);
		// cout << p->x << endl;
		// cout << p->y << endl;
		// cout << p->z << endl;
		// cout << int(p->r) << endl;
		// cout << int(p->g) << endl;
		// cout << int(p->b) << endl;
		// points.push_back(p);
		//  these are just numbers taken from one of the files, it seems like it helps godot accurately render things if we can move the points back to closer to zero
		vertices.append(Vector3(p->x  -4.08990844e+05 ,p->y- 1.01224618,p->z- 3.66008650e+06));
		//vertices.append(Vector3(p->x, p->y, p->z));
		// vertices.append(Vector3(p->x  ,p->y,p->z));
		colors.append(Color(float(p->r) / 256.0, float(p->g) / 256.0, float(p->b) / 256.0));
	}

	Godot::print(vertices[0]);
	cout << vertices.size() << endl;

	arrays.resize(ArrayMesh::ARRAY_MAX);
	arrays[ArrayMesh::ARRAY_VERTEX] = vertices; // required
	arrays[ArrayMesh::ARRAY_COLOR] = colors;
	mySimpleMesh->add_surface_from_arrays(Mesh::PRIMITIVE_POINTS, arrays);
	mySimpleMesh->surface_set_material(0, mat);
	// pMeshInstance = new MeshInstance; // NO! BAD! Will crash the game!
	auto mySimpleMeshInstance = MeshInstance::_new(); // This is how we do things here.
	mySimpleMeshInstance->set_mesh(mySimpleMesh);
	add_child(mySimpleMeshInstance);
	Godot::print(mySimpleMeshInstance->to_string());
	// translate(-bb.position);
	// auto cam = get_node("../Camera");
	// cam->translate( q
	std::chrono::steady_clock::time_point end = std::chrono::steady_clock::now();
	std::cout << "Time difference = " << std::chrono::duration_cast<std::chrono::milliseconds>(end - begin).count() << "[ms]" << std::endl;
}

void GDExample::_ready()
{
	make_cloud();
	return;
}

void GDExample::_process(float delta)
{

	//
	//	time_passed += speed * delta;
	//
	//	Vector3 new_position = Vector3(
	//		amplitude + (amplitude * sin(time_passed * 20.0)),
	//		0,
	//		amplitude + (amplitude * cos(time_passed * 15.0))
	//	);
	//
	//	set_global_translation(new_position);
	//
	//	time_emit += delta;
	//	if (time_emit > 1.0) {
	//		emit_signal("position_changed", this, new_position);
	//
	//		time_emit = 0.0;
	//	}
}

void GDExample::set_speed(float p_speed)
{
	speed = p_speed;
}

float GDExample::get_speed()
{
	return speed;
}

void GDExample::set_file_path(String pth)
{
	cout << "setting file path" << endl;
	file_pth = pth;
}

String GDExample::get_file_path()
{
	return file_pth;
}
void GDExample::set_point_skip(int skip)
{
	// potentially remove existing point cloud and re-render
	Godot::print("given call to set points ");
	if (already_rendered) {
		// need to remove the previous child mesh
		Godot::print("removing old");
		int num_children = get_child_count();
		Godot::print(String::num_scientific(num_children));
		for (int i = 0 ; i < num_children;i++) {
		auto child_points = get_child(0);
		remove_child(child_points);
		child_points->queue_free();
		}
	}
	point_skip = skip;
	make_cloud();

}
int GDExample::get_point_skip()
{
	return point_skip;
}