## Function.prototype.toString ( )

When the `toString` method is called with an object *func* as its *thisValue*, the following steps are taken:

0. If *func* is a Bound Function exotic object, then return an implementation-dependent string source code representation of *func*. The representation must conform to the rules below. It is implementation dependent whether the representation includes bound function information or information about the target function.
0. If Type(*func*) is Object and is either a built-in function object or has an [[ECMAScriptCode]] internal slot, then return an implementation-dependent string source code representation of *func*. The representation must conform to the rules below.
0. Throw a **TypeError** exception.

`toString` Representation Requirements:

* If *func* was defined using ECMAScript code,

  * If *func* was not defined using *MethodDefinition* or *GeneratorMethod*, then the string representation must be such that if the string is evaluated using `eval` in a lexical context that is equivalent to the lexical context used to create *func*, an object will be created such that the object's [[Call]] internal method is indistinguishable from the [[Call]] internal method of *func*. Two [[Call]] internal methods are indistinguishable if, for all `thisArgument` values, `argumentList` values, and current execution context stack `context`, each method returns the same value according to SameValue and has the same effects on `context` when invoked with `thisArgument` and `argumentList` in the execution context `context`. The string representation must not mention freely any variables that were not mentioned freely by *func*'s source code, even if these "extra" names were originally in scope. NOTE: This rule can be widened to include MethodDefinition and GeneratorMethod by saying the [[Call]] behaviour would be the same if the function does not contain (according to the Contains static semantic rule) `this`, `new.target`, or `super`.
  * If *func* was defined using *FunctionExpression* or *FunctionDeclaration*, the string representation must have the syntax of a *FunctionExpression*.
  * If *func* was defined using *ClassExpression* or *ClassDeclaration*, the string representation must have the syntax of a *ClassExpression*.
  * If *func* was defined using *GeneratorExpression* or *GeneratorDeclaration*, the string representation must have the syntax of a *GeneratorExpression*.
  * If *func* was defined using *ArrowFunction*, the string representation must have the syntax of an *ArrowFunction*.
  * If *func* was defined using *GeneratorMethod*, the string representation must have the syntax of a *GeneratorExpression*. Else, if *func* was defined using *MethodDefinition*, the string representation must have the syntax of a *FunctionExpression*.
  * NOTE: I would like to add an assertion about preserving arity.

* Else, if *func* has an [[ECMAScriptCode]] internal slot, the string representation must have the syntax of a *FunctionExpression*. NOTE Functions created using the Function constructor are not defined using ECMAScript code, but do have an [[ECMAScriptCode]] internal slot.

* Else, the string representation must have the syntax of a *NativeFunction*.

> *NativeFunction* : **function** *BindingIdentifier*<sub>opt</sub> **(** *FormalParameters* **)** **{** **[** **native** **code** **]** **}**
