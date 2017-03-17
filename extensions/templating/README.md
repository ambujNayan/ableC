Template extension
==================

This extension provides templated types and functions, similar to C++.
The purpose of this extension is:
* For end-users of ableC, to provide a general mechanism of type polymorphish
* For extension writers, to allow for extensions (e.g. vector) that utilize a large amount of static,
type-dependant code to be able to write this in a header file
* As a demonstration of the the use of lifting, substituion, and extension of the env with new
namespaces.  

### Template struct declaration
```c++
template<a, b>
struct pair {
  a fst;
  b snd;
};
```
Note here that, as in C++, the struct is 'typedefed' automaticly, to be referenced as
`pair<int, float>` and not `struct pair<int, float>`.

### Template function declaration
```c++
template<a>
a max(a x, a y) {
  return x > y? x : y;
}
```
Note that all templated functions are implicitly static.  

### Template alias
```c++
using triple<a, b, c> = pair<a, pair<b, c>>;
```
This syntax is inspired by C++11.

### Template type instantiation
```c++
pair<int, float> foo = {1, 2.4};
foo.snd = 3.14;
```

### Template function instantiation
```c++
int x = max<int>(3, 4);
```
Note that C++-style explicit instantiation and type inference is not supported, yet.  But this is
both easy to implement for extension constructs which translate to template instantiations.  

### Overloaded operators

| Name                    | Example |
| ----------------------- | ------- |
| Append                  | v1 + v2 |
| Update assign           | v1 += v2 |
| Equality                | v1 == v2 |
| Subscript               | v[i] |
| Subscript assign        | v[i] = x |
| Show operator           | show(x) |

## Implementation
Templated definitions of types or values are placed in a new environment namespace.  When an
instantiation is performed, the template item is looked up and the ableC substitution mechanism is
used to construct the templated decl, with a mangled name based on the type arguments.  This is then
lifted to the global scope via the ableC lifting mechanism.
Note that this means that all instantation arguments must be defined globally; i.e. a typedef'ed type
local to a function cannot be used as an argument in an instantiation.

## Future work
* C++-style template parameter type inference would be nice.
* Using a templated type to implement an extension parameteric type is currently a bit complicated,
make this nicer somehow.  