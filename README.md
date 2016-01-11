This is a stage 1 ECMA-262 proposal to replace ES2015's section 19.2.3.5.

The original goals of this proposal were

0. remove the forward-incompatible requirement

    > If the implementation cannot produce a source code string that meets these
    > criteria then it must return a string for which `eval` will throw a
    > **SyntaxError** exception.

0. clarify the "functionally equivalent" requirement

0. standardise the string representation of built-in functions and host objects

0. clarify requirement of representation based on the "actual characteristics" of an object

The revised goals of this proposal also include

0. define concept of "portability" in `Function.prototype.isPortable`

0. make a guarantee about the behaviour of portable functions after deserialisation in a lexical context equivalent to the definition site
