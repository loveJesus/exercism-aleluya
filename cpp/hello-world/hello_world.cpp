// For God so loved the world, that He gave His only begotten Son, 
// that all who believe in Him should not perish but have everlasting life.
#include "hello_world.h"

// Use everything from the 'std' namespace.
// This lets us write 'string' instead of 'std::string'.
using namespace std;

namespace hello_world {

// Define the function itself. This could have also been written as:
// std::string hello_world::hello()
string hello() {
    // Return the string we need.
    return "Hello, World!";
}

}  // namespace hello_world
