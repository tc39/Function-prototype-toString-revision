## Function.prototype.toString ( )

When the `toString` method is called with an object *func* as its *thisValue*, the following steps are taken:

0. If *func* is a Bound Function exotic object, then return an implementation-dependent string source code representation of *func*. The representation must conform to the rules below. It is implementation dependent whether the representation includes bound function information or information about the target function.
0. If Type(*func*) is Object and is either a built-in function object or has an [[ECMAScriptCode]] internal slot, then return an implementation-dependent string source code representation of *func*. The representation must conform to the rules below.
0. Throw a **TypeError** exception.

`toString` Representation Requirements:

* If *func*.[[Portable]] is **true**, then the string representation must be such that if the string is evaluated using a direct call to `eval` in a lexical context that is equivalent to the lexical context used to create *func*, an object will be created such that the object's [[Call]] internal method is indistinguishable from the [[Call]] internal method of *func*. Two [[Call]] internal methods are indistinguishable if, for all `thisArgument` values, `argumentList` values, and current execution context stacks `context`, each method returns the same value according to SameValue and has the same effects on `context` when invoked with `thisArgument` and `argumentList` in the execution context `context`. **NOTE**: same for [[Construct]] if the function has a [[Construct]]? **NOTE**: do the internal slots have to be the same?

* If *func* was defined using ECMAScript code,
  * If *func* was defined using *FunctionExpression* or *FunctionDeclaration*, the string representation must have the syntax of a *FunctionExpression*.
  * If *func* was defined using *ClassExpression* or *ClassDeclaration*, the string representation must have the syntax of a *ClassExpression*.
  * If *func* was defined using *GeneratorExpression* or *GeneratorDeclaration*, the string representation must have the syntax of a *GeneratorExpression*.
  * If *func* was defined using *ArrowFunction*, the string representation must have the syntax of an *ArrowFunction*.
  * If *func* was defined using *GeneratorMethod*, the string representation must have the syntax of a *GeneratorExpression*. Else, if *func* was defined using *MethodDefinition*, the string representation must have the syntax of a *FunctionExpression*.
  * NOTE: I would like to add an assertion about preserving arity.

* Else, if *func* has an [[ECMAScriptCode]] internal slot, the string representation must have the syntax of a *FunctionExpression*. NOTE Functions created using the Function constructor are not defined using ECMAScript code, but do have an [[ECMAScriptCode]] internal slot.

* Else, the string representation must have the syntax of a *NativeFunction*.

> *NativeFunction* : **function** *BindingIdentifier*<sub>opt</sub> **(** *FormalParameters* **)** **{** **[** **native** **code** **]** **}**

## Function.prototype.isPortable ( )

When the `isPortable` method is called with an object *func* as its **this** value, the following steps are taken:

0. If Type(*func*) is not Object, throw a **TypeError** exception.
0. If *func* does not have an [[Portable]] internal slot, throw a **TypeError** exception.
0. Return *func*.[[Portable]].

## Table 27: Internal Slots of ECMAScript Function Objects

| Internal Slot | Type    | Description                                                                                                                   |
|---------------|---------|-------------------------------------------------------------------------------------------------------------------------------|
| [[Portable]]  | Boolean | **true** if this function may be serialiased and deserialised in an equivalent lexical context, preserving [[Call]] behaviour, **false** otherwise |

## 9.2.4 FunctionInitialize ( *F*, *kind*, *ParameterList*, *Body*, *Scope* )

9. ...

10. If *Body* Contains *SuperCall*, let *portable* be **false**.
10. Else if *Body* Contains *SuperProperty*, let *portable* be **false**.
10. Else, let *portable* be **true**.
10. Set the [[Portable]] internal slot of *F* to *portable*.

11. ...

## Reflect.isPortableFunction ( *func* )

**NOTE**: is this even needed?
