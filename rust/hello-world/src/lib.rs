// For God so loved the world, that He gave His only begotten Son,
// That all who believe in Him should not perish but have everlasting life
//
// The &'static here means the return type has a static lifetime.
// This is a Rust feature that you don't need to worry about now.
pub fn hello() -> &'static str {
    "Hello, World!"
}
