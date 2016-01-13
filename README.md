This is a stage 1 ECMA-262 proposal to replace ES2015's section 19.2.3.5.

## Goals

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

## Definition of portability

A function F defined in a lexical environment L is portable if any function generated from a direct
eval of F.toString() in L has a [[Call]] internal method that is indistinguishable from F.[[Call]].

Two [[Call]] internal methods are indistinguishable if, for all `thisArgument` values,
`argumentList` values, and current execution context stacks `context`, each method returns the same
value according to `SameValue` and has the same effects on `context` when invoked with
`thisArgument` and `argumentList` in the execution context `context`.

## So what is not portable?

| What                            | Portable? | Why?                                                         |
|---------------------------------|-----------|--------------------------------------------------------------|
| Functions with lexical closure  | Yes       | Part of Lexical Environment                                  |
| Functions mentioning `this`     | Yes       | Part of Execution Context                                    |
| Functions with free variables   | Yes       | Part of Execution Context                                    |
| Functions mentioning new.target | Yes       | Part of Execution Context                                    |
| Arrows mentioning `arguments`   | Yes       | Part of Execution Context                                    |
| Arrows mentioning `this`        | Yes       | Part of Execution Context                                    |
| Functions in WithStatement      | Yes       | Part of Execution Context                                    |
| Super calls                     | No        | [[HomeObject]] is static but not part of Lexical Environment |
| Super properties                | No        | [[HomeObject]] is static but not part of Lexical Environment |

Functions that are not portable make use of a value that is determined statically but is not part of
the Lexical Environment, a static mapping between names and values (not to be confused with the
runtime component of an Execution Context, LexicalEnvironment).
