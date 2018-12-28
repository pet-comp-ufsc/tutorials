Nullables
=========

Nullables servem para guardar ValueTypes que podem receber o valor `null`,
funcionando de forma bem semelhante a `std::optional` de C++ e `Option` de
Rust. Segue um código de exemplo:

```cs
bool foo = true;          // `foo` é um bool normal
bool? bar = true;         // `bar` é um bool nullable
var foobar = (bool?)null; // Com inferência de tipo

if (foo && bar) {}    // true && false = false: não entra no if
if (foo && foobar) {} // true && ? = ?: entra ou não no if?
if (bar) {}           // true: entra no if
if (foobar) {}        // ?

if (bar.GetValueOrDefault(false)) {}    // bar = true, logo entra no if
if (bar.GetValueOrDefault(true)) {}     // bar = true, logo entra no if
if (foobar.GetValueOrDefault(false)) {} // foobar = null, logo pega o default,
                                        // que é falso, e portanto não entra no
                                        // if
if (foobar.GetValueOrDefault(true)) {}  // foobar = null, logo pega o default,
                                        // que é true, e portanto entra no if
```
