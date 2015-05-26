This is a proposal to replace ES2015 section 19.2.3.5.

The goals of this proposal are

0. remove the forward-incompatible requirement

    > If the implementation cannot produce a source code string that meets these
    > criteria then it must return a string for which `eval` will throw a
    > **SyntaxError** exception.

0. standardise the string representation of built-in functions and host objects

0. clarify requirement of representation based on the "actual characteristics" of an object
