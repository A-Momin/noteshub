<details><summary style="font-size:30px;color:White;text-align:center">Python Terminology</summary>

-   **PYTHONPATH**:
    -   PYTHONPATH is an environment variable in Python that tells the interpreter where to locate the module files imported into a program. It is a colon-separated list of directories that the Python interpreter searches for modules when executing your code.
    -   When you try to import a module, Python looks for the module in the directories listed in sys.path. The PYTHONPATH environment variable allows you to customize this search path.
-   **sys.path**: In your Python script, you can modify the sys.path list to include the directories containing your Python modules.

    ```python
    import sys
    sys.path.append('/path/to/your/module')
    # Now you can import your module
    import your_module
    ```

<details><summary style="font-size:25px;color:Orange;text-align:left">Scope and Namespace</summary>

-   [Scope and Execution Context](https://realpython.com/python-scope-legb-rule/)
-   [What Are Python Namespaces](https://code.tutsplus.com/tutorials/what-are-python-namespaces-and-why-are-they-needed--cms-28598)

```python
def check_namespace():
    # Define a variable in the local (function) namespace
    local_var = "I am in the local (function) namespace"

    # Use globals() to get a list of names in the global namespace
    global_namespace = list(globals().keys())

    # Use locals() to get a list of names in the global namespace
    local_namespace = list(locals().keys())

    # Use dir(__builtins__) to get a list of names in the built-in namespace
    built_in_namespace = dir(__builtins__)

    print(f"Local Namespace: \n\t{local_namespace}")
    print(f"Global Namespace: \n\t{global_namespace}")
    print(f"Built-in Namespace: \n\t{built_in_namespace}")

# Call the function to check namespaces
check_namespace()
```

##### What is Namespace in Python?

A namespace is a container that holds a set of names and their corresponding objects, such as variables, functions, classes, etc. Namespaces are used to organize and manage the names used in a Python program to avoid naming conflicts.

There are several namespaces, which are essentially mappings from names to objects. These namespaces help organize and manage the names used in a Python program. Here are the main namespaces in Python:

-   **Built-in Namespace**:

    -   Contains built-in functions, exceptions, and types like print(), TypeError, int, etc.
    -   Automatically available in all Python programs without needing to import anything.

-   **Global Namespace**:

    -   Contains names defined at the top level of a module or script.
    -   Variables, functions, classes, and other objects defined at the module level belong to the global namespace.
    -   Accessible from anywhere within the module or script.

-   **Local Namespace**:

    -   Created when a function is called and destroyed when the function exits.
    -   Contains names defined within the function.
    -   Variables, parameters, and other objects defined inside a function belong to the local namespace.
    -   Accessible only within the function where they are defined.

-   **Enclosing Namespace (or Nonlocal Namespace)**:

    -   Introduced by nested functions (functions defined inside other functions).
    -   Contains names from the enclosing function's local namespace that are referenced in the nested function.
    -   Allows nested functions to access variables from the enclosing scope.

-   **Class Namespace**:

    -   Contains attributes (variables and methods) defined within a class.
    -   Each class has its own namespace.
    -   Class-level variables and methods are defined in this namespace.

-   **Instance Namespace**:

    -   Created when an instance of a class is created.
    -   Contains attributes specific to each instance of the class.
    -   Instance variables are defined in this namespace and are unique to each instance.

-   **Module Namespace**:

    -   Contains names defined within a module.
    -   Similar to the global namespace but specific to individual modules.
    -   All names defined in a module become attributes of the module object.

These namespaces help Python manage the names used in a program, prevent naming conflicts, and provide scoping rules for variable access and resolution. Understanding namespaces is essential for writing clear, maintainable, and efficient Python code.

When you use a name in your Python code, the interpreter looks for that name in the local namespace first, then in the enclosing namespace (if applicable), followed by the global namespace, and finally in the built-in namespace. This order is known as the LEGB rule (Local, Enclosing, Global, Built-in).

##### What is Scope in Python?

A scope is a block of code where an object in Python remains relevant. Every object in Python rvesides in a scope. The concept of scope rules how variables and names are looked up in your code. It determines the visibility of a variable within the code. The scope of a name or variable depends on the place in your code where you create that variable.

In Python, scope refers to the region of a program where a particular variable is accessible and can be referenced. It defines the visibility and lifetime of a variable within a program. Python has four main types of scope:

-   `Local Scope` (Function Scope):

    -   Variables defined within a function have a local scope.
    -   Local variables can only be accessed within the function where they are defined.
    -   The lifetime of local variables is limited to the execution of the function. Once the function completes its execution, the local variables are destroyed.
    -   If a variable with the same name exists in both the local and global scope, the local variable takes precedence inside the function.

-   `Enclosing Scope` (Nested Function Scope):

    -   When functions are defined within other functions (nested functions), they create an enclosing scope.
    -   Variables in the enclosing scope are accessible to the nested function, but not to the outermost (global) scope.
    -   The enclosing scope allows inner functions to access variables from outer functions, but not vice versa.

-   `Global Scope`:

    -   Variables defined at the top level of a Python program or in a module have a global scope.
    -   Global variables can be accessed from any part of the code, including inside functions.
    -   The lifetime of global variables lasts throughout the entire program's execution.
    -   To modify a global variable from within a function, you need to use the global keyword to indicate that you are referring to the global variable and not creating a new local variable.

-   `Built-in Scope`:
    -   The built-in scope contains all the names of Python's built-in functions, such as print(), len(), etc.
    -   These built-in names are available globally in any part of the code without the need to import anything.

Note: Local scope objects can be synced with global scope objects using keywords such as `global`.

-   Names and Scopes in Python

    -   Since Python is a dynamically-typed language, variables in Python come into existence when you first assign them a value. On the other hand, functions and classes are available after you define them using `def` or `class`, respectively. Finally, modules exist after you import them. As a summary, you can create Python names through one of the following operations:

    -   Assignments, Import operations, Function definitions, Argument definitions in the context of functions, Class definitions.

-   Python Scope vs Namespace

    -   In Python, the concept of scope is closely related to the concept of the namespace. As you’ve learned so far, a Python scope determines where in your program a name is visible. Python scopes are implemented as dictionaries that map names to objects. These dictionaries are commonly called namespaces. These are the concrete mechanisms that Python uses to store names. They’re stored in a special attribute called `.__dict__`.

    -   Names at the top level of a module are stored in the module’s namespace. In other words, they’re stored in the module’s `.__dict__` attribute.

```python
for a in range(2):
    x = 'global {}'.format(a)


def outer():
    global global_var
    global_var = 'Global variable is accessable everywhere'

    for b in range(6):
        x = randint(0, 10)
        x = 'x = {}, this value is from {}'.format(x, 'outer(...)')
        y1 = 'from the first for loop'

    def inner():
        x = 4
        x = 'x = 4, this value is from {}'.format('inner(...)')
        y2 = 'form the second for loop'

        print(x, y1, y2, global_var, sep='\n')
    print(x)
    inner()

outer()
```

#### Name Mangling in Python

Name mangling in Python is a mechanism for making class attributes more "private" and for avoiding name clashes when subclassing. It involves adding a prefix to an attribute's name to make it harder to access or accidentally override from outside the class. It's a way to provide some level of "name privacy" within a class, although it's not a security feature and can still be bypassed if necessary. Here are the gory details of Python name mangling:

-   `Double Underscore Prefix (__)`: Name mangling begins when an attribute name in a class is prefixed with a double underscore (e.g., \_\_attribute_name). This is a convention, and it signals to developers that this attribute is intended to be "private" to the class.

-   `Name Transformation`: When Python encounters an attribute with a double underscore prefix, it transforms the attribute's name. Specifically, it adds a prefix to the attribute name, consisting of an underscore and the name of the class where the attribute is defined. For example, if you have a class called MyClass with a double underscore attribute **\_\_private_var_2**, Python internally renames it to **\_MyClass\_\_private_var_2**.

    ```python
    class MyClass:
        def __init__(self):
            self._private_var_1 = 42
            self.__private_var_2 = 420
    ```

-   `Accessing Mangled Attributes`: To access a name-mangled attribute from outside the class, you need to use the mangled name, which includes the class name as a prefix:

    ```python
    obj = MyClass()
    print(obj._MyClass__private_var_2)  # Accesses the name-mangled attribute.
    ```

    -   This helps avoid naming conflicts between attributes in different classes and subclasses.

-   `Name Mangling Is Not Strict Encapsulation`: It's important to note that name mangling is a convention rather than a strict security feature. It does make it less likely for developers to accidentally override or access "private" attributes, but it can still be bypassed. If you know the mangled name, you can access or modify the attribute:

    ```python
    obj._MyClass__private_var_2 = 100 # Modifies the mangled attribute.
    ```

-   `Use Cases`: Name mangling is often used to indicate to other developers that an attribute is intended to be private and should not be accessed directly from outside the class. It is also used to prevent accidental name clashes when subclassing. It's especially useful when creating library code, where you want to provide a level of encapsulation without preventing users of your library from accessing or modifying attributes when necessary.

In summary, name mangling in Python involves transforming attribute names with double underscores into names that include the class name as a prefix to avoid naming conflicts. However, it's a convention rather than a strict enforcement of privacy, and developers can still access mangled attributes if they know the mangled names.

</details>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">Arguments <b style="color:red"> * args </b> and <b style="color:red"> ** kwargs </b></summary>

In Python, unpacking operators allow you to expand elements from iterable objects, such as lists, tuples, or dictionaries, into individual elements or variables. There are three main unpacking operators: `*` for iterable unpacking, `**` for dictionary unpacking, and `*` in function arguments.

-   **Iterable Unpacking** (`*`):

    -   Used to unpack elements from an iterable (e.g., list or tuple).
    -   The `*` operator is placed before an iterable variable to unpack its elements.

    ```python
    # Example of iterable unpacking
    original_list = [1, 2, 3]
    unpacked_list = [*original_list, 4, 5]
    print(unpacked_list)  # Output: [1, 2, 3, 4, 5]

    # Unpacking a list into variables
    first, *rest = [1, 2, 3, 4, 5]
    print(first)  # Output: 1
    print(rest)   # Output: [2, 3, 4, 5]
    ```

-   **Dictionary Unpacking** (`**`):

    -   Used to unpack key-value pairs from a dictionary.
    -   The `**` operator is placed before a dictionary variable to unpack its key-value pairs.

    ```python
    # Example of dictionary unpacking
    original_dict = {'a': 1, 'b': 2}
    unpacked_dict = {**original_dict, 'c': 3}
    print(unpacked_dict)  # Output: {'a': 1, 'b': 2, 'c': 3}

    # Unpacking elements for a function call
    values = [1, 2, 3, 4, 5]
    print(*values)  # Output: 1 2 3 4 5

    # Unpacking a dictionary's keys and values into a function
    person = {'name': 'John', 'age': 30, 'city': 'New York'}
    print(**person)  # Output: name=John age=30 city=New York
    ```

-   **Function Arguments** (`*`):

    -   Used in function definitions and calls to handle variable numbers of arguments.
    -   The `*` operator in a function definition collects positional arguments into a tuple.
    -   The `*` operator in a function call unpacks elements from an iterable into positional arguments.

    ```python
    # Example of function arguments unpacking
    def example_function(*args):
        print(args)

    elements_to_unpack = [1, 2, 3]
    example_function(*elements_to_unpack)  # Output: (1, 2, 3)
    ```

    -   In this example, *args in the function definition collects the positional arguments into a tuple, and *elements_to_unpack in the function call unpacks the elements from the list into positional arguments.

Unpacking operators provide a concise and flexible way to work with iterable objects and function arguments in Python.

#### Variable-Length Arguments and Key-word Arguments

##### What does `*args` and `**kwargs` mean?

-   **\*args**:

    -   `*args` is a special syntax used in the function definition to pass variable-length arguments.
    -   `*` means variable length and `args` is the name used by convention. You can use any other.

-   **\*\*kwargs**:

    -   `**kwargs` is a special syntax used in the function definition to pass variable-length keyworded arguments.
    -   Here, also, `kwargs` is used just by convention. You can use any other name.
    -   Keyworded argument means a variable that has a name when passed to a function.
    -   It is actually a dictionary of the variable names and its value.

    ```python
    def test_args(first_arg, *args, **kwargs):
        kwargs = {"_int": 100, **kwargs}
        args = (*args,50)
        print(args[-1])

        if kwargs.get('_int'): kwargs['_int'] = kwargs['_int'] + 10
        if kwargs.get('my_int2'): kwargs['my_int'] = kwargs['my_int'] + 20

        print(first_arg, args, kwargs, sep='\n')


    test_args('test_arg1', 'first_arg', [2]*3, 'test_arg2', _str="kwarg#2", _int=30)
    ```

</details>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">Decorator</summary>

A decorator is a design pattern that allows you to extend or modify the behavior of a callable object (functions, methods, or classes) without modifying its source code. Decorators are applied using the `@decorator` syntax, where decorator is a function or a class that takes a function as an argument and returns a new function.

Decorators are commonly used for various purposes, such as logging, authorization, caching, and code instrumentation. They provide a clean and reusable way to extend the functionality of functions or methods. Additionally, Python has some built-in decorators (e.g., `@staticmethod`, `@classmethod`, `@property`) and third-party libraries offer many more for different use cases.

</details>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">Iterator</summary>

##### What are **Iterators** in Python?

An iterator is an object that provide the mechanics to iterate over a stream of data. Iterators are used to traverse through a sequence of elements, one at a time, and they implement two main methods:

**\_\_iter\_\_**: This method returns the iterator object itself. It is required for an object to be considered an iterator.

**\_\_next\_\_**: This method returns the next element from the iterator. When there are no more elements, it should raise the **StopIteration** exception to signal the end of the iteration.

To create an iterator in Python, you can define a class with the **\_\_iter\_\_** and **\_\_next\_\_** methods. Alternatively, you can use the **iter()** and **next()** functions to create and interact with iterators.

**Notes**:

-   It remembers its state i.e., where it is during iteration (see code below to see how)
-   It is also self-iterable.
-   Iterators are objects with which we can iterate over iterable objects like lists, strings, etc.

</details>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">Generator</summary>

Generators are iterable Python object, like lists or tuples, but they generate values on-the-fly instead of storing them in memory. They are implemented using functions that contain one or more `yield` statements. When a generator function is called, it doesn't get executed immediately. Instead, it returns a generator object, which can be iterated over using a for loop or by using the `next()` function. The key characteristics of generators are:

-   `Lazy Evaluation`: Generators get lazyly evaluated, meaning they produce values only when requested. Each time a value is requested from the generator, the function execution resumes from where it left off, continuing until it hits the next `yield` statement.

-   `Memory Efficiency`: Since generators do not store all the values in memory at once, they are memory-efficient, especially when dealing with large datasets or infinite sequences.

-   `Iteration`: Generators are iterable, and you can loop over them using a for loop. They produce values one at a time during iteration.

-   `Stateless`: Generators are stateless; they do not retain any information between iterations. Each time you iterate over a generator, it starts execution from the beginning of the iteration.

-   `Infinite Sequences`: Generators can be used to create infinite sequences or streams of data, where the values are generated on-the-fly as needed.

```python
def fib(n):
    """ Return all the fibonacci numbers less than or equal to n (a given number)"""
    p, q = 0, 1
    while (p <= n):
        yield p
        p, q = q, p + q
```

##### What is **Generator expression** in Python?

A **generator expression** is a concise and memory-efficient way to create a generator on-the-fly. It has a similar syntax to a list comprehension, but it returns a generator object instead of a list. Generator expressions are denoted by parentheses `()` instead of square brackets `[]`, which are used for list comprehensions.
a generator expression is a concise way to create a generator on-the-fly, similar to how list comprehensions create lists. Generator expressions are more memory efficient than list comprehensions because they produce values lazily, only when needed, instead of storing the entire sequence in memory.

```python
# Create a generator expression to generate squares of numbers from 1 to 5
squares_generator = (x ** 2 for x in range(1, 6))

# Print the generator object
print(squares_generator)  # Output: <generator object <genexpr> at 0x7f0fe5c2e7b0>

# Iterate over the generator and print each value
for square in squares_generator:
    print(square)
```

</details>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">Context Manager</summary>

A context manager in Python is an object that defines the methods `__enter__()` and `__exit__()`. It is designed to be used with the **with** statement to set up and tear down resources, such as opening and closing a file, acquiring and releasing a lock, or connecting and disconnecting from a database. Context managers ensure that certain actions are taken before and after a block of code is executed.

The **with** statement provides a convenient and readable way to work with resources, and it guarantees that the resources are properly acquired and released even if an exception occurs within the block.

```python
with open('file.txt', 'r') as file:
    content = file.read()
    # Perform operations with the file

# After the block, the file is automatically closed
```

In this example, the `open()` function returns a context manager object that represents the opened file. When the with-statement is executed, it calls the `__enter__()` method of the context manager, which initializes the file and returns it. Then, the block of code inside the with-statement is executed. Finally, when the block is exited, the `__exit__()` method is called, which ensures that the file is closed properly, even if an exception occurred within the block.

The `contextlib` module provides a decorator `contextmanager` that simplifies the creation of context managers. It allows you to define a generator function with a single **yield** statement, where everything before the **yield** serves as the `__enter__` method, and everything after the **yield** serves as the `__exit__` method.

```python
from contextlib import contextmanager

@contextmanager
def open_db(file_name: str):
    conn = sqlite3.connect(file_name)
    try:
        logging.info("Creating connection")
        yield conn.cursor()
    finally:
        logging.info("Closing connection")
        conn.commit()
        conn.close()

# ====================================================
def main_decorator_version():
    logging.basicConfig(level=logging.INFO)
    with open_db(file_name=path+"/application.db") as cursor:
        cursor.execute("SELECT * FROM blogs")
        logging.info(cursor.fetchall())
# =====================================================
main_decorator_version()
```

#### Asynchronous Context Manager

An Asynchronous Context Manager in Python is an object that supports asynchronous context management protocol. It allows you to define asynchronous resource management logic using the `async with` statement within asynchronous code (coroutines). Asynchronous context managers are used to acquire and release resources in an asynchronous manner, typically in scenarios where resource acquisition or release involves I/O-bound operations.

-   An asynchronous context manager is an object that implements `__aenter__()` and `__aexit__()` methods, similar to regular context managers (`__enter__()` and `__exit__()` methods).
-   When the `async with` statement is encountered, it calls the `__aenter__()` method of the asynchronous context manager object to acquire the resource asynchronously.
-   The result of `__aenter__()` (if any) is assigned to the <variable> specified in the `async with` statement.
-   The <statements> within the `async with` block are executed asynchronously.
-   After the <statements> are executed or if an exception occurs within the block, the `__aexit__()` method of the asynchronous context manager is called to release the acquired resource asynchronously.

```python
import asyncio

class AsyncResource:
    async def __aenter__(self):
        print("Acquiring resource asynchronously")
        await asyncio.sleep(1)  # Simulating asynchronous resource acquisition
        return "Resource"

    async def __aexit__(self, exc_type, exc_value, traceback):
        print("Releasing resource asynchronously")
        await asyncio.sleep(1)  # Simulating asynchronous resource release

async def main():
    async with AsyncResource() as resource:
        print("Using resource:", resource)
        # Perform asynchronous operations with resource

asyncio.run(main())
```

Asynchronous context managers is particularly useful in asynchronous programming when working with resources that need to be acquired and released in an asynchronous manner, such as database connections, network sockets, or file I/O operations. It helps manage resources efficiently while ensuring proper cleanup even in the presence of exceptions.

</details>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">Metaclass</summary>

Metaclasses in Python are a powerful feature that allows you to customize the creation of classes and modify their attributes, methods, and behavior dynamically.

-   **Class of Classes**:
    -   A metaclass is a class whose instances are themselves classes.
    -   It defines how classes behave, just like classes define how instances of those classes behave.
-   **Customizing Class Creation**:
    -   Metaclasses allow you to customize the creation of classes in Python.
    -   By defining a metaclass, you can control aspects of class creation such as initialization, attribute handling, and method generation.
-   **Advanced Features**:
    -   Metaclasses are often used for advanced Python features like singleton patterns, method interception, and class validation.
    -   They provide a powerful mechanism for modifying and extending the behavior of classes in Python.
-   **Use Cases**: Metaclasses are often used for advanced customization and introspection tasks, such as:

    -   Implementing class-level validation or enforcement of constraints.
    -   Automatically generating methods or attributes based on class definitions.
    -   Adding additional behavior or functionality to classes at creation time.
    -   Implementing declarative programming patterns (e.g., defining database models).

-   **Example**: Enforcing Attribute Presence

    ```python
    class AttributeEnforcer(type):
        def __new__(cls, name, bases, dct):
            print("Creating class:", name)
            dct['created_by'] = 'AttributeEnforcer'
            if 'required_attribute' not in dct:
                raise TypeError(f"{name} is missing the required 'required_attribute' attribute")
            return super().__new__(cls, name, bases, dct)

    # Use the metaclass to create a new class
    class MyClassEnforced(metaclass=AttributeEnforcer):
        required_attribute = "This is required"

    # This will raise an error
    class MyInvalidClass(metaclass=AttributeEnforcer):
        pass  # Missing 'required_attribute'
    ```

-   **Dynamic Class Creation**:

    ```python
    # Step 1: Define the class name, base classes, and attributes/methods
    class_name = "Person"
    base_classes = (object,)  # Using `object` as the base class

    # Define the class attributes and methods, including __init__
    class_attributes = {
        '__init__': lambda self, name, age: setattr(self, 'name', name) or setattr(self, 'age', age),
        'greet': lambda self: f'Hello, my name is {self.name} and I am {self.age} years old.'
    }

    # Step 2: Create the class dynamically using `type()`
    Person = type(class_name, base_classes, class_attributes)

    # Step 3: Instantiate the class and access attributes/methods
    person1 = Person("Alice", 30)
    person2 = Person("Bob", 40)

    print(person1.name)       # Output: Alice
    print(person2.age)        # Output: 40
    print(person1.greet())    # Output: Hello, my name is Alice and I am 30 years old.
    ```

</details>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">Module and Function</summary>

#### Built-in attributes of Python Module.

In Python, modules are a way to organize code into reusable files. While modules can have various attributes and functions, there are a few built-in attributes that are commonly associated with modules.

Here are some of the key built-in attributes of a Python module:

-   `__name__`: This attribute holds the name of the module. If the module is the main program being executed, `__name__` is set to `__main__`. Otherwise, it is set to the module's name.
-   `__file__`: This attribute holds the path to the source file of the module, if available. It is None for built-in modules and modules that are dynamically generated.
-   `__dict__`: This attribute holds the dictionary that defines the module's namespace. It maps attribute names to their corresponding values.
-   `__builtins__`: This attribute holds a reference to the built-in namespace, which contains all the built-in functions, objects, and exceptions.
-   `__doc__`: This attribute holds the module's documentation (docstring), which is a string containing information about the module's purpose, usage, and more.
-   `__package__`: This attribute holds the name of the package that the module belongs to. It is None for top-level modules.
-   `__loader__`: This attribute holds a reference to the module's loader, which is responsible for loading the module. It is used for modules loaded using the importlib machinery.
-   `__spec__`: This attribute holds a reference to the module's specification, which is an object that encapsulates information about how the module is to be imported. It is used for modules loaded using the importlib machinery.
-   `__cached__`: This attribute holds the path to the compiled bytecode file of the module, if available. It is used to speed up subsequent imports by avoiding recompilation.
-   `__package__`: This attribute holds the name of the package that the module belongs to. It is set to None if the module is not part of a package.
-   `__cached__`: This attribute holds the path to the cached bytecode file associated with the module, if available.
-   `__path__`: This attribute is a list containing the paths to subdirectories within a package. It is set for packages, not individual modules.

These built-in attributes provide information about the module's metadata, source file, and other properties. You can access them like any other attribute of the module. Keep in mind that some of these attributes might not be present in all modules, especially in built-in modules or dynamically generated modules.

```python
def dir_help():
    L = []
    print(dir(object))
    print(dir(L))
    print(dir(dict))

# print(__package__)

# print(__builtins__)

# print(__file__)

# print(__name__)

# print(__doc__)

# dir_help()
```

#### Built-in attributes of Python Functions.

In Python, functions are first-class objects, which means they have special built-in attributes that provide information about the function itself. These attributes are prefixed and suffixed with double underscores (`__`).

Here are some of the key special built-in attributes of a Python function:

-   `__name__`: This attribute holds the name of the function as a string.
-   `__annotations__`: This attribute holds a dictionary containing function annotations, which provide additional information about function parameters and return values.
-   `__dict__`: This attribute holds the function's attribute dictionary, mapping attribute names to their corresponding values.
-   `__globals__`: This attribute holds a reference to the dictionary representing the global namespace in which the function was defined.
-   `__call__`: This attribute defines the behavior of the function when it is called. It allows the function to be callable like any other object.
-   `__defaults__`: This attribute holds a tuple containing default argument values for the function's parameters. If a parameter has no default value, its corresponding entry in the tuple is set to None.
-   `__module__`: This attribute holds the name of the module in which the function was defined. If the function is defined in the main program, it is set to "**main**".
-   `__doc__`: This attribute holds the function's documentation string (docstring), which provides information about the function's purpose, usage, and more.
-   `__code__`: This attribute holds the code object that represents the compiled function's bytecode.
-   `__closure__`: This attribute holds a tuple of cell objects representing the closed-over variables used by nested functions. It is None for functions that don't close over any variables.
-   `__kwdefaults__`: This attribute holds a dictionary containing keyword-only default values for function parameters.
-   `__qualname__`: This attribute holds the qualified name of the function, including the full module path.

These special attributes provide introspection capabilities, allowing you to inspect and interact with functions programmatically. They are useful for various purposes, such as creating decorators, documenting functions, and understanding their behavior and context.

</details>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">Memory Management and Garbage Collection</summary>

Memory management and garbage collection are essential aspects of Python's runtime environment, ensuring efficient utilization of system resources and automatic cleanup of unused objects.

**Memory Management**:

Python's memory management is based on a private heap space, managed by the Python memory manager. This heap space contains all the Python objects and data structures.

Python uses a technique called "dynamic memory allocation" to allocate memory for objects during runtime. When you create an object (e.g., variables, lists, dictionaries), Python dynamically allocates memory for it on the heap.

Python's memory manager keeps track of all allocated memory blocks, including the ones that are currently in use and those that have become unused.

Memory management in Python is automatic and transparent to the programmer. Python handles memory allocation and deallocation internally without explicit intervention from the developer.

Memory management in Python is primarily handled by the Python memory manager, which is responsible for allocating and deallocating memory for objects, as well as managing memory usage efficiently. Here's how memory management works in Python:

-   `Object Allocation`: When a new object is created in Python, the memory manager allocates memory to store the object's data and metadata. Each object's memory layout includes space for the object's type information, reference count, and actual data.
-   `Reference Counting`: Python uses reference counting as its primary mechanism for automatic memory management. Each object in memory has a reference count, which tracks the number of references pointing to it. Whenever an object is referenced by another object, its reference count is incremented. Conversely, when a reference to an object is removed or goes out of scope, its reference count is decremented. When an object's reference count drops to zero, meaning there are no more references to it, the memory manager deallocates the object's memory and frees it up for reuse.
-   `Garbage Collection`: While reference counting is effective for most cases, it cannot detect and reclaim cyclic garbage, where objects reference each other in a cycle. To handle cyclic garbage, Python employs a secondary garbage collection mechanism called cyclic garbage collection. This mechanism identifies and breaks cyclic references by traversing object graphs and marking objects as garbage if they are part of a cycle.
-   `Memory Pools`: Python's memory manager utilizes memory pools to improve memory allocation performance. Memory pools preallocate fixed-size blocks of memory for objects of a certain size range, reducing the overhead of allocating and deallocating memory for individual objects. Memory pools are managed by the memory manager and are shared among Python objects.
-   `Optimizations`: Python's memory manager includes various optimizations to improve memory usage and performance, such as reuse of freed memory blocks, memory compaction to reduce fragmentation, and caching of frequently used objects.

#### Heap Space in Python

In Python, the "heap" generally refers to the private heap space managed by the Python memory manager. This is where Python objects are allocated and managed during program execution. Understanding the Python heap is crucial for understanding memory management in Python. Here's a detailed explanation:

-   `Dynamic Memory Allocation`: In Python, memory allocation is dynamic, meaning that memory for objects is allocated as needed during program execution. When you create a new object, such as a variable, list, or class instance, Python allocates memory for that object on the heap.
-   `Reference Counting`: Python uses a technique called reference counting to manage memory. Each object on the heap has a reference count, which tracks how many references (pointers) exist to that object. When an object's reference count drops to zero, meaning there are no more references to it, the memory occupied by the object is reclaimed.
-   `Garbage Collection`: In addition to reference counting, Python also employs a garbage collector to reclaim memory for objects with cyclic references or when reference counting alone is insufficient. The garbage collector periodically scans the heap to identify and reclaim unreachable objects, freeing up memory for reuse.
-   `Memory Fragmentation`: As objects are allocated and deallocated on the heap, memory fragmentation can occur. This is when the heap becomes fragmented with small chunks of memory scattered throughout, making it challenging to allocate contiguous blocks of memory for new objects. Python's memory manager includes mechanisms to address fragmentation and optimize memory allocation.
-   `Global vs. Per-Thread Heap`: Python's memory manager maintains separate heaps for global objects and per-thread objects. Global objects are accessible from any thread in the program and are stored in the global heap. Per-thread objects, such as thread-local variables, are stored in per-thread heaps, which are managed separately.
-   `Memory Profiling and Optimization`: Understanding how memory is allocated and managed on the heap is essential for optimizing memory usage and performance in Python programs. Techniques such as memory profiling, identifying memory leaks, minimizing object creation, and optimizing data structures can help improve memory efficiency and performance.
-   `C Extensions and Memory Management`: When working with C extensions or interacting with external libraries, it's important to be mindful of memory management. Python's memory management system may interact with memory management mechanisms in C code, and improper memory management can lead to memory leaks or undefined behavior.

**Garbage Collection**:

Garbage collection is the process of reclaiming memory occupied by objects that are no longer in use, freeing it up for future allocation.

Python uses a built-in garbage collector to perform automatic memory management. The garbage collector identifies and collects unused objects, which are then deallocated from memory.

Python's garbage collector uses a reference counting mechanism to track the number of references to each object. When the reference count of an object drops to zero, it means that the object is no longer in use and can be safely deallocated.

In addition to reference counting, Python's garbage collector also employs a cycle-detecting algorithm to handle more complex scenarios where objects reference each other in circular patterns (e.g., cyclic references).

The garbage collector runs periodically in the background, scanning the heap for unreachable objects and reclaiming their memory. The frequency and behavior of garbage collection can be influenced by various factors, such as the size of the heap, memory pressure, and the number of objects being created and destroyed.

Garbage collection is an automated memory management mechanism in Python. It automatically identifies and reclaims memory occupied by objects that are no longer referenced by your program, preventing memory leaks and ensuring efficient memory utilization.

-   **How Garbage Collection Works in Python**: CPython, the most popular Python implementation, primarily relies on a technique called reference counting for garbage collection. Here's a breakdown of the process:

    -   `Object Creation and Reference Counting`:

        -   Whenever you create an object in Python (e.g., a list, string, or custom class instance), the underlying C object has both a Python type (like list) and a reference count initialized to 1.
        -   This reference count indicates how many different places in your program's code are currently referencing that object.

    -   `Reference Increments and Decrements`:

        -   When you assign an object to a variable or pass it as an argument to a function, the reference count is incremented by 1, signifying another reference to the object exists.
        -   Conversely, when a variable referencing an object goes out of scope (e.g., the function containing the variable finishes execution), or you explicitly delete a reference (using del), the reference count is decremented by 1.

    -   `Garbage Collection Cycle`:

        -   The Python interpreter periodically runs a garbage collection cycle in the background. During this cycle, it identifies objects with a reference count of 0. These objects are considered unreachable as there are no active references to them in your program.

    -   `Memory Reclamation`:

        -   Once an object is identified as unreachable, the garbage collector reclaims the memory occupied by that object, making it available for future object allocations.

-   **Limitations of Reference Counting**:

    -   `Cyclic References`: Reference counting can't handle cyclic references, where two or more objects reference each other indefinitely. Even though no code directly references these objects anymore, their reference counts remain above 0, preventing garbage collection.
    -   `Hidden References`: In some cases, objects might be indirectly referenced through hidden mechanisms like closures or event listeners, leading to unreachable objects not being collected.

-   **Additional Considerations**:

    -   Python's garbage collector is not deterministic. The exact timing of garbage collection cycles can vary depending on memory usage and other factors.
    -   While reference counting is the primary mechanism, CPython might also employ other techniques like generational garbage collection for better efficiency, especially for long-running applications.

#### Core API functions to work upon the garbage collection in Python?

Python provides several core API functions and modules for working with garbage collection, allowing you to control and manage the process of reclaiming memory occupied by objects that are no longer referenced. Here are some of the core API functions and modules related to garbage collection in Python:

-   **gc Module**: The gc module provides a high-level interface to Python's garbage collection mechanism. It includes functions for manual garbage collection control, as well as utilities for inspecting the garbage collector's behavior and statistics.
    -   `gc.collect([generation])`: Manually triggers garbage collection. By default, it collects all generations, but you can specify a generation to collect (0 for the youngest generation, 2 for the oldest).
    -   `gc.get_count()`: Returns a tuple containing the current collection counts for each generation. These counts represent the number of objects that have been allocated since the last collection.
    -   `gc.get_stats()`: Returns a list of dictionaries containing information about the garbage collector's behavior and statistics, including the number of collections, memory usage, and more.
    -   `gc.set_debug(flags)`: Enables or disables debugging output from the garbage collector. The flags argument is a bitmask representing the debugging options to enable.
    -   `gc.get_objects()`: Returns a list of all objects tracked by the garbage collector. This can be useful for debugging and profiling purposes, but it's not recommended for general use due to potential performance overhead.
    -   `gc.get_referents(obj)`: Returns a list of objects that directly reference the given object obj. This function can be used to inspect the references to a specific object in the heap.
    -   `gc.get_referrers(obj)`: Returns a list of objects that directly reference the given object obj. This function can be used to inspect the objects that reference a specific object in the heap.
-   **sys** Module: The `sys` module provides access to system-specific parameters and functions, including functions related to memory management. For example, `sys.getsizeof()` can be used to determine the size of an object in memory, and `sys.getrefcount()` can be used to get the reference count of an object.
-   **resource** Module: On Unix-based systems, the `resource` module provides functions for querying and modifying system resource limits, including memory limits. Functions like `resource.getrusage()` can be used to get information about resource usage, including memory usage.
-   **tracemalloc** Module: The `tracemalloc` module allows tracing memory allocations and retrieving information about memory blocks allocated by Python. Functions like `tracemalloc.start()` and `tracemalloc.stop()` can be used to start and stop tracing, and `tracemalloc.get_traced_memory()` can be used to retrieve information about traced memory allocations.

In summary, garbage collection in Python is an essential feature that helps manage memory automatically. Understanding how it works can be beneficial for writing memory-efficient Python code and avoiding potential memory-related issues. However, it's generally not necessary to directly interfere with the garbage collector. Focus on writing clean code and avoiding unnecessary object references for optimal performance.

**Memory Optimization Techniques**:

-   While Python's automatic memory management and garbage collection are convenient, they may not always be optimal for certain use cases.
-   Developers can optimize memory usage in Python by:
    -   Minimizing the creation of unnecessary objects, especially in performance-critical code.
    -   Reusing objects whenever possible to reduce memory churn.
    -   Using data structures and algorithms that are memory-efficient.
    -   Explicitly deleting references to objects when they are no longer needed, although this is generally unnecessary due to Python's garbage collection mechanism.

Overall, Python's memory management and garbage collection mechanisms provide a balance between convenience and performance, allowing developers to focus on writing high-level code without worrying too much about memory management details. However, understanding how memory management works under the hood can help developers write more efficient and optimized Python code.

</details>

</details>

---

<details><summary style="font-size:30px;color:White;text-align:center">Concurrency vs Parallelism</summary>

-   [AsyncIO, await, and async - Concurrency in Python](https://www.youtube.com/watch?v=K56nNuBEd0c)
-   [mCoding: Unlocking your CPU cores in Python (multiprocessing)](https://www.youtube.com/watch?v=X7vBbelRXn0&t=572s)
-   [mCoding: Intro to async Python | Writing a Web Crawler](https://www.youtube.com/watch?v=ftmdDlwMwwQ&t=33s)
-   [ArjanCodes: How To Easily Do Asynchronous Programming With Asyncio In Python](https://www.youtube.com/watch?v=2IW-ZEui4h4&t=69s)
-   [ArjanCodes: Next-Level Concurrent Programming In Python With Asyncio](https://www.youtube.com/watch?v=GpqAQxH1Afc)

#### Global Interpreter Lock (GIL)

The Global Interpreter Lock (GIL) is a mechanism widely used in CPython that ensures only one thread executes Python bytecode at a time in a single process, even on multi-core processors. It is a mutex (mutual exclusion) that protects access to Python objects, preventing multiple threads from executing Python bytecode concurrently. This means that, by default, Python cannot fully utilize the processing power of multi-core CPUs for CPU-bound tasks.

Python's standard implementation (CPython) employs a mechanism called the Global Interpreter Lock (GIL). The GIL essentially acts as a mutex (mutual exclusion) that only allows one thread to execute Python bytecode at a time. While this ensures thread safety for built-in data structures and prevents memory corruption, it also limits true parallel execution on multi-core processors for CPU-bound tasks.

It is important to note that the GIL is specific to CPython, and other implementations of Python (such as Jython, IronPython, or PyPy) may not have a GIL or may have different mechanisms for handling concurrent execution.

In simple terms, the GIL ensures that Python's memory management is thread-safe, preventing conflicts that can arise when multiple threads modify data structures. But it also limits Python's ability to perform true parallel processing. While this can be a limitation for CPU-bound tasks, Python remains an excellent choice for I/O-bound tasks, thanks to its asynchronous programming capabilities and third-party libraries that help bypass the GIL when necessary.

-   `Purpose`:

    -   The primary purpose of the `GIL` is to serialize access to Python objects, preventing multiple native threads from executing Python bytecodes in parallel.
    -   It ensures that only one thread can execute Python code in the interpreter at any given time.

-   `Why the `GIL` Exists`:

    -   CPython, the reference implementation of Python, uses reference counting to manage memory. The `GIL` simplifies memory management by eliminating the need for complex and expensive locking mechanisms to protect against memory management issues.
    -   The `GIL` also ensures thread safety for Python's built-in data structures, making it easier to write and maintain Python's standard library.

-   `Impact on Multithreaded Programs`:

    -   Due to the `GIL`, multithreaded Python programs may not achieve true parallelism, especially for CPU-bound tasks. This means that multiple threads running Python code cannot utilize multiple CPU cores simultaneously.
    -   For I/O-bound tasks (e.g., network operations, file I/O), the `GIL` is less of a concern because Python threads can release the `GIL` while waiting for I/O operations to complete. This allows multiple threads to make progress concurrently in such cases.

#### What is bytecode in python?

Bytecode in Python is an intermediate representation of Python code that is generated by the Python interpreter when you run a Python script or module. It's not the low-level machine code that your computer's CPU executes directly, but rather a platform-independent set of instructions that the Python interpreter can execute.

#### I/O-bound vs CPU-bound Operations

-   **I/O-bound Operations**: The term "bound" implies that the operation's progress or performance is restricted or limited by a particular factor. In the case of I/O bound operations, that limiting factor is the speed at which data can be transferred between the computer's memory (or CPU) and external devices such as disks, networks, or user input/output devices.

    -   `Bottleneck`: The bottleneck of I/O bound operations is typically the speed at which data can be transferred between the computer's memory or processor and external devices. Several factors contribute to this bottleneck:

        -   `Hardware Limitations`: The hardware components involved in I/O operations, such as disk drives, network interfaces, and input/output devices, have finite capacities and speeds. For example, traditional hard disk drives (HDDs) have slower read/write speeds compared to solid-state drives (SSDs), and network bandwidth can limit the rate of data transfer over a network connection.
        -   `Data Transfer Protocols`: The protocols used for transferring data, such as SATA for disk drives or TCP/IP for network communication, introduce overhead and latency that can slow down data transfer rates. These protocols define how data is formatted, transmitted, and received, and inefficient implementations or network congestion can exacerbate the bottleneck.
        -   `Operating System Overhead`: The operating system manages I/O operations and mediates access to hardware resources. However, this management introduces overhead in the form of context switches, scheduling, and device driver interactions, which can affect the overall speed of I/O operations.

    -   `Characteristics`:
        -   These operations spend a significant amount of time waiting for I/O operations to complete.
        -   Examples include reading from or writing to disk, network communication, user input/output, database operations, and file operations.
        -   The CPU often idles or performs minimal computation while waiting for I/O operations to finish.

-   **CPU-bound Operations**: CPU-bound operations are tasks where the performance is primarily constrained by the computational power of the central processing unit (CPU). In these operations, the CPU is heavily utilized to perform complex calculations, execute algorithms, or process large amounts of data. Here's a detailed breakdown:

    -   `Bottleneck`: The bottleneck in CPU-bound operations is the processing capacity of the CPU itself. As the CPU reaches its computational limits, the performance of the operation becomes constrained, and additional computational tasks may experience delays or slowdowns.
    -   `Characteristics`:
        -   These operations spend the majority of their time executing instructions on the CPU.
        -   Examples include mathematical computations, sorting algorithms, cryptographic operations, image/video processing, scientific simulations, and rendering tasks.
        -   The CPU is fully utilized during these operations, and other system resources such as memory or I/O may not be fully utilized.

#### Multitasking

Multitasking is the ability to execute multiple tasks or processes at the same time, improving efficiency and performance by utilizing threading, multiprocessing, or asynchronous programming techniques. This can be achieved in several ways:

-   `Preemptive Multitasking`: The operating system divides CPU time into small time slices and allocates these slices to different processes. If a process exceeds its time slice, it's preempted (paused) to allow another process to run. The CPU scheduler ensures fair access to the CPU.

-   `Cooperative Multitasking`: In this model, processes voluntarily yield control of the CPU. Each process must explicitly release control to allow other processes to run. This approach requires more cooperation among processes and can be less robust.

-   `Multithreading`: Multithreading is a form of multitasking where a single program is divided into multiple threads. Threads share the same memory space, which can lead to more efficient communication and data sharing. They are suitable for tasks like handling multiple connections or parallelizing computation within a program.

-   `Time-Sharing`: Time-sharing systems were among the first to introduce true multitasking. They divided CPU time into small slices, allowing multiple users to interact with a computer concurrently via terminals. Each user's commands were processed during their allocated time slice.

#### Concurrency vs Parallelism

Concurrency and parallelism are two related but distinct concepts in Python, as well as in many other programming languages. They both deal with executing multiple tasks simultaneously, but they achieve this in different ways and serve different purposes. While both concurrency and parallelism involve the execution of multiple tasks simultaneously, concurrency is more about structuring your code to efficiently manage tasks, especially those that may block, while parallelism is about actually executing tasks in parallel to improve performance by utilizing multiple CPU cores or processors. The choice between concurrency and parallelism depends on the nature of the tasks you need to perform and the performance goals of your application.

-   **Concurrency**: Concurrency is a design principle that allows you to structure your code in a way that it can handle multiple tasks or operations simultaneously without necessarily running them in parallel. It's more about managing and organizing tasks efficiently, especially when dealing with tasks that may block, such as I/O operations (e.g., reading from files, making network requests). In Python, you can achieve concurrency using various techniques and libraries, including:

    -   `Threading`: Python's threading module allows you to create and manage threads. Threads can run concurrently within the same process. However, due to Python's Global Interpreter Lock (GIL), true parallelism is often limited, and threads may not take full advantage of multiple CPU cores.

    -   `Asyncio`: Python's asyncio library provides support for asynchronous programming using coroutines. It allows you to write non-blocking code that can efficiently manage and switch between multiple tasks, such as handling multiple I/O-bound operations concurrently.

-   **Parallelism**: Parallelism, on the other hand, is the actual simultaneous execution of multiple tasks on multiple CPU cores or processors, with the goal of improving performance and reducing execution time. It's often used for tasks that can be divided into smaller, independent subtasks that can run in parallel. In Python, you can achieve parallelism using:

    -   `Multiprocessing`: The multiprocessing module enables you to create multiple processes, each with its own Python interpreter and memory space. This allows for true parallelism, as each process can run on a separate CPU core.

    -   `Third-Party Libraries`: Python has several third-party libraries, such as `concurrent.futures`, that provide high-level interfaces for concurrent and parallel programming, making it easier to write code that can take advantage of multiple cores.

<details><summary style="font-size:25px;color:Orange">Threading (Thread-Based Concurrency)</summary>

Threads are lightweight units of execution within a process that share the same memory space.

Threading refers to the capability of a Python script to run multiple threads concurrently within a single process. Each thread represents a separate flow of execution within the same program, allowing for concurrent execution of tasks. Threading is a technique used to improve the performance of applications by managing blocking operations more efficiently.

In Python, threading is implemented through the `threading` and `concurrent.futures` module, which provides a high-level interface for creating and managing threads.

-   `Use Cases`:

    -   Well-suited for I/O-bound tasks (e.g., file I/O, network requests) where threads can release the Global Interpreter Lock (GIL) during blocking operations.
    -   Not ideal for CPU-bound tasks because Python's GIL can limit true parallelism, causing threads to compete for CPU time rather than running in parallel.

-   `Advantages`:

    -   Relatively lightweight compared to processes, making it efficient for managing many concurrent I/O-bound tasks.
    -   Easier communication and data sharing between threads since they share memory.

-   `Drawbacks`:

    -   Limited parallelism for CPU-bound tasks due to the GIL.
    -   Thread safety concerns when multiple threads access shared data simultaneously.

-   **Process of Multithreading in CPython**:

    -   `Thread Execution`: When a native thread in CPython starts executing Python bytecode, it must acquire the GIL first. This ensures exclusive access to Python objects and prevents multiple threads from manipulating them concurrently.
    -   `GIL Release on Blocking Operations`: The GIL is released when a thread is engaged in a blocking I/O operation. During these blocking periods, other threads can acquire the GIL and continue executing Python bytecode.
    -   `Implications for CPU-Bound Tasks`: In scenarios where a task is CPU-bound and requires significant computation performance, the GIL prevents true parallelism. Only one thread can execute Python bytecode at a time, limiting the benefits of multiple native threads.
    -   `Usefulness for I/O-Bound Tasks`: While the GIL presents challenges for CPU-bound tasks, it has less impact on I/O-bound tasks. In I/O-bound scenarios, threads can release the GIL during waiting periods, allowing other threads to execute Python bytecode.
    -   `Example`:

        ```python
        import threading
        start = time.perf_counter()

        def do_something(seconds=1):
            print(f'Sleeping {seconds} second(s)...')
            time.sleep(seconds)
            return f'Done Sleeping...{seconds}'

        t1 = threading.Thread(target=do_something)
        t2 = threading.Thread(target=do_something)

        t1.start()
        t2.start()

        t1.join()
        t2.join()

        finish = time.perf_counter()
        print(f'Finished in {round(finish-start, 2)} second(s)')

        #==============================================================================
        # VERSION 1: Using `threading` module
        #==============================================================================

        start = time.perf_counter()
        threads = []

        for _ in range(10):
            t = threading.Thread(target=do_something, args=[1.5])
            t.start()
            threads.append(t)

        for thread in threads:
            thread.join()


        finish = time.perf_counter()
        print(f'Finished in {round(finish-start, 2)} second(s)')

        #==============================================================================
        # VERSION 2: Using `concurrent.futures` module
        #==============================================================================

        import concurrent.futures
        start = time.perf_counter()

        with concurrent.futures.ThreadPoolExecutor() as executor:
            secs = [5, 4, 3, 2, 1]
            results = [executor.submit(do_something, sec) for sec in secs]

            for f in concurrent.futures.as_completed(results):
                print(f.result)

        finish = time.perf_counter()
        print(f'Finished in {round(finish-start, 2)} second(s)')

        #==============================================================================
        # VERSION 3: Using `concurrent.futures` module
        #==============================================================================
        start = time.perf_counter()

        with concurrent.futures.ThreadPoolExecutor() as executor:
            secs = [5, 4, 3, 2, 1]
            results = executor.map(do_something, secs)

            for result in results:
                print(result)

        finish = time.perf_counter()
        print(f'Finished in {round(finish-start, 2)} second(s)')
        ```

</details>

<details><summary style="font-size:25px;color:Orange">Asynchronous Programming (Async/Await)</summary>

Asynchronous programming is a form of multitasking that enables the concurrent execution of multiple tasks without the need for parallel threads or processes. It uses a single thread to manage multiple tasks that may involve I/O-bound operations. It allows tasks to yield control back to the event loop when waiting for I/O, rather than blocking the entire thread.

Asynchronous programming in Python, using the `async` and `await` keywords along with the `asyncio` module, allows developers to write concurrent code that appears to run in parallel, even within a single thread. This is achieved through an event-driven and cooperative multitasking model, which is different from traditional threading or multiprocessing. Here's how asynchronous programming manages multitasking in a single thread:

```python
import asyncio
import time

iteration_times = [1, 3, 2, 4]

async def sleeper(seconds, i=-1):
    start_time = time.time()
    if i != -1:
        print(f"{i}\t{seconds}s")
    await asyncio.sleep(seconds)
    return time.time() - start_time

run_time = 0
total_compute_run_time = 0
async def main(): # coroutine
    global run_time
    global total_compute_run_time
    # await sleeper(1, i=0)
    tasks = []
    for i, second in enumerate(iteration_times):
        tasks.append(asyncio.create_task(sleeper(second, i=i)))

    results = await asyncio.gather(*tasks)
    for run_time_result in results:
        total_compute_run_time += run_time_result
        if run_time_result > run_time:
            run_time = run_time_result

# main()
asyncio.run(main())
print(f"Ran for {run_time} seconds, with a total of {total_compute_run_time} and {run_time / total_compute_run_time }")
```

-   **Key Terms & Concepts**:

    -   `Event Loop`: The event loop is a mechanism that efficiently manages and dispatches events or messages in a program. It is a construct that allows for the execution of multiple tasks concurrently within a single thread. It continuously monitors various events, such as I/O operations completing, timers expiring, or signals being received, and dispatches these events to appropriate event handlers.
    -   `Coroutines`: Coroutines are special functions or methods that can be paused and resumed during execution. In Python, coroutines are defined using the `async def` syntax. They allow tasks to voluntarily `yield` control back to the event loop, enabling other tasks to run in the meantime. Coroutines are fundamental building blocks for asynchronous programming in Python.

-   **Process of Asynchronous Execution**: In asynchronous programming, the event loop is responsible for coordinating the execution of asynchronous tasks, ensuring that they run concurrently and efficiently. Here's how it typically works:

    -   `Task Queue`: The event loop maintains a queue of tasks that need to be executed. These tasks are usually represented as coroutines, which are special functions or methods defined using the `async def` syntax.
    -   `Task Scheduling`: When the event loop is idle, it selects the next task from the task queue and executes it. The task runs until it completes or encounters an asynchronous operation that requires waiting.
    -   `Non-Blocking I/O`: When a task encounters an asynchronous I/O operation (e.g., reading from a file, making a network request), it doesn't block the entire program. Instead, the task yields control back to the event loop, allowing other tasks to continue executing in the meantime.
    -   `Event Handling`: The event loop continuously monitors for events, such as I/O operations completing or timers expiring. When an event occurs, the event loop dispatches it to the appropriate event handler, which may be a callback function or a coroutine.
    -   `Concurrency`: By interleaving the execution of multiple tasks and efficiently managing I/O operations, the event loop enables asynchronous tasks to run concurrently within a single thread. This cooperative multitasking model avoids the overhead of managing multiple threads and ensures that the program remains responsive even under heavy loads.
    -   `Task Resumption`: When an asynchronous operation completes, the event loop schedules the corresponding task to resume execution. The task picks up from where it left off, processing the result of the asynchronous operation or performing any necessary follow-up actions.
    -   `Error Handling`: The event loop also handles errors and exceptions raised during the execution of asynchronous tasks. It ensures that errors are propagated to appropriate error handlers, allowing applications to handle and recover from errors gracefully.

-   **Advantages**:

    -   `Efficient I/O Operations`: Asynchronous programming is well-suited for I/O-bound tasks where tasks can yield control while waiting for external resources.
    -   `Single-Threaded Resource Usage`: Since only one task is executing at a time, asynchronous programming can be more memory-efficient compared to traditional multithreading.
    -   `Scalability`: Asyncio allows developers to write highly concurrent code without managing multiple threads or processes, making it easier to scale applications.

-   **Considerations**:

    -   Asynchronous programming requires cooperation from libraries, and not all libraries are designed to work seamlessly with asyncio.
    -   Asynchronous programming is commonly used in web servers and APIs to handle multiple concurrent connections efficiently. It allows the server to continue processing requests while waiting for I/O operations.
    -   Excellent for I/O-bound tasks where waiting for external resources (e.g., web requests, database queries) is common.
    -   Not ideal for CPU-bound tasks because a single thread cannot take full advantage of multiple CPU cores.
    -   Limited parallelism for CPU-bound tasks, as it uses a single thread.
    -   Requires adherence to asynchronous programming principles and may involve a learning curve.

In summary, asynchronous programming in Python, using the async and await keywords with asyncio, enables the efficient handling of I/O-bound tasks and the appearance of concurrent execution in a single thread through the use of coroutines and an event loop. It's a powerful paradigm for building scalable and responsive applications.

</details>

<details><summary style="font-size:25px;color:Orange">Multiprocessing (Process-Based Concurrency)</summary>

-   `Concurrency Model`: Multiprocessing uses multiple separate processes, each with its own Python interpreter and memory space. These processes can run in parallel on multi-core CPUs.

-   `Use Cases`:

    -   Ideal for CPU-bound tasks where true parallelism is required because each process runs independently on a separate core.
    -   Suitable for I/O-bound tasks as well, but processes have more overhead than threads.

-   `Advantages`:

    -   Achieves true parallelism, making it suitable for multi-core systems.
    -   Each process has its own memory space, reducing concerns about shared data and thread safety.

-   `Drawbacks`:

    -   Higher memory and resource overhead compared to threads.
    -   Inter-process communication (IPC) can be more complex than thread communication.

Multiprocessing allows you to create and manage multiple processes, each running independently to perform tasks in parallel, thereby improving the efficiency of CPU-bound operations.

</details>

---



The choice among these concurrency approaches depends on your specific application requirements, the nature of the tasks you're performing, and the available hardware resources. In some cases, a combination of these techniques may be appropriate to achieve the desired level of concurrency and performance.

-   **Threading**: Use when tasks are I/O-bound and you need to maintain a shared state between threads.
-   **Multiprocessing**: Use for CPU-bound tasks to leverage multiple CPU cores without being limited by the GIL.
-   **Asynchronous Programming**: Use for I/O-bound tasks where you want to avoid blocking and efficiently manage many concurrent tasks.

#### CPU vs Process vs Thread:

-   `CPU (Central Processing Unit)`:

    -   The CPU is the primary processing unit of a computer. It performs all the arithmetic, logic, and control operations required to execute instructions.
    -   Modern PCs typically have multi-core CPUs, which means there are multiple processing units (cores) on a single chip.
    -   Each core can execute instructions independently, allowing for parallel processing of tasks.

-   `Process`:

    -   A process is an independent program or application running on a computer. It includes its own memory space, system resources, and execution environment.
    -   Each process has its own program counter, registers, and stack.
    -   Multiple processes can run concurrently on a multi-core CPU, allowing for parallelism and multitasking.

-   `Thread`:

    -   A thread is a lightweight unit of execution within a process. Threads share the same memory space and resources as the process they belong to.
    -   Threads within a process can run concurrently and share data, which makes them suitable for tasks that require coordination and communication.
    -   Multithreading allows for parallelism within a single process and can take advantage of multi-core CPUs.

-   Can multiple process run on a single core?

    -   No, multiple processes cannot run simultaneously on a single core of a CPU. A core can execute instructions for one process at a time. However, modern operating systems and processors support multitasking and time-sharing, which gives the illusion that multiple processes are running concurrently. In reality, the CPU rapidly switches between processes, giving each a small time slice for execution.
    -   This concept is known as time-sharing or multitasking, and it allows multiple processes to run on a single core. The operating system's scheduler allocates CPU time to each process in a way that makes it appear as though they are running simultaneously, but they are actually taking turns.
    -   In contrast, on multi-core processors, each core can handle the execution of a separate process at the same time, providing true parallelism and better performance for multithreaded and multiprocessing applications.

-   How multiple application gets run on a single Core?
    -   Multiple applications running on a single core are managed by the operating system's process scheduler. The operating system employs a scheduling algorithm that allocates CPU time to different processes, allowing them to share the core efficiently. This mechanism is known as multitasking or time-sharing.

</details>

</details>

---

<details><summary style="font-size:30px;color:White;text-align:center">Programming Terminology</summary>

-   **Syntex**: Syntax is like the rules of a language - how to write valid code using the correct keywords, punctuation, and structure. Imagine writing a sentence in English, Syntax ensures your sentence follows grammatical rules (subject-verb agreement, proper punctuation).
-   **Sementics**: Semantics goes beyond syntax and asks what the code actually does. It's about the intended behavior or computation that the code defines.Imagine writing a sentence in English, Semantics conveys the actual meaning you're trying to express with the sentence. Semantic errors typically arise during runtime (when the program is actually running) because the code is syntactically correct but doesn't produce the intended outcome. For example, dividing by zero might be syntactically valid in some languages but would cause a semantic error at runtime.

<details><summary style="font-size:25px;color:Orange;text-align:left">Shallow Copy / Deep Copy</summary>

In Python, "shallow copy" and "deep copy" are two different methods used to create copies of objects, especially when dealing with complex data structures like lists, dictionaries, or custom objects. The key difference between them lies in how they handle nested objects (objects within objects) during the copy process.

#### Shallow Copy:

A shallow copy creates a new object, but it does not create new copies of nested objects. Instead, it references the original nested objects in the new container. In other words, a shallow copy is a copy of the top-level container object, but the elements inside that container are still shared between the original object and the copied object.
To create a shallow copy in Python, you can use the copy module's copy() function or the object's own copy() method.

```python
import copy

original_list = [1, 2, [3, 4]]
shallow_copied_list = copy.copy(original_list)

# Modify the nested list in the shallow copy
shallow_copied_list[2][0] = 99

print(original_list)          # Output: [1, 2, [99, 4]]
print(shallow_copied_list)    # Output: [1, 2, [99, 4]]
```

As you can see, when we modify the nested list in the shallow copied list, the change is also reflected in the original list because they share the same reference to the nested list.

#### Deep Copy:

A deep copy, on the other hand, creates a completely independent copy of the original object along with all its nested objects. It recursively creates new copies of all the objects found in the original object, including all nested objects. This means that changes made to nested objects in the deep copy won't affect the original object or vice versa.
To create a deep copy in Python, you can use the copy module's deepcopy() function.

```python
import copy

original_list = [1, 2, [3, 4]]
deep_copied_list = copy.deepcopy(original_list)

# Modify the nested list in the deep copy
deep_copied_list[2][0] = 99

print(original_list)          # Output: [1, 2, [3, 4]]
print(deep_copied_list)       # Output: [1, 2, [99, 4]]
```

In this case, the modification to the nested list in the deep copied list does not affect the original list because they are now independent copies.

#### When to use Shallow Copy and Deep Copy:

-   `Shallow Copy`:

    -   Use a shallow copy when you want to create a new container object, but you want to keep the references to the nested objects intact (i.e., you want to share the nested objects between the original and copied objects).
    -   Shallow copies are generally faster and more memory-efficient since they only copy references to objects and not the objects themselves.

-   `Deep Copy`:
    -   Use a deep copy when you need a completely independent copy of the original object and all its nested objects. This ensures that changes to the copied object won't affect the original object or any of its nested objects.
    -   Deep copies are slower and consume more memory, especially for complex data structures, since they recursively copy all nested objects.

```python
from copy import copy, deepcopy

list_1 = [1, 2, [3, 5], 4]

## shallow copy

list_2 = copy(list_1)
list_2[3] = 7
list_2[2].append(6)

list_2 # output => [1, 2, [3, 5, 6], 7]

list_1 # output => [1, 2, [3, 5, 6], 4]

## deep copy

list_3 = deepcopy(list_1)
list_3[3] = 8
list_3[2].append(7)

list_3 # output => [1, 2, [3, 5, 6, 7], 8]

list_1 # output => [1, 2, [3, 5, 6], 4]
```

</details>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">Duck Typing</summary>

-   [Duck Typing and Asking Forgiveness, Not Permission (EAFP)](https://www.youtube.com/watch?v=x3v9zMX1s4s)

The term "duck typing" comes from the saying, "If it looks like a duck, swims like a duck, and quacks like a duck, then it probably is a duck." In the context of Python, it means that the type or the class of an object is determined by its behavior rather than its explicit type.

-   In languages with static typing, you usually need to declare the type of a variable explicitly, and the compiler enforces that the variable must always be of that specific type. In contrast, Python uses dynamic typing, and variables can hold values of any type at runtime. Duck typing takes advantage of this dynamic nature, allowing Python to be more flexible and concise in handling different types of objects.

-   In Python, you can perform operations on objects without worrying about their specific type, as long as they support the required methods or behavior. If an object supports the required methods, it is considered to be of the necessary type for that particular operation, regardless of its actual class.

-   Example of duck typing in Python:

    ```python
    class Duck:
        def quack(self):
            print("Quack!")

    class Dog:
        def quack(self):
            print("Dog does not quack but makes a different sound.")

    class Robot:
        def beep(self):
            print("Beep!")

    def make_sound(animal):
        animal.quack()

    duck = Duck()
    dog = Dog()
    robot = Robot()

    make_sound(duck)  # Output: Quack!
    make_sound(dog)   # Output: Dog does not quack but makes a different sound.
    # make_sound(robot)  # Throws an AttributeError since Robot doesn't have a 'quack' method.
    ```

    -   In this example, we define three different classes Duck, Dog, and Robot. Each class has its own quack or beep method. The make_sound function takes an argument animal and calls the quack method on it. Even though the make_sound function doesn't know the exact type of the animal, it still works as long as the object passed to it has a quack method.

Duck typing is a powerful concept that allows Python code to be more generic, extensible, and easy to maintain. However, it also comes with some trade-offs. Since the type of an object is determined at runtime, there is less compile-time safety, and errors related to incorrect method calls might only be discovered during runtime. Careful documentation and testing are important to ensure the correct behavior of the code.

</details>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">Terms & Concepts in Programming Paradigm</summary>

#### Pure Function:

A pure function is a function that has two main characteristics:

-   **Deterministic**: For the same input, a pure function will always produce the same output, regardless of the external state or context. It does not rely on any external variables or mutable state.
-   **No Side Effects**: A pure function does not modify any external state or produce observable side effects, such as changing global variables, modifying input parameters, or performing I/O operations like reading or writing files.
-   **Advantages**:

    -   They are easy to reason about and test since their behavior is predictable and isolated.
    -   They can be optimized and memoized more effectively since their output is solely determined by their inputs.
    -   They facilitate parallel and concurrent programming as they do not share data between different executions.
    -   Example of a pure function:

        ```python
        def add(a, b):
            return a + b
        ```

#### Higher-Order Function:

-   A higher-order function is a function that takes one or more functions as arguments and/or returns a function as its result. In other words, it treats functions as first-class citizens, enabling them to be manipulated and passed around like any other data type.

-   Higher-order functions are a fundamental concept in functional programming and allow for more flexible and modular code.

-   Example of a higher-order function:

    ```python
    def apply_operation(operation, a, b):
        return operation(a, b)

    def add(a, b):
        return a + b

    def multiply(a, b):
        return a * b

    result = apply_operation(add, 3, 5)       # Result: 8
    result = apply_operation(multiply, 3, 5)  # Result: 15
    ```

In this example, apply_operation is a higher-order function that takes another function (add or multiply) as an argument and applies it to the provided arguments a and b.

#### First-Class Object:

-   In a programming language, a first-class object (or first-class citizen) refers to entities that can be treated like any other object in the language. This means that they can be:

    -   Assigned to variables.
    -   Passed as arguments to functions.
    -   Returned from functions.
    -   Stored in data structures like lists or dictionaries.

-   In a language with support for first-class objects, functions are treated as first-class objects, and they can be used just like any other data type, such as integers, strings, or lists.

-   In Python, functions are first-class objects, which means you can perform all the above operations on functions. This feature allows for the use of higher-order functions and the creation of closures, among other powerful programming techniques.

-   Example of functions as first-class objects:

    ```python
    def add(a, b):
        return a + b

    def multiply(a, b):
        return a * b

    # Assigning functions to variables
    operation = add
    result = operation(3, 5)  # Result: 8

    operation = multiply
    result = operation(3, 5)  # Result: 15

    # Passing functions as arguments to other functions
    def apply_operation(operation, a, b):
        return operation(a, b)

    result = apply_operation(add, 3, 5)       # Result: 8
    result = apply_operation(multiply, 3, 5)  # Result: 15

    # Returning functions from other functions
    def get_operation(type):
        if type == 'add':
            return add
        elif type == 'multiply':
            return multiply

    operation = get_operation('add')
    result = operation(3, 5)  # Result: 8
    ```

In summary, pure functions are functions that produce consistent outputs with no side effects, higher-order functions treat functions as first-class objects, and first-class objects are entities that can be used just like any other data type in the language. Python's support for first-class functions allows for more expressive and flexible code, enabling powerful programming paradigms like functional programming.

#### Imperative Programming:

Imperative Programming is a programming paradigm that focuses describing a sequence of steps or commands to be executed by the computer to achieve a desired outcome. This style of programming is closer to how humans think and describe processes. The emphasis is on the `how` of achieving a task. Key characteristics of imperative programming:

-   Code consists of a series of statements that change the program's state.
-   Developers specify detailed step-by-step instructions for solving a problem.
-   Control structures like loops and conditionals are used extensively.
-   Mutable state is common, where variables are assigned new values over time.
-   Examples of imperative programming languages include C, C++, Java, and Python (to some extent).

#### Declarative Programming:

Declarative Programming is a programming paradigm that focuses on specifying the desired outcome or properties of a computation without explicitly detailing the steps to achieve it. It describe what should be accomplished rather than how it should be accomplished. Developers specify the desired outcome or goal, and the program's logic takes care of determining the best way to achieve it. The emphasis is on the `what` of a task. Key characteristics of declarative programming:

-   Code expresses high-level abstractions and relationships.
-   Developers describe the problem and its solution using expressions and statements.
-   Control structures are abstracted and hidden, often through built-in functions or methods.
-   Immutable data structures are favored to avoid side effects.
-   Examples of declarative programming languages include SQL, HTML, CSS, and functional programming languages like Haskell and Lisp.

Functional Programming (FP) and Procedural Programming (PP) are two different paradigms for writing computer programs. Here's a comparison of the two:

#### Functional Programming (FP):

Functional Programming is a programming paradigm that emphasizes the use of pure functions, which means that functions produce the same output for a given input and have no side effects. It is based on the principles of mathematical functions and immutability. Here functions are treated as first-class citizens and can be passed as arguments, returned from other functions, and stored in data structures. Functions in functional programming don't have side effects and do not modify state; they take input and produce output.

-   `Abstraction`: FP focuses on using functions as first-class citizens, allowing functions to be passed as arguments, returned as values, and assigned to variables. It emphasizes a higher level of abstraction.
-   `Immutability`: Data is immutable, meaning that once it's created, it cannot be changed. Instead of modifying existing data in place, functional programming encourages creating new data structures through transformations.
-   `Statelessness`: FP encourages writing stateless functions, which makes code more predictable and easier to reason about. Functions have no side effects on external state.
-   `Pure Functions`: FP promotes pure functions, which always produce the same output for the same input and have no side effects. This predictability enhances testability and maintainability.
-   `Recursion`: Recursion is often favored over loops for iteration. Tail recursion is commonly used, and it can replace traditional loop constructs.
-   `Higher-Order Functions`: FP leverages higher-order functions, such as map, filter, and reduce, for processing collections and performing data transformations.
-   `Concurrency`: FP can simplify concurrent and parallel programming by minimizing shared state and mutable data.
-   `Declarative`: FP code tends to be more declarative, focusing on what should be done rather than how it should be done.

#### Procedural Programming (PP):

Procedural programming is a subset of imperative programming and is a specific programming style.

-   `Step-by-Step`: PP follows a step-by-step, linear approach to problem-solving. It emphasizes breaking a problem into smaller procedures or functions.
-   `Mutable Data`: PP typically uses mutable data structures, where data can be modified in place. It may involve updating variables and changing the program's state.
-   `Stateful`: PP often uses shared state between procedures, which can lead to unexpected side effects and make code harder to reason about.
-   `Loops`: Loops, such as for and while, are commonly used for iteration and control flow.
-   `Procedures`: PP revolves around procedures or functions that perform specific tasks or operations. These procedures are called sequentially to solve a problem.
-   `Efficiency`: Procedural code can be highly efficient, as it often focuses on low-level optimization and direct manipulation of data.
-   `Imperative`: PP code tends to be more imperative, specifying how a task should be accomplished through a series of instructions.

</details>

---

<details><summary style="font-size:25px;color:Orange;text-align:left">Closures</summary>

-   [Closures - How to Use Them and Why They Are Useful](https://www.youtube.com/watch?v=swU3c34d2NQ)

A closure is a powerful concept in programming languages like Python that support first-class functions. In simple terms, a closure is a function that remembers the environment in which it was created. It retains access to variables, bindings, and other references from the enclosing scope, even after the outer function has finished executing. This allows the inner function to "close over" and capture the state of its surrounding environment. Let's break down the components and behavior of closures in more detail:

-   **Function Definitions and Nested Functions**: In Python, functions can be defined inside other functions, creating what is known as nested functions or inner functions. These inner functions have access to the variables and parameters of the enclosing (outer) function.

    ```python
    def outer_function(x):
        def inner_function(y):
            return x + y
        return inner_function
    ```

-   **Returning Functions**: Closures are often used when a function returns another function. In the example above, the outer_function returns the inner_function. When the inner function is returned, it still has access to the variable x from the outer_function, even though the outer_function has already finished executing.

-   **Accessing Variables from the Enclosing Scope**: The inner function can access and "close over" the variables and parameters from its enclosing scope (the scope of the outer function). This is possible because the closure retains a reference to the environment in which it was defined.

    ```python
    add_five = outer_function(5)
    result = add_five(10)  # Calling the inner function with y=10 and x=5 from the enclosing scope
    print(result)          # Output: 15
    ```

-   **Use Cases for Closures**:

    -   `Function Factories`: Closures are often used to create function factories, where a higher-order function returns specialized functions based on the parameters passed.
    -   `Data Hiding`: Closures can be used to hide variables or data within a function, encapsulating state and protecting it from direct access or modification from outside the function.
    -   `Callbacks`: Closures are commonly used for callback functions in event handling, where a function is passed as an argument to be called later, often with access to certain context-specific variables.
    -   `Lifetime of Closures`: Closures remain in memory as long as they are referenced by other objects. When a closure is returned by a function and assigned to a variable or passed as an argument to another function, the closure will continue to exist in memory. If there are no references to the closure anymore, it will be garbage collected like any other object.

-   **Mutable Closures and Gotchas**: When using mutable variables in closures (e.g., lists or dictionaries), you need to be cautious about the "late binding" behavior. Late binding means that the inner function can change the value of a variable in the enclosing scope even after the closure is created. This can lead to unexpected behavior and is something to keep in mind when working with mutable closures.

    ```python
    def create_multiplier():
        factor = 2

        def multiplier(x):
            return x * factor

        factor = 10  # Changing the value of 'factor'
        return multiplier

    multiply = create_multiplier()
    print(multiply(5))  # Output: 50 (not 10, because the closure remembers the latest value of 'factor')
    ```

In conclusion, closures in Python are a powerful mechanism that allows functions to retain access to the variables and context of their enclosing scope. This feature is extensively used to create flexible and reusable code, particularly in functional programming and other advanced programming paradigms.

A closure is a powerful concept in programming languages that support first-class functions, like Python. In simple terms, a closure is a function that remembers the environment in which it was created. It retains access to variables, bindings, and other references from the enclosing scope, even after the outer function has finished executing. This allows the inner function to "close over" and capture the state of its surrounding environment.

</details>

</details>

---

<details><summary style="font-size:30px;color:White;text-align:center">Python Interview Questions</summary>

<details><summary style="font-size:18px;color:#C71585">what is the difference between <b>Hashmap</b> and <b>Hashset</b>?</summary>

-   **HashMap**: A HashMap is a data structure in programming that stores key-value pairs and provides efficient retrieval based on keys. It uses a technique called hashing to map keys to corresponding values, allowing for fast lookup times. In a HashMap, each key must be unique, but values can be duplicated.

    -   A HashMap is a data structure that stores key-value pairs.
    -   It uses hashing to efficiently store and retrieve elements based on their keys.
    -   Each key in a HashMap must be unique, but values can be duplicated.
    -   HashMap provides methods for adding, removing, and retrieving elements by their keys.
    -   Examples of HashMap implementations in different programming languages include Java's `HashMap`, Python's `dict`, and JavaScript's `Map`.

-   **HashSet**: A HashSet is a data structure in programming that stores a collection of unique elements. It uses hashing to ensure that elements are stored in such a way that there are no duplicates. HashSet does not preserve the order of elements and does not allow duplicate elements to be added. HashSet is commonly used for tasks such as removing duplicates from a collection or checking for the presence of an element in a set.

    -   A HashSet is a data structure that stores unique elements.
    -   It uses hashing to ensure that elements are stored in such a way that there are no duplicates.
    -   HashSet does not store key-value pairs; it only stores elements.
    -   HashSet provides methods for adding, removing, and checking the presence of elements.
    -   Examples of HashSet implementations in different programming languages include Java's `HashSet`, Python's `set`, and JavaScript's `Set`.

</details>

<details><summary style="font-size:18px;color:#C71585">Pass by value vs pass by reference in Python</summary>

The concepts of `pass by value` and `pass by reference` can be a bit misleading because the behavior is determined by whether the object being passed is mutable or immutable. In Python, arguments are passed by object reference, but the distinction between mutable and immutable objects affects the way they are modified inside a function.

-   **Immutable Objects (Pass by Value-Like)**:
    -   Immutable objects (e.g., integers, strings, tuples) cannot be modified in place.
    -   When you pass an immutable object to a function, any changes made to the object inside the function create a new object, and the original object remains unchanged.
-   **Mutable Objects (Pass by Reference-Like)**:
    -   Mutable objects (e.g., lists, dictionaries) can be modified in place.
    -   When you pass a mutable object to a function and modify it inside the function, the changes affect the original object.
-   **Conclusion**:
    -   The key distinction in Python is between mutable and immutable objects. - Immutable objects behave more like "pass by value," as modifications create new objects. - Mutable objects behave more like "pass by reference," as modifications are reflected outside the function.

</details>

<details><summary style="font-size:18px;color:#C71585">When you prefer list over dict and vice-versa in Python</summary>

The choice between using a list and a dictionary (dict) in Python depends on the specific requirements of your program and the type of data you need to store. Here are some considerations for when to prefer a list over a dict and vice versa:

-   **list**: list is a data structure that represents an ordered collection of elements. Lists are mutable, meaning their elements can be modified after creation. Each element in a list is indexed by a sequential integer starting from zero, allowing for easy access and manipulation of elements. Lists can contain elements of any data type, including other lists and objects. Lists are created using square brackets **[ ]** or the **list()** constructor. Lists are commonly used for storing and organizing data in sequential order, such as arrays or lists in other programming languages.

    -   `Ordered Collection`: If the order of elements matters, and you want to maintain the sequence in which elements were added, use a list.
    -   `Index-Based Access`: When you need to access elements by their position or index, a list is suitable. Lists support integer indexing.
    -   `Homogeneous Elements`: If the elements you are storing are of the same type or have a similar structure, a list is appropriate.
    -   `Iterative Processing`: Lists are good for looping through elements sequentially using constructs like for item in my_list.
    -   `Mutable Content`: Lists are mutable, meaning you can modify, add, or remove elements after the list is created.

-   **dict**: dictionary (or dict) is a data structure that represents an unordered collection of key-value pairs. Each key in a dictionary is unique and associated with a corresponding value. Dictionaries are mutable, meaning their key-value pairs can be modified after creation. Keys in a dictionary can be of any immutable type, such as strings, integers, or tuples, while values can be of any data type, including other dictionaries and objects. Dictionaries are created using curly braces **{ }** or the **dict()** constructor. They are commonly used for mapping keys to values and for fast lookup operations based on keys.

    -   `Key-Value Pairs`: If you have data that naturally fits into key-value pairs, where each value is associated with a unique key, use a dictionary.
    -   `Fast Lookup by Key`: Dictionaries offer constant-time average lookup, making them efficient for retrieving values based on keys.
    -   `Unordered Collection`: If the order of elements doesn't matter, and you're interested in quick lookups by key, a dictionary is a better choice.
    -   `Associative Relationships`: When you want to represent relationships between entities, such as mapping user IDs to user names.
    -   `Immutable Keys`: Keys in dictionaries must be immutable (e.g., strings, numbers, tuples). If your data fits this constraint, a dictionary may be suitable.
    -   `Flexibility with Data Types`: Dictionaries allow you to have values of different data types associated with different keys.

</details>

<details><summary style="font-size:18px;color:#C71585">How to define abstract class in Python3?</summary>

In Python 3, abstract classes are located in the abc module, which stands for "Abstract Base Classes." This module provides the infrastructure for defining abstract base classes in Python. You can import it using the following statement:

```python
import abc

class AbstractClass(abc.ABC):
    @abstractmethod
    def abstract_method(self):
        pass  # Placeholder for the method implementation in subclasses

class Subclass(AbstractClass):
    def abstract_method(self):
        # Concrete implementation of the abstract method
        print("This method is implemented in the subclass")

# This will work because Subclass implements the abstract method
my_subclass = Subclass()
my_subclass.abstract_method()

# This will raise a NotImplementedError because AbstractClass is abstract
# abstract_instance = AbstractClass()  # This line will cause an error
```

The ABC class serves as the base class for defining abstract classes, and the abstractmethod decorator is used to mark abstract methods within those classes. By subclassing ABC and decorating methods with abstractmethod, you can define abstract classes and enforce that concrete subclasses implement certain methods.

</details>

<details><summary style="font-size:18px;color:#C71585">how to use <b>del</b> keyword in Python?</summary>

In Python, the **del** keyword is used to remove an item from a list, delete a variable, or delete an attribute from an object. Here are some common use cases:

-   `Removing an item from a list`:

    ```python
    my_list = [1, 2, 3, 4, 5]
    del my_list[2]  # Removes the item at index 2 (value 3)
    print(my_list)  # Output: [1, 2, 4, 5]
    ```

    -   You cannot use **del** to delete elements from immutable objects like strings or tuples themselves (as the entire object cannot be modified). You can only delete slices to create a new modified version.

-   `Deleting a variable`: You can use **del** to remove a variable's reference to an object. This doesn't necessarily destroy the object itself, but it makes the object unreachable from your code through that specific variable name.

    ```python
    x = 5
    del x  # Deletes the variable 'x'
    # print(x)  # This would raise a NameError because 'x' no longer exists
    ```

-   `Deleting an attribute from an object`:

    ```python
    class MyClass:
        def __init__(self):
            self.attr = 10

    obj = MyClass()
    print(obj.attr)  # Output: 10

    del obj.attr  # Deletes the attribute 'attr' from the object
    # print(obj.attr)  # This would raise an AttributeError because 'attr' no longer exists
    ```

Keep in mind that using **del** to remove an item from a list modifies the list in-place, while using it to delete a variable or attribute removes the reference to the object, potentially allowing the garbage collector to reclaim the memory if there are no other references to the object.

</details>

<details><summary style="font-size:18px;color:#C71585">how <b>del</b> keyword and <b>__del__()</b> special method in python are related?</summary>

The del keyword and the `__del__()` special method in Python are related in the sense that they both deal with the deletion or destruction of objects, but they serve different purposes and operate at different levels of the Python language.

-   **del** keyword: The **del** keyword in Python is used to delete references to objects. It can be used to delete names (variables, attributes, functions), which may lead to the deallocation of memory associated with the object if there are no other references to it. When **del** is used to delete a reference to an object, it decrements the object's reference count. If the reference count drops to zero, indicating that there are no more references to the object, the object may be garbage collected and its memory reclaimed.

    ```python
    x = 42  # Create an object (integer 42) and assign it to the variable x
    del x   # Delete the reference to the object
    def square(x): return x*x

    b = square(5)
    print(b)  ## 25
    del square
    c = square(2) ## NameError: name 'square' is not defined
    ```

-   **\_\_del\_\_()** special method: The `__del__()` method is a special method in Python classes that gets called when an object is about to be destroyed or garbage collected. It serves as a **finalizer** or **cleanup handler** for an object. Unlike the `del` keyword, which deals with deleting references to objects, the `__del__()` method deals with the cleanup of resources associated with an object when it is no longer needed.

    ```python
    class MyClass:
        def __del__(self):
            print("Destructor called, object destroyed")

    obj = MyClass()  # Create an object of MyClass
    del obj          # Delete the reference to the object, `__del__()` may be called
    ```

It's important to note that the `__del__()` method is not guaranteed to be called promptly when an object is deleted or goes out of scope. The timing of when `__del__()` is called is determined by Python's garbage collector, which operates asynchronously.

In summary, while both **del** and `__del__()` are involved in the process of object destruction in Python, they serve different purposes: **del** is used to delete references to objects, while `__del__()` is a special method used for cleanup and finalization tasks when an object is about to be destroyed.

</details>

<details><summary style="font-size:18px;color:#C71585">Explain destructor in context of Python</summary>

In Python, unlike C++, there are no explicit destructors like the ones defined with the `~ClassName()` syntax. Instead, Python relies on automatic garbage collection to reclaim memory and clean up resources when objects are no longer in use.

Python uses a mechanism called **reference counting** along with a **cycle-detecting** garbage collector to manage memory and automatically reclaim memory when objects are no longer referenced. When an object's reference count drops to zero, meaning there are no more references to the object, Python's garbage collector automatically frees the memory associated with that object.

However, Python does provide a special method called `__del__()` that can be defined in a class to act as a finalizer or a cleanup handler. While this method is called a destructor in Python, it's important to note that it's not guaranteed to be called when an object is destroyed, and its use is generally discouraged for cleanup tasks due to some limitations and unpredictability:

-   `Unpredictable Timing`: The `__del__()` method is called by the garbage collector when there are no more references to an object. However, the timing of when this happens is not guaranteed and can vary between different Python implementations. Therefore, you can't rely on `__del__()` for critical cleanup tasks.
-   `Circular References`: If objects refer to each other in a circular manner, they may not be garbage collected even if there are no external references to them. This can prevent the `__del__()` method from being called, leading to resource leaks.
-   `Resource Management`: Using `__del__()` for resource cleanup, such as closing files or releasing network connections, can be risky. If an exception occurs during the object's destruction, the `__del__()` method may not execute properly, leaving resources open or not properly released.
-   `No Guaranteed Order`: The order in which `__del__()` methods are called during interpreter shutdown or when objects are collected is not guaranteed. Therefore, it's not safe to rely on `__del__()` for cleanup tasks that depend on specific orderings.
-   `Potential Pitfalls`: Using `__del__()` can introduce subtle bugs and resource leaks, especially when dealing with circular references or objects that manage external resources like file handles or database connections.

Given these limitations, Python developers are encouraged to use Context Managers for resource management and cleanup tasks. Context Managers provide a more predictable and reliable way to ensure that resources are properly managed and released, even in the presence of exceptions or early returns.

In summary, while Python does support a `__del__()` method that can serve as a destructor-like mechanism, it's not a true destructor in the same sense as in languages like C++. Developers should prefer more reliable and deterministic approaches to resource management, such as context managers and the `with` statement, for cleanup tasks in Python.

#### "Finalizer" or "Finalization" in Java:

In Java, finalization refers to the process of cleaning up resources associated with an object before it is garbage collected. Finalization is primarily achieved through the use of finalizers, which are special methods defined within a class that are automatically invoked by the Java Virtual Machine (JVM) before an object is reclaimed by the garbage collector.

-   `Finalizer Method`: To enable finalization for an object, you can define a special method called the finalizer method. This method is named `finalize()` and is defined within the class of the object that needs finalization.
-   `Cleanup Operations`: Inside the `finalize()` method, you can include cleanup code to release any resources associated with the object, such as closing files, releasing network connections, or releasing other system resources. Finalization is commonly used for tasks that are not handled by Java's automatic memory management, such as releasing native resources or managing external system resources.

</details>

<details><summary style="font-size:18px;color:#C71585">What are global, protected and private attributes in Python?</summary>

There are conventions for indicating the accessibility of attributes and methods within a class. These conventions are not enforced by the language itself, but they serve as a guideline for developers to indicate the intended usage of class members. Here are the commonly used conventions for attribute accessibility:

-   **Public Attributes**: Public attributes are those that can be accessed from outside the class without any restrictions. By convention, attributes that start with an underscore (\_) or do not have any leading underscores are considered public.

    ```python
    class MyClass:
        def __init__(self):
            self.public_attribute = 10
    ```

    In the example above, public_attribute is a public attribute that can be accessed directly from outside the MyClass class.

-   **Protected Attributes**: Protected attributes are those that should not be accessed directly from outside the class, but can still be accessed if needed. By convention, attributes that start with a single underscore (\_) are considered protected.

    ```python
    class MyClass:
        def __init__(self):
            self._protected_attribute = 20
    ```

    In the example above, \_protected_attribute is a protected attribute. While it can be accessed from outside the class, it is generally considered an implementation detail and should be used with caution.

-   **Private Attributes**: Private attributes are those that should not be accessed or modified directly from outside the class. By convention, attributes that start with double underscores (\_\_) are considered private.

    ```python
    class MyClass:
        def __init__(self):
            self.__private_attribute = 30
    ```

    In the example above, **private_attribute is a private attribute. It is name-mangled to \_MyClass**private_attribute, making it less accessible from outside the class. However, it can still be accessed using the mangled name.

It's important to note that these conventions are not enfo

</details>

<details><summary style="font-size:18px;color:#C71585">What is the difference between `.py` and `.pyc` files?</summary>

The main difference between `.py` and .pyc files in Python is their purpose and how they are used:

-   **.py Files (Python Source Files)**:

    -   `.py` files are Python source code files.
    -   They contain human-readable Python code that is written by developers.
    -   These files are meant to be edited and maintained by developers.
    -   When a Python script is executed, the Python interpreter directly interprets and executes the code in the `.py` file.

-   **.pyc Files (Compiled Python Bytecode Files)**: The Python interpreter typically creates a `.pyc` file the first time it encounters a `.py` file. This involves compiling the source code in the `.py` file into bytecode and storing it in the `.pyc` file with the same name but a `.pyc` extension (located in the same directory).

    -   When you run a Python script (`.py` file) directly, the interpreter checks for a corresponding `.pyc` file. However, for modules imported within another script, `.pyc` files might not be created unless specifically imported for the first time at the module level (using import module_name).
    -   These files store the compiled bytecode of a Python program. Bytecode is a low-level intermediate representation of the code, generated by the Python interpreter when it first encounters a `.py` file.
    -   They are created when a `.py` file is imported or executed for the first time.
    -   The bytecode is platform-independent and is optimized for execution by the Python interpreter.
    -   `.pyc` files are used to speed up the loading and execution of Python scripts.
    -   If a `.pyc` file exists and is up-to-date with its corresponding `.py` file, Python will load and execute the `.pyc` file instead of recompiling the source code.
    -   `.pyc` files are generally not meant to be edited by developers and are created and managed by the Python interpreter.

In summary, `.py` files contain human-readable Python source code, while `.pyc` files contain compiled bytecode generated by the Python interpreter for faster execution. Developers work with `.py` files, while `.pyc` files are automatically generated and used by the Python interpreter to optimize script execution.

</details>

<details><summary style="font-size:18px;color:#C71585">What are Python namespaces? Why are they used?</summary>

In Python, a namespace is a mapping from names (identifiers) to objects. It's essentially a dictionary where the keys are the names of variables, functions, classes, etc., and the values are the corresponding objects.

Namespaces are used to organize and manage the names used in a Python program. They help avoid naming conflicts and provide a way to encapsulate names within different scopes.

-   **Python has several types of namespaces**:

    -   `Global Namespace`: This namespace contains names defined at the top level of a module or script. It is accessible from anywhere within the module or script.

    -   `Local Namespace`: This namespace contains names defined within a function. It is created when the function is called and destroyed when the function exits. Each function call creates its own local namespace.

    -   `Enclosing Namespace`: This namespace is used in nested functions. It contains names defined in the enclosing function (but not global names or names defined in other enclosing functions).

    -   `Built-in Namespace`: This namespace contains names of built-in functions, exceptions, and other objects that are available by default in Python. It is automatically loaded when Python starts.

    -   `Module Namespace`: Each module in Python has its own namespace, containing the functions, classes, and variables defined within that module.

-   **Accessing Names from Other Namespaces**:

    -   To use a name from another namespace, you need to import the module containing the definition and then prefix the name with the module name (dot notation).

</details>

<details><summary style="font-size:18px;color:#C71585">What is Scope Resolution in Python?</summary>

Scope resolution in Python refers to the process of determining the value of a variable or the definition of a function based on its location within the code. Python follows a set of rules to determine the scope of variables and functions.

There are four types of scopes in Python:

-   `Local Scope`: Variables defined within a function have local scope. They can only be accessed within that function.

-   `Enclosing Scope (or Nonlocal Scope)`: This scope is applicable to nested functions. Variables defined in the outer function can be accessed by the inner function.

-   `Global Scope`: Variables defined at the top level of a module have global scope. They can be accessed from any part of the module.

-   `Built-in Scope`: Python provides a set of built-in functions and exceptions that are available globally. These are part of the built-in scope.

</details>

<details><summary style="font-size:18px;color:#C71585">What are decorators in Python?</summary>

</details>

<details><summary style="font-size:18px;color:#C71585">What are Dict and List comprehensions?</summary>

<details><summary style="font-size:18px;color:#C71585">What is Generator Expression?</summary>

A generator expression in Python is a concise way to create a generator, which is an iterator that generates items one at a time and on demand. It is similar to a list comprehension but uses parentheses instead of square brackets.

</details>

A list comprehension in Python is a concise way to create lists. It allows you to generate a new list by applying an expression to each item in an existing iterable, optionally filtering items with a condition.

Dict and List comprehensions are concise and expressive ways to create dictionaries and lists, respectively, in Python. They allow you to create these data structures using a compact syntax, often in a single line of code.

</details>

<details><summary style="font-size:18px;color:#C71585">What is lambda in Python? Why is it used?</summary>

A lambda function in Python is an anonymous, inline function defined using the lambda keyword. It can take any number of arguments but can only have one expression. It is typically used for small, simple operations.

</details>

<details><summary style="font-size:18px;color:#C71585">How do you copy an object in Python?</summary>

</details>

<details><summary style="font-size:18px;color:#C71585">What is the difference between xrange and range in Python?</summary>

</details>

<details><summary style="font-size:18px;color:#C71585">What is pickling and unpickling?</summary>

Pickling and unpickling are processes in Python used for serializing and deserializing objects, respectively. These processes are commonly used for saving Python objects to a file or transmitting them over a network.

-   **Pickling**:

    -   Pickling is the process of converting a Python object into a byte stream.
    -   This byte stream can then be stored in a file or transmitted over a network.
    -   It is achieved using the pickle module in Python.
    -   Pickling allows you to save the state of Python objects, including their data and structure, to be used later.

-   **Unpickling**:

    -   Unpickling is the process of converting a byte stream back into a Python object.
    -   This allows you to reconstruct the original object from the byte stream.
    -   It is achieved using the pickle module in Python.
    -   Unpickling allows you to retrieve the state of Python objects that were previously pickled.

</details>

<details><summary style="font-size:18px;color:#C71585">What is python interpretor?</summary>

A Python interpreter is a program that reads and executes Python code. It translates Python code into bytecode and then executes it on the Python runtime environment. The interpreter is responsible for parsing the Python code, checking for syntax errors, and executing the instructions one by one.

-   **CPython**: Python comes with a default interpreter called CPython, which is implemented in the C programming language. CPython is the most widely used Python interpreter and serves as the reference implementation for the Python language. It provides a command-line interface (CLI) where users can interactively execute Python code or run Python scripts stored in files. Apart from CPython, there are other Python interpreters available, each with its own unique features and optimizations. Some examples include:
-   **Jython**: An implementation of Python that runs on the Java Virtual Machine (JVM), allowing Python code to interact with Java libraries and frameworks.
-   **IronPython**: A Python interpreter for the .NET framework, enabling Python code to integrate with the .NET ecosystem and use .NET libraries.

</details>

<details><summary style="font-size:18px;color:#C71585">How Python is interpreted?</summary>

Python is an interpreted language, which means that the Python code is executed line by line by the Python interpreter. Here's how Python interpretation typically works:

-   **Source Code**: Python programs are written in human-readable source code files with a .py extension.
-   **Lexical Analysis (Tokenization)**: When you run a Python script, the Python interpreter first performs lexical analysis, also known as tokenization. In this phase, the source code is broken down into a sequence of tokens such as keywords, identifiers, operators, and literals.
-   **Parsing**: After tokenization, the Python interpreter parses the token stream to build a parse tree or abstract syntax tree (AST). This process involves analyzing the structure of the code to ensure it conforms to the syntax rules of the Python language.
-   **Bytecode Generation**: Once the parsing is complete and the syntax is validated, the Python interpreter generates bytecode instructions from the AST. Bytecode is a low-level representation of the Python code that is platform-independent.
-   **Execution**: The generated bytecode is then executed by the Python Virtual Machine (PVM). The PVM is responsible for interpreting and executing the bytecode instructions. During execution, the PVM interacts with the system's hardware and operating system to perform tasks such as memory management, I/O operations, and exception handling.
-   **Dynamic Typing**: Python is dynamically typed, meaning that variable types are determined at runtime. As the code is executed, the Python interpreter automatically infers the types of variables and performs type checking dynamically.
-   **Garbage Collection**: Python's memory management system includes automatic garbage collection. The interpreter periodically scans the memory to identify and reclaim memory occupied by objects that are no longer referenced by the program. This helps to prevent memory leaks and ensures efficient memory usage.

Overall, Python's interpreted nature allows for quick development and testing cycles, as changes to the code can be immediately executed without the need for compilation. However, it may also result in slower execution speed compared to compiled languages.

</details>

<details><summary style="font-size:18px;color:#C71585">What is the use of <b>help()</b> and <b>dir()</b> functions?</summary>

-   **help()** Function:

    -   The `help()` function is used to get documentation and information about objects, modules, functions, classes, and methods in Python.
    -   When you pass an object or function as an argument to `help()`, it displays a help page or documentation string (docstring) associated with that object or function.
    -   If no argument is provided, `help()` starts an interactive help session.
    -   It is particularly useful for learning about the usage and functionality of various Python features and libraries.

-   **dir()** Function:

    -   The `dir()` function returns a list of attributes and methods associated with an object.
    -   When you call `dir()` without any arguments, it returns a list of names in the current local scope.
    -   When you pass an object as an argument to `dir()`, it returns a list of valid attributes and methods for that object.

</details>

<details><summary style="font-size:18px;color:#C71585">What does <b>*args</b> and <b>**kwargs</b> mean?</summary>

</details>

---

<details><summary style="font-size:18px;color:#C71585">What is a dynamically typed language?</summary>

A dynamically typed language is a programming language where variable types are determined at runtime rather than at compile time. In dynamically typed languages, variables can hold values of any type, and their types can change during the execution of the program. This flexibility allows for more concise and flexible code, as programmers do not need to explicitly declare variable types. Examples of dynamically typed languages include Python, JavaScript, Ruby, and PHP. In contrast, statically typed languages require variable types to be explicitly declared and checked at compile time, which can catch certain types of errors earlier in the development process but may require more verbose code.

</details>

<details><summary style="font-size:18px;color:#C71585">What is an Interpreted language?</summary>

An interpreted language is a programming language where code is executed line by line by an interpreter at runtime, rather than being compiled into machine code before execution. In interpreted languages, the source code is directly executed by the interpreter without the need for an intermediate compilation step.
In interpreted languages like Python, source code is translated into intermediate code or bytecode, which is then executed by the interpreter at runtime.

</details>

<details><summary style="font-size:18px;color:#C71585">What is <b>pass</b> in Python?</summary>

In Python, **pass** is a null statement, which means it does nothing when executed. It is used as a placeholder when a statement is syntactically required, but no action needs to be performed.

The **pass** statement is often used in situations where the syntax requires a statement, but the program logic does not yet require any action to be taken.

</details>

<details><summary style="font-size:18px;color:#C71585">What is the difference between Python Arrays and lists?</summary>

The array module in Python provides an efficient way of working with arrays of homogeneous data types. Unlike Python lists, which can store elements of different data types, arrays in the array module are designed to store elements of a homogeneous data type, such as integers or floats. This makes them more memory-efficient for certain types of data.

```python
import array

a = array.array('i', [1, 2, 3]) # 'i' specifies the integer data type
```

```txt
class array(builtins.object)
    array(typecode [, initializer]) -> array

    Return a new array whose items are restricted by typecode, and
    initialized from the optional initializer value, which must be a list,
    string or iterable over elements of the appropriate type.

    Arrays represent basic values and behave very much like lists, except
    the type of objects stored in them is constrained. The type is specified
    at object creation time by using a type code, which is a single character.
    The following type codes are defined:

        Type code   C Type             Minimum size in bytes
        'b'         signed integer     1
        'B'         unsigned integer   1
        'u'         Unicode character  2 (see note)
        'h'         signed integer     2
        'H'         unsigned integer   2
        'i'         signed integer     2
        'I'         unsigned integer   2
        'l'         signed integer     4
        'L'         unsigned integer   4
        'q'         signed integer     8 (see note)
        'Q'         unsigned integer   8 (see note)
        'f'         floating point     4
        'd'         floating point     8

    NOTE: The 'u' typecode corresponds to Python's unicode character. On
    narrow builds this is 2-bytes on wide builds this is 4-bytes.

    NOTE: The 'q' and 'Q' type codes are only available if the platform
    C compiler used to build Python supports 'long long', or, on Windows,
    '__int64'.

    Methods:

    append() -- append a new item to the end of the array
    buffer_info() -- return information giving the current memory info
    byteswap() -- byteswap all the items of the array
    count() -- return number of occurrences of an object
    extend() -- extend array by appending multiple elements from an iterable
    fromfile() -- read items from a file object
    fromlist() -- append items from the list
    frombytes() -- append items from the string
    index() -- return index of first occurrence of an object
    insert() -- insert a new item into the array at a provided position
    pop() -- remove and return item (default last)
    remove() -- remove first occurrence of an object
    reverse() -- reverse the order of the items in the array
    tofile() -- write all items to a file object
    tolist() -- return the array converted to an ordinary list
    tobytes() -- return the array converted to a string
```

</details>

<details><summary style="font-size:18px;color:#C71585">What is PEP 8 and why is it important?</summary>

PEP 8 is a style guide for Python code written by Guido van Rossum, Barry Warsaw, and Nick Coghlan. PEP stands for Python Enhancement Proposal, and PEP 8 specifically addresses the coding conventions and style guidelines for writing Python code.

PEP 8, sometimes spelled PEP8 or PEP-8, stands for Python Enhancement Proposal 8. It's a style guide, not a strict rulebook, that provides recommendations for how to write clean and consistent Python code.

</details>

---

<details><summary style="font-size:18px;color:#C71585">Define GIL.</summary>

The GIL stands for Global Interpreter Lock. It is a mutex (or lock) that allows only one thread to execute Python bytecode at a time, even on multi-core systems. The presence of the GIL has significant implications for Python's concurrency model.Here are some key points about the GIL in Python:

-   **Single-threaded Python**: Despite Python's support for multiple threads, due to the GIL, only one thread can execute Python bytecode at a time. This means that Python threads cannot fully utilize multiple CPU cores for CPU-bound tasks.
-   **Designed for CPython**: The GIL is specific to the CPython interpreter, the most widely used implementation of Python. Other implementations, such as Jython and IronPython, do not have a GIL.
-   **Impact on CPU-bound tasks**: While the GIL allows Python to be thread-safe by preventing race conditions, it can hinder performance for CPU-bound tasks because it limits parallelism.
-   **Does not affect I/O-bound tasks**: For I/O-bound tasks (e.g., network I/O, disk I/O), where threads spend most of their time waiting for external resources, the GIL does not significantly impact performance because threads release the GIL while waiting.
-   **Alternatives for concurrency**: To achieve parallelism for CPU-bound tasks, developers can use multiprocessing, asynchronous I/O (e.g., asyncio), or extension modules written in languages like C or Cython that release the GIL for performance-critical operations.
-   **Discussion and debates**: The GIL has been a subject of much discussion and debate in the Python community. While it simplifies CPython's internal memory management and makes it easier to write C extensions, it also poses challenges for concurrency.

In summary, the GIL in Python restricts concurrent execution of Python bytecode by multiple threads in the CPython interpreter, which can impact performance for CPU-bound tasks. Developers must consider alternatives for achieving parallelism when dealing with such tasks.

</details>

<details><summary style="font-size:18px;color:#C71585">Define PYTHONPATH.</summary>
In the realm of Python, PYTHONPATH is an environment variable that acts as a roadmap for the Python interpreter when searching for modules (reusable blocks of code) during program execution. It essentially defines a list of directories where the interpreter should look for modules beyond the standard library locations.

-   **Understanding the Search Path**: When you import a module in your Python code (using import module_name), the interpreter follows a specific search path to locate it:

    -   `Current Directory`: The interpreter first checks the current working directory (the directory from where you execute your script) for the module.
    -   `Built-in Libraries`: If not found there, it searches for the module in the standard library locations, which are pre-installed directories containing Python's core modules.
    -   `PYTHONPATH Directories`: Finally, the interpreter consults the directories listed in the PYTHONPATH environment variable, searching for the module in each directory (in the order they appear in the path).

-   **Setting PYTHONPATH**: There are several ways to set PYTHONPATH:

    -   `System-wide`: You can modify system environment variables to set PYTHONPATH globally, but this approach is generally discouraged as it can affect other Python environments or users on the system.
    -   `User-specific`: Setting PYTHONPATH in your shell configuration files (e.g., .bashrc or .zshrc) can make it persistent for your user sessions.
    -   `Virtual Environments`: The recommended approach is to use virtual environments, which isolate project dependencies and avoid conflicts. Virtual environments often manage their own PYTHONPATH within the activated environment.
    -   `Command-line Argument`: You can temporarily set PYTHONPATH for a single script execution using the -I or --interactive flag with the Python interpreter: `$ python -I /path/to/custom/modules my_script.py`

</details>

<details><summary style="font-size:18px;color:#C71585">Define PIP</summary>

`PIP`: PIP is the package manager for Python. It's a command-line tool that allows you to easily install, uninstall, and manage additional software libraries (packages) for your Python projects.

In the context of Python, PIP doesn't actually have a specific official meaning as an acronym. It's considered a recursive acronym, meaning its meaning is derived from its function. Here are some common interpretations:

-   **Preferred Installer Program**
-   **Packages Installed from PyPI** (referencing the Python Package Index)
-   **Packages Install Packages**

</details>

<details><summary style="font-size:18px;color:#C71585">Differentiate between deep and shallow copies.</summary>

Deep and shallow copies are two ways of creating copies of objects in Python, particularly when dealing with complex data structures like lists, dictionaries, or custom objects containing nested objects. The difference lies in how the nested objects are handled during the copying process.

-   **Shallow Copy**:

    -   A shallow copy creates a new object but inserts references to the nested objects found in the original object.
    -   The top-level objects are copied, but the nested objects are shared between the original and copied objects.
    -   Changes to the nested objects in the copied structure will be reflected in the original structure, and vice versa.
    -   Shallow copies can be created using the `copy()` method or the copy module's `copy()` function.

    ```python
    import copy

    original_list = [1, [2, 3], 4]
    shallow_copy = copy.copy(original_list)

    shallow_copy[1][0] = 'a'  # Modify nested object in shallow copy
    print(original_list)  # Output: [1, ['a', 3], 4] - original list is affected
    ```

-   **Deep Copy**:

    -   A deep copy creates a new object and recursively copies all nested objects found in the original object.
    -   Both the top-level objects and all nested objects are copied, resulting in completely independent objects.
    -   Changes to the nested objects in the copied structure will not affect the original structure, and vice versa.
    -   Deep copies can be created using the `copy()` method or the copy module's `deepcopy()` function.

    ```python
    import copy

    original_list = [1, [2, 3], 4]
    deep_copy = copy.deepcopy(original_list)

    deep_copy[1][0] = 'a'  # Modify nested object in deep copy
    print(original_list)  # Output: [1, [2, 3], 4] - original list remains unchanged
    ```

</details>

<details><summary style="font-size:18px;color:#C71585">What is main function in python? How do you invoke it?</summary>

Unlike many other programming languages, Python doesn't have a mandatory main function that serves as the automatic entry point for your program. The interpreter executes code line by line, starting from the top-level statements in your Python source file (.py file).
However, there are well-established conventions for defining a starting point in Python for your program's execution, often mimicking the behavior of the main function found in other languages. Common Practices for Defining a Starting Point:

-   **Using a Top-Level Function**:

    -   Define a function at the top level of your script with a descriptive name like main or run.
    -   Place your program's core logic and functionalities within this function.
    -   Call this function at the end of your script to execute it.

    ```python
    def main():
        # Your program's logic here
        print("Hello, world!")

    if __name__ == "__main__":
        main()
    ```

-   **if \_\_name\_\_ == \"\_\_main\_\_\:"**

    -   This conditional block ensures the code within the block is only executed when the script is run directly (not when imported as a module).
    -   The **\_\_name\_\_** special variable holds the name of the current module. When the script is executed directly, **\_\_name\_\_** is set to "**\_\_main\_\_**".

    ```python
    # Your program's functions here

    if __name__ == "__main__":
        # Call your functions or execute the main logic here
        print("This code executes only when the script is run directly")
    ```

</details>

<details><summary style="font-size:18px;color:#C71585">What is the difference between Package and Module in Python?</summary>

In Python, the terms "module" and "package" refer to different concepts related to organizing and managing code. Here's a detailed explanation of the differences between them:

-   **Module**

    -   `Definition`: A module is a single file containing Python code. This file can define functions, classes, and variables, and can also include runnable code.
    -   `File Extension`: Modules are Python files with a .py extension.
    -   `Usage`: Modules are used to organize related code into a single file, making it easier to maintain and reuse.

-   **Package**

    -   `Definition`: A package is a collection of related modules organized in a directory hierarchy. A package must contain a special file named **init**.py, which can be empty, but its presence signals to Python that the directory should be treated as a package.
    -   `Directory Structure`: A package is a directory that contains a set of modules and sub-packages. Each directory within the package must have an **init**.py file.
    -   `Usage`: Packages are used to organize and manage larger collections of modules. They help in structuring your project logically.

</details>

<details><summary style="font-size:18px;color:#C71585">What are some of the most commonly used built-in modules in Python?</summary>

-   `os`: This module provides functions for interacting with the operating system, such as creating files and directories, managing file paths, and running external commands.
-   `sys`: This module provides access to system parameters and functions, such as command-line arguments, standard streams (stdin, stdout, stderr), and platform information.
-   `math`: This module provides mathematical functions, constants, and classes, such as trigonometric functions, logarithms, and mathematical constants like pi and e.
-   `datetime`: This module provides classes and functions for working with dates and times, including creating date and time objects, formatting them, and performing arithmetic operations on them.
-   `random`: This module provides functions for generating random numbers, shuffling sequences, and selecting random elements from a list.
-   `collections`: This module provides powerful container data types like namedtuple, deque, Counter, and OrderedDict that extend the functionality of built-in lists, dictionaries, and tuples.
-   `re`: This module provides regular expression support for searching, matching, and manipulating text strings.
-   `json`: This module provides functions for encoding and decoding JSON (JavaScript Object Notation) data, which is a popular format for data interchange between applications.
-   `itertools`: This module provides functions for creating iterators and working with iterables, such as generating combinations, permutations, and filtering elements.
-   `subprocess`: This module provides functions for spawning new processes and managing their execution.

</details>

<details><summary style="font-size:18px;color:#C71585">What are the differences between pickling and unpickling?</summary>

</details>

<details><summary style="font-size:18px;color:#C71585">List out the tools for identifying bugs and performing static analysis in python?</summary>

There are several tools available for identifying bugs and performing static analysis in Python. These tools help ensure code quality, detect potential issues, and enforce coding standards. Here are some of the most popular ones:

Bug Identification and Static Analysis Tools

-   **Pylint**: Pylint is a static code analysis tool that checks for programming errors, enforces a coding standard, and looks for code smells.

    -   Usage: `$ pylint my_module.py`

-   **Flake8**: Flake8 is a wrapper around PyFlakes, pycodestyle, and Ned Batchelder's McCabe script. It checks the style and quality of Python code.

    -   Usage: `$ flake8 my_module.py`

-   **PyLint**: PyLint analyzes code for potential errors and enforces coding standards. It is highly configurable and can be integrated into various development environments.

    -   Usage: `$ pylint my_module.py`

-   **Pyflakes**: Pyflakes analyzes programs and detects various errors. It is focused on finding errors quickly without bothering with style issues.

    -   Usage: `$ pyflakes my_module.py`

-   **Mypy**: Mypy is a static type checker for Python. It helps catch type-related errors in your code by checking type hints.

    -   Usage: `$ mypy my_module.py`

-   **Bandit**: Bandit is a tool designed to find common security issues in Python code. It scans code for known vulnerabilities.

    -   Usage: `$ bandit -r my_project/`

-   **Pyright**: Pyright is a fast type checker for Python, designed to work with VS Code and other editors that support the Language Server Protocol (LSP).

    -   Usage: `$ pyright my_module.py`

-   **Prospector**: Prospector is a tool to analyze Python code and output information about errors, potential problems, convention violations, and complexity. It aggregates results from multiple analysis tools.

    -   Usage: `$ prospector`

-   **Pydocstyle**: Pydocstyle checks compliance with Python docstring conventions. It can ensure that docstrings are present and correctly formatted.

    -   Usage: `$ pydocstyle my_module.py`

-   **Radon**: Radon is a tool for computing various metrics from the source code, including cyclomatic complexity, raw metrics, and maintainability index.

    -   Usage: `$ radon cc my_module.py`

-   **Vulture**: Vulture finds unused code in Python programs. This can help identify dead code that can be removed to improve maintainability.

    -   Usage: `$ vulture my_module.py`

-   **Integrated Development Environment (IDE) Support**
    Many of these tools are supported by popular IDEs such as PyCharm, Visual Studio Code, and others. They can be configured to run automatically as part of the development process, providing real-time feedback and integration into continuous integration (CI) pipelines.

-   **Example of Combining Tools in a CI Pipeline**
    Combining multiple tools can provide comprehensive coverage. For example, you might set up a CI pipeline with tools like Flake8 for style checks, Mypy for type checks, and Bandit for security checks.

    Here’s an example of how you might configure a .travis.yml file for a Travis CI pipeline:

    ```yaml
    language: python
    python:
        - "3.8"
    install:
        - pip install flake8 mypy bandit
    script:
        - flake8 my_module.py
        - mypy my_module.py
        - bandit -r my_project/
    ```

This setup will run Flake8, Mypy, and Bandit checks on every commit, helping ensure that code quality is maintained throughout the development process.

</details>

---

<details><summary style="font-size:18px;color:#C71585">How is memory managed in Python?</summary>

Memory management in Python is automatic and primarily handled by the Python memory manager, which is responsible for allocating and deallocating memory for objects. As a programmer, you don't need to manually allocate or deallocate memory for objects in your code.

The garbage collector is a core component of this memory management system.

Garbage collection is an automated memory management mechanism and a crucial component of the memory manager in Python 3. It automatically identifies and reclaims memory occupied by objects that are no longer referenced by your program, preventing memory leaks and ensuring efficient memory utilization.

Python's garbage collector is not deterministic. The exact timing of garbage collection cycles can vary depending on memory usage and other factors.

-   **How Garbage Collection Works**: The Python interpreter periodically runs a garbage collection in the background. In CPython, the most popular Python implementation, the Garbage Collection relies on two technique called Reference Counting and Cyclic Refferences to identify the garbages. Here's a breakdown of the process:

    -   `Reference Counting`:

        -   Whenever you create an object in Python, a reference count on the memory Heap initialized to 1 and it keeps track of how many different times that object are refferenced in your program.
        -   When you assign an object to a variable or pass it as an argument to a function, the reference count is incremented by 1, signifying another reference to the object exists.
        -   Conversely, when a variable referencing an object goes out of scope (e.g., the function containing the variable finishes execution), or you explicitly delete a reference (using del), the reference count is decremented by 1.
        -   During the pariodic run of garbage collection, it identifies objects with a reference count of 0. These objects are considered unreachable as there are no active references to them in your program.

    -   `Cyclic References`: Reference counting can't handle cyclic references, where two or more objects reference each other indefinitely. Even though no code directly references these objects anymore, their reference counts remain above 0, preventing garbage collection. The cyclic garbage collection addresses a the limitation.

        -   `Detection`: Python's cyclic garbage collector employs a more sophisticated approach to identify unreachable objects, even if they're involved in circular references.
        -   `Marking Phase`: The collector traverses the memory space, starting from root objects (objects directly accessible from your program's global scope or persistent references like open files). It marks reachable objects as it goes.
        -   `Reachability Check`: Once the marking phase is complete, objects that remain unmarked are considered unreachable, even if their reference count might be non-zero due to circular references.
        -   `Collection`: These unmarked objects are then candidates for garbage collection, and their memory is reclaimed.

    -   `Memory Reclamation`: Once an object is identified as unreachable, the garbage collector reclaims the memory occupied by that object, making it available for future object allocations.

#### Heap Space in Python

In Python, the "heap" generally refers to the private heap space managed by the Python memory manager. This is where Python objects are allocated and managed during program execution. Understanding the Python heap is crucial for understanding memory management in Python. Here's a detailed explanation:

-   `Dynamic Memory Allocation`: In Python, memory allocation is dynamic, meaning that memory for objects is allocated as needed during program execution. When you create a new object, such as a variable, list, or class instance, Python allocates memory for that object on the heap.
-   `Reference Counting`: Python uses a technique called reference counting to manage memory. Each object on the heap has a reference count, which tracks how many references (pointers) exist to that object. When an object's reference count drops to zero, meaning there are no more references to it, the memory occupied by the object is reclaimed.
-   `Garbage Collection`: In addition to reference counting, Python also employs a garbage collector to reclaim memory for objects with cyclic references or when reference counting alone is insufficient. The garbage collector periodically scans the heap to identify and reclaim unreachable objects, freeing up memory for reuse.
-   `Memory Fragmentation`: As objects are allocated and deallocated on the heap, memory fragmentation can occur. This is when the heap becomes fragmented with small chunks of memory scattered throughout, making it challenging to allocate contiguous blocks of memory for new objects. Python's memory manager includes mechanisms to address fragmentation and optimize memory allocation.
-   `Global vs. Per-Thread Heap`: Python's memory manager maintains separate heaps for global objects and per-thread objects. Global objects are accessible from any thread in the program and are stored in the global heap. Per-thread objects, such as thread-local variables, are stored in per-thread heaps, which are managed separately.
-   `Memory Profiling and Optimization`: Understanding how memory is allocated and managed on the heap is essential for optimizing memory usage and performance in Python programs. Techniques such as memory profiling, identifying memory leaks, minimizing object creation, and optimizing data structures can help improve memory efficiency and performance.
-   `C Extensions and Memory Management`: When working with C extensions or interacting with external libraries, it's important to be mindful of memory management. Python's memory management system may interact with memory management mechanisms in C code, and improper memory management can lead to memory leaks or undefined behavior.

</details>

<details><summary style="font-size:18px;color:#C71585">What is garbage collection? How it works in Python?</summary>

Garbage collection is an automated memory management mechanism and a crucial component of the memory manager in Python 3. It automatically identifies and reclaims memory occupied by objects that are no longer referenced by your program, preventing memory leaks and ensuring efficient memory utilization.

Python's garbage collector is not deterministic. The exact timing of garbage collection cycles can vary depending on memory usage and other factors.

-   **How Garbage Collection Works**: The Python interpreter periodically runs a garbage collection in the background. In CPython, the most popular Python implementation, the Garbage Collection relies on two technique called Reference Counting and Cyclic Refferences to identify the garbages. Here's a breakdown of the process:

    -   `Reference Counting`:

        -   Whenever you create an object in Python, a reference count on the memory Heap initialized to 1 and it keeps track of how many different times that object are refferenced in your program.
        -   When you assign an object to a variable or pass it as an argument to a function, the reference count is incremented by 1, signifying another reference to the object exists.
        -   Conversely, when a variable referencing an object goes out of scope (e.g., the function containing the variable finishes execution), or you explicitly delete a reference (using del), the reference count is decremented by 1.
        -   During the pariodic run of garbage collection, it identifies objects with a reference count of 0. These objects are considered unreachable as there are no active references to them in your program.

    -   `Cyclic References`: Reference counting can't handle cyclic references, where two or more objects reference each other indefinitely. Even though no code directly references these objects anymore, their reference counts remain above 0, preventing garbage collection. The cyclic garbage collection addresses a the limitation.

        -   `Detection`: Python's cyclic garbage collector employs a more sophisticated approach to identify unreachable objects, even if they're involved in circular references.
        -   `Marking Phase`: The collector traverses the memory space, starting from root objects (objects directly accessible from your program's global scope or persistent references like open files). It marks reachable objects as it goes.
        -   `Reachability Check`: Once the marking phase is complete, objects that remain unmarked are considered unreachable, even if their reference count might be non-zero due to circular references.
        -   `Collection`: These unmarked objects are then candidates for garbage collection, and their memory is reclaimed.

    -   `Memory Reclamation`: Once an object is identified as unreachable, the garbage collector reclaims the memory occupied by that object, making it available for future object allocations.

#### Core API functions to work upon the garbage collection in Python?

Python provides several core API functions and modules for working with garbage collection, allowing you to control and manage the process of reclaiming memory occupied by objects that are no longer referenced. Here are some of the core API functions and modules related to garbage collection in Python:

-   **gc Module**: The gc module provides a high-level interface to Python's garbage collection mechanism. It includes functions for manual garbage collection control, as well as utilities for inspecting the garbage collector's behavior and statistics.
    -   `gc.collect([generation])`: Manually triggers garbage collection. By default, it collects all generations, but you can specify a generation to collect (0 for the youngest generation, 2 for the oldest).
    -   `gc.get_count()`: Returns a tuple containing the current collection counts for each generation. These counts represent the number of objects that have been allocated since the last collection.
    -   `gc.get_stats()`: Returns a list of dictionaries containing information about the garbage collector's behavior and statistics, including the number of collections, memory usage, and more.
    -   `gc.set_debug(flags)`: Enables or disables debugging output from the garbage collector. The flags argument is a bitmask representing the debugging options to enable.
    -   `gc.get_objects()`: Returns a list of all objects tracked by the garbage collector. This can be useful for debugging and profiling purposes, but it's not recommended for general use due to potential performance overhead.
    -   `gc.get_referents(obj)`: Returns a list of objects that directly reference the given object obj. This function can be used to inspect the references to a specific object in the heap.
    -   `gc.get_referrers(obj)`: Returns a list of objects that directly reference the given object obj. This function can be used to inspect the objects that reference a specific object in the heap.
-   **sys** Module: The `sys` module provides access to system-specific parameters and functions, including functions related to memory management. For example, `sys.getsizeof()` can be used to determine the size of an object in memory, and `sys.getrefcount()` can be used to get the reference count of an object.
-   **resource** Module: On Unix-based systems, the `resource` module provides functions for querying and modifying system resource limits, including memory limits. Functions like `resource.getrusage()` can be used to get information about resource usage, including memory usage.
-   **tracemalloc** Module: The `tracemalloc` module allows tracing memory allocations and retrieving information about memory blocks allocated by Python. Functions like `tracemalloc.start()` and `tracemalloc.stop()` can be used to start and stop tracing, and `tracemalloc.get_traced_memory()` can be used to retrieve information about traced memory allocations.

In summary, garbage collection in Python is an essential feature that helps manage memory automatically. Understanding how it works can be beneficial for writing memory-efficient Python code and avoiding potential memory-related issues. However, it's generally not necessary to directly interfere with the garbage collector. Focus on writing clean code and avoiding unnecessary object references for optimal performance.

</details>

<details><summary style="font-size:18px;color:#C71585">What is Memory Leaks in Python?</summary>

A Memory Leak is a situation where objects that are no longer needed by your program are not properly deallocated by the garbage collector. This can lead to a gradual increase in memory usage over time, potentially impacting your program's performance or even causing crashes. This can eventually cause the program to consume all available memory, resulting in slow performance or crashes. Memory leaks are often caused by references to objects that are no longer needed but cannot be freed by the garbage collector because references to them still exist.

-   **Causes of Memory Leaks**:

    -   `Lingering References`: Objects that are no longer needed but still referenced somewhere in the code, such as in global variables, closures, or data structures.
    -   `Circular References`: A situation where two or more objects reference each other, preventing the garbage collector from deallocating them. Although Python's garbage collector can handle simple circular references, complex ones can still cause issues.
    -   `Caching`: Keeping unnecessary references in caches that grow indefinitely, such as lists, dictionaries, or custom caching mechanisms.
    -   `Incorrect Use of Data Structures`: Data structures that hold references to objects that are no longer needed, such as lists or dictionaries where old entries are not properly removed.

-   **Preventing Memory Leaks**:

    -   `Break Circular References`: Refactor code to avoid objects referencing each other indefinitely. Consider using weak references or setting references to None when objects are no longer needed.
    -   `Close Resources Properly`: Ensure you close external resources like files, network connections, and databases using close() or context managers like with.
    -   `Implement Caching Strategies`: Establish clear policies for cache invalidation or eviction to prevent them from holding onto unnecessary data.
    -   `Be Cautious with Global Variables`: Limit the use of global variables and consider alternatives like dependency injection or class attributes if appropriate.

</details>

<details><summary style="font-size:18px;color:#C71585">What is Weak Reference in Python?</summary>

In Python, a weak reference is a special type of reference that doesn't prevent an object from being garbage collected. It allows you to hold a reference to an object without artificially increasing its reference count.

-   **Regular References and Garbage Collection**

    -   When you create an object in Python, the interpreter keeps track of how many variables (references) point to it using a reference count.
    -   As long as the reference count is greater than zero, the object remains in memory, even if your code doesn't explicitly use it anymore.
    -   The garbage collector only reclaims objects with a reference count of zero.

-   **Weak References: No Impact on Garbage Collection**

    -   A weak reference holds a reference to an object, but it doesn't contribute to its reference count.
    -   This means that even if the only reference to an object is a weak reference, the garbage collector can still reclaim the object's memory when it's no longer needed by your program.

-   **Creating Weak References**: The weakref module provides functions for creating different types of weak references:

    -   `weakref.proxy`: Creates a proxy object that behaves like the original object but allows the original object to be garbage collected.
    -   `weakref.ref`: Creates a weak reference object that holds a reference to the original object but doesn't provide access to it directly.

    ```python
    from weakref import WeakKeyDictionary

    class ExpensiveObject:
        # ... (represents a large object)

    class Cache:
        def __init__(self):
            self.cache = WeakKeyDictionary()  # Use WeakKeyDictionary for weak references to keys

        def get(self, key):
            return self.cache.get(key)

        def set(self, key, value):
            self.cache[key] = value

    # Usage
    cache = Cache()
    obj = ExpensiveObject()
    cache.set(obj, "data")

    # If 'obj' is no longer referenced elsewhere, it can be garbage collected
    # even though it's still in the cache (weak reference)
    ```

</details>

<details><summary style="font-size:18px;color:#C71585">What is Python's memory management system?</summary>

Answer: Python's memory management system involves a private heap containing all Python objects and data structures. The management of this private heap is ensured internally by the Python memory manager. The core API provides access to some tools for the programmer to code and manage memory. Python uses automatic memory management, which includes reference counting and garbage collection.

</details>

<details><summary style="font-size:18px;color:#C71585">What is reference counting in Python?</summary>

Answer: Reference counting is a memory management technique where each object maintains a count of references to it. When the reference count drops to zero, the object is deallocated. Python uses reference counting as one of its methods for memory management.

</details>

<details><summary style="font-size:18px;color:#C71585">What is garbage collection in Python?</summary>

Answer: Garbage collection is a mechanism to reclaim memory occupied by objects that are no longer in use by the program. In Python, garbage collection complements reference counting by handling cyclic references (objects referencing each other) that reference counting alone cannot clean up. Python's garbage collector is part of the gc module.

</details>

<details><summary style="font-size:18px;color:#C71585">How does Python's garbage collector handle cyclic references?</summary>

Answer: Python's garbage collector identifies cyclic references by using a graph traversal algorithm. When it detects objects that reference each other but are not reachable from any active scope, it collects and deallocates them to free up memory.

</details>

<details><summary style="font-size:18px;color:#C71585">What are some common strategies to manage memory usage in Python?</summary>

Answer:

-   `Minimize global variables`: They persist for the lifetime of the program, consuming memory.
-   `Use local variables`: Local variables are cleaned up after the function call ends.
-   `Weak references`: Use the weakref module to create references that do not increase the reference count.
-   `Del keyword`: Use del to manually remove references to objects.
-   `Custom data structures`: Use more memory-efficient data structures like array instead of lists when dealing with large datasets.

</details>

<details><summary style="font-size:18px;color:#C71585">What is the role of the `__del__` method in memory management?</summary>

Answer: The `__del__` method in Python is a special method that acts as a destructor. It is called when an object's reference count reaches zero, right before the object is deallocated. It's generally used for cleanup actions like closing files or releasing network resources. However, reliance on `__del__` is discouraged due to potential issues with reference cycles and the timing of its invocation.

</details>

<details><summary style="font-size:18px;color:#C71585">How can you manually trigger garbage collection in Python?</summary>

Answer: You can manually trigger garbage collection using the gc module:

```python
import gc
gc.collect()
```

</details>

<details><summary style="font-size:18px;color:#C71585">How can you profile memory usage in a Python program?</summary>

Answer: You can profile memory usage using tools like memory_profiler and tracemalloc. Here’s an example with memory_profiler:

```python
from memory_profiler import profile

@profile
def my_function():
    # Your code here
    pass

if __name__ == "__main__":
    my_function()
```

</details>

<details><summary style="font-size:18px;color:#C71585">What is tracemalloc, and how is it used?</summary>

Answer: tracemalloc is a module in Python's standard library for tracing memory allocations. It helps you understand memory usage and track memory leaks. Here’s how you can use it:

```python
import tracemalloc

tracemalloc.start()

# Your code here

snapshot = tracemalloc.take_snapshot()
top_stats = snapshot.statistics('lineno')

for stat in top_stats[:10]:
    print(stat)
```

</details>

<details><summary style="font-size:18px;color:#C71585">What are weak references and when would you use them?</summary>

Answer: Weak references allow you to reference an object without increasing its reference count. This can be useful in caching mechanisms where you want to allow objects to be garbage-collected if they are no longer in use elsewhere in the program. The weakref module provides support for weak references.

```python
import weakref

class MyClass:
    pass

obj = MyClass()
weak_ref = weakref.ref(obj)

print(weak_ref())  # Outputs: <__main__.MyClass object at 0x...>
del obj
print(weak_ref())  # Outputs: None
```

</details>

<details><summary style="font-size:18px;color:#C71585">Explain memory fragmentation and how Python handles it.</summary>

Answer: Memory fragmentation occurs when free memory is split into small blocks and scattered throughout the heap, making it difficult to allocate large contiguous blocks of memory. Python mitigates memory fragmentation through its memory allocator, which uses pools of fixed-size blocks to manage small objects and reduces fragmentation by allocating larger objects directly from the system heap.

</details>

<details><summary style="font-size:18px;color:#C71585">What is the role of sys.getsizeof() in Python?</summary>

Answer: sys.getsizeof() returns the size of an object in bytes. This can be useful for understanding the memory footprint of an object.

```python
import sys

my_list = [1, 2, 3]
print(sys.getsizeof(my_list))  # Outputs the size of the list object in bytes
```

</details>

---

<details><summary style="font-size:18px;color:#C71585">Define Concurrency and Parallelism. How do they differ?</summary>

Concurrency is the ability of a program to make progress on multiple tasks simultaneously, usually by interleaving their execution. Parallelism, on the other hand, is the ability to execute multiple tasks simultaneously, typically on multiple processors or cores.

</details>

<details><summary style="font-size:18px;color:#C71585">Explain how Python handles concurrency. What modules or constructs are commonly used?</summary>

Python handles concurrency through threading, asyncio, and multiprocessing. Commonly used modules include threading for threads, asyncio for asynchronous I/O, and multiprocessing for parallel processes.

</details>

<details><summary style="font-size:18px;color:#C71585">What is the Global Interpreter Lock (GIL) in Python? How does it affect concurrency and parallelism?</summary>

The GIL is a mutex that protects access to Python objects, preventing multiple threads from executing Python bytecodes simultaneously in a single process. It affects concurrency by making multi-threaded programs effectively single-threaded in terms of CPU-bound tasks. For parallelism, Python's multiprocessing module can be used to bypass the GIL by using separate processes.

</details>

<details><summary style="font-size:18px;color:#C71585">How does the threading module work in Python? Provide a simple example.</summary>

The threading module provides a way to create and manage threads. Here's a simple example:

```python
import threading

def print_numbers():
    for i in range(5):
        print(i)

thread = threading.Thread(target=print_numbers)
thread.start()
thread.join()
```

</details>

<details><summary style="font-size:18px;color:#C71585">Discuss the limitations of using threads for parallelism in Python.</summary>

Due to the GIL, threads in Python cannot achieve true parallelism for CPU-bound tasks. They are better suited for I/O-bound tasks where the GIL is released during I/O operations.

</details>

<details><summary style="font-size:18px;color:#C71585">What is asyncio in Python, and how does it enable concurrency?</summary>

asyncio is a library to write concurrent code using the async/await syntax. It is suitable for I/O-bound and high-level structured network code. It enables concurrency by running coroutines in an event loop, allowing tasks to be paused and resumed efficiently.
Provide a simple example of an asyncio coroutine.

Answer:

```python
import asyncio

async def say_hello():
    await asyncio.sleep(1)
    print("Hello")

asyncio.run(say_hello())
```

</details>

<details><summary style="font-size:18px;color:#C71585">Explain the difference between asyncio coroutines and threads.</summary>

asyncio coroutines are cooperative, meaning they yield control to the event loop, allowing other tasks to run. Threads are preemptive, meaning the operating system can interrupt them at any time to switch execution to another thread. Coroutines are more lightweight than threads and can provide better performance for I/O-bound tasks.

</details>

<details><summary style="font-size:18px;color:#C71585">How does the multiprocessing module achieve parallelism in Python?</summary>

The multiprocessing module creates separate processes, each with its own Python interpreter and memory space, allowing true parallelism by leveraging multiple CPU cores. This bypasses the GIL, making it suitable for CPU-bound tasks.
Provide a simple example using the multiprocessing module.

Answer:

```python
from multiprocessing import Process

def print_numbers():
    for i in range(5):
        print(i)

process = Process(target=print_numbers)
process.start()
process.join()
```

</details>

<details><summary style="font-size:18px;color:#C71585">What are some common pitfalls when using concurrency and parallelism in Python?</summary>

Common pitfalls include race conditions, deadlocks, and the impact of the GIL. Developers need to ensure proper synchronization when using threads and be aware of the overhead of inter-process communication when using multiple processes.

</details>

<details><summary style="font-size:18px;color:#C71585">How can you mitigate the impact of the GIL for CPU-bound tasks in Python?</summary>

For CPU-bound tasks, you can use the multiprocessing module to create separate processes. Alternatively, using libraries like numba or cython to optimize performance-critical sections of code can also help mitigate the impact of the GIL.

</details>

<details><summary style="font-size:18px;color:#C71585">Describe a scenario where asyncio is more appropriate than threading or multiprocessing.</summary>

asyncio is more appropriate for I/O-bound tasks that involve waiting for network or disk I/O, such as web scraping, handling multiple web requests in a web server, or performing asynchronous file operations. It is less suitable for CPU-bound tasks which benefit more from parallelism provided by multiprocessing.

</details>

<details><summary style="font-size:18px;color:#C71585">How do you handle exceptions in asyncio coroutines?</summary>

Exceptions in asyncio coroutines can be handled using try/except blocks within the coroutine. Additionally, when using tasks, you can attach an exception handler or check for exceptions after the task completes.

```python
import asyncio

async def faulty_coroutine():
    raise ValueError("An error occurred")

async def main():
    try:
        await faulty_coroutine()
    except ValueError as e:
        print(f"Caught an exception: {e}")

asyncio.run(main())
```

</details>

---

#### OOP

<details><summary style="font-size:18px;color:#C71585">What is metaclass in Python?</summary>
A metaclass is a class of a class that defines how a class behaves. Just as a class defines how instances of the class behave, a metaclass defines how classes themselves behave. Metaclasses are an advanced and powerful feature in Python that can be used to customize class creation.
You define a metaclass by inheriting from type and can override methods like `__new__` and `__init__`.

**Customizing Class Creation**: By using metaclasses, you can control several aspects of class creation. It can be used to enforce class invariants, modify class attributes, implement singletons, track class registration, and more.

-   `Modifying Class Attributes`: You can modify or add class attributes during class creation.
-   `Validating Class Definitions`: You can enforce rules on how classes should be defined. For example, ensuring certain methods or attributes are present.
-   `Class Registry`: You can automatically register classes in some registry for later use or tracking.

**Example**: Enforcing Attribute Presence

```python
class AttributeEnforcer(type):
    def __new__(cls, name, bases, dct):
        print("Creating class:", name)
        dct['created_by'] = 'AttributeEnforcer'
        if 'required_attribute' not in dct:
            raise TypeError(f"{name} is missing the required 'required_attribute' attribute")
        return super().__new__(cls, name, bases, dct)

# Use the metaclass to create a new class
class MyClassEnforced(metaclass=AttributeEnforcer):
    required_attribute = "This is required"

# This will raise an error
class MyInvalidClass(metaclass=AttributeEnforcer):
    pass  # Missing 'required_attribute'
```

**Dynamic Class Creation**:

```python
# Step 1: Define the class name, base classes, and attributes/methods
class_name = "Person"
base_classes = (object,)  # Using `object` as the base class

# Define the class attributes and methods, including __init__
class_attributes = {
    '__init__': lambda self, name, age: setattr(self, 'name', name) or setattr(self, 'age', age),
    'greet': lambda self: f'Hello, my name is {self.name} and I am {self.age} years old.'
}

# Step 2: Create the class dynamically using `type()`
Person = type(class_name, base_classes, class_attributes)

# Step 3: Instantiate the class and access attributes/methods
person_instance = Person("Alice", 30)
```

</details>

<details><summary style="font-size:18px;color:#C71585">How do you access parent members in the child class?</summary>

In Python, you can access members (attributes and methods) of the parent class from a child class using the super() function or by directly referencing the parent class name. Here's how you can do it:

**Using super()**: The `super()` function returns a proxy object that allows you to access methods and attributes of the parent class. You can use it to call the parent class constructor (**init**) or any other method.

```python
Copy code
class Parent:
    def __init__(self, name):
        self.name = name

class Child(Parent):
    def __init__(self, name, age):
        super().__init__(name)  # Call parent class constructor
        self.age = age

child = Child("Alice", 10)
print(child.name)  # Accessing parent attribute
```

**Using Dot Notation:**: You can also directly reference the parent class name to access its members using dot notation.

```python
Copy code
class Parent:
    def __init__(self, name):
        self.name = name

class Child(Parent):
    def __init__(self, name, age):
        Parent.__init__(self, name)  # Call parent class constructor
        self.age = age

child = Child("Alice", 10)
print(child.name)  # Accessing parent attribute
```

Both approaches achieve the same result, but using super() is preferred as it provides a more flexible and maintainable way to access parent class members, especially in cases of multiple inheritance.

</details>

<details><summary style="font-size:18px;color:#C71585">Is it possible to call parent class without its instance creation in Python?</summary>

Yes, it is possible to call a parent class method without creating an instance of the parent class in Python. This can be achieved using the following methods:

-   **Using the class name directly**: If you need to call a class method or a static method from the parent class, you can do so by using the class name directly.

-   Using **super()**: If you are within an instance method of a subclass, you can use super() to call methods from the parent class.

-   **Example with Class Methods and Static Methods**

    Here's an example that demonstrates how to call class methods and static methods from a parent class without creating an instance of the parent class:

    ```python
    class Parent:
        @classmethod
        def class_method(cls):
            print(f"Class method called from {cls.__name__}")

        @staticmethod
        def static_method():
            print("Static method called from Parent")

    class Child(Parent):
        pass

    # Calling the class method and static method from the parent class directly
    Parent.class_method()  # Output: Class method called from Parent
    Parent.static_method()  # Output: Static method called from Parent

    # Calling the class method and static method from the parent class using the subclass
    Child.class_method()  # Output: Class method called from Child
    Child.static_method()  # Output: Static method called from Parent
    ```

-   **Example with Instance Methods Using super()**

    If you are within an instance method of a subclass and want to call an instance method from the parent class, you can use super():

    ```python
    class Parent:
        def instance_method(self):
            print("Instance method called from Parent")

    class Child(Parent):
        def instance_method(self):
            print("Instance method called from Child")
            super().instance_method()  # Calls the instance method from the parent class

    # Creating an instance of Child and calling the instance method
    child_instance = Child()
    child_instance.instance_method()
    # Output:
    # Instance method called from Child
    # Instance method called from Parent
    ```

-   **Example with Class Methods Using super()**

    If you are within a class method of a subclass and want to call a class method from the parent class, you can use super():

    ```python
    class Parent:
        @classmethod
        def class_method(cls):
            print(f"Class method called from {cls.__name__}")

    class Child(Parent):
        @classmethod
        def class_method(cls):
            print(f"Class method called from {cls.__name__} (Child)")
            super().class_method()  # Calls the class method from the parent class

    # Calling the class method from the Child class
    Child.class_method()
    # Output:
    # Class method called from Child (Child)
    # Class method called from Child
    ```

**Summary**:

-   `Class Methods and Static Methods`: Can be called using the class name directly.
-   `Instance Methods`: Within an instance method of a subclass, use super() to call instance methods of the parent class.
-   `Class Methods`: Within a class method of a subclass, use super() to call class methods of the parent class.

</details>

<details><summary style="font-size:18px;color:#C71585">Explain different types of inheritance in Python</summary>

inheritance is a mechanism that allows a class (called the subclass or derived class) to inherit properties and behavior from another class (called the superclass or base class). There are different types of inheritance supported in Python:

-   **Single Inheritance**:

    -   In single inheritance, a subclass inherits from only one superclass.
    -   It forms a one-to-one parent-child relationship between classes.

    -   Example:

        ```python
        class Parent:
            def parent_method(self):
                print("Parent method")

        class Child(Parent):
            def child_method(self):
                print("Child method")

        child = Child()
        child.parent_method()  # Output: Parent method
        child.child_method()   # Output: Child method
        ```

-   **Multiple Inheritance**:

    -   In multiple inheritance, a subclass inherits from more than one superclass.
    -   It allows a subclass to inherit properties and behavior from multiple parent classes.

    -   Example:

        ```python
        class Parent1:
            def parent1_method(self):
                print("Parent 1 method")

        class Parent2:
            def parent2_method(self):
                print("Parent 2 method")

        class Child(Parent1, Parent2):
            def child_method(self):
                print("Child method")

        child = Child()
        child.parent1_method()  # Output: Parent 1 method
        child.parent2_method()  # Output: Parent 2 method
        child.child_method()    # Output: Child method
        ```

-   **Multilevel Inheritance**:

    -   In multilevel inheritance, a subclass inherits from a superclass, and another subclass inherits from the subclass.
    -   It forms a chain of inheritance.

    -   Example:

        ```python
        class GrandParent:
            def grandparent_method(self):
                print("Grandparent method")

        class Parent(GrandParent):
            def parent_method(self):
                print("Parent method")

        class Child(Parent):
            def child_method(self):
                print("Child method")

        child = Child()
        child.grandparent_method()  # Output: Grandparent method
        child.parent_method()       # Output: Parent method
        child.child_method()        # Output: Child method
        ```

-   **Hierarchical Inheritance**:

    -   In hierarchical inheritance, multiple subclasses inherit from the same superclass.
    -   It forms a tree-like structure.

    -   Example:

        ```python
        class Parent:
            def parent_method(self):
                print("Parent method")

        class Child1(Parent):
            def child1_method(self):
                print("Child 1 method")

        class Child2(Parent):
            def child2_method(self):
                print("Child 2 method")

        child1 = Child1()
        child1.parent_method()   # Output: Parent method
        child1.child1_method()   # Output: Child 1 method

        child2 = Child2()
        child2.parent_method()   # Output: Parent method
        child2.child2_method()   # Output: Child 2 method
        ```

-   **Hybrid Inheritance**:

    -   Hybrid inheritance is a combination of multiple inheritance and other types of inheritance.
    -   It can involve a mix of single, multiple, multilevel, or hierarchical inheritance.

    -   Example:

        ```python
        class A:
            def method_a(self):
                print("Method A")

        class B(A):
            def method_b(self):
                print("Method B")

        class C(A):
            def method_c(self):
                print("Method C")

        class D(B, C):
            def method_d(self):
                print("Method D")

        obj = D()
        obj.method_a()  # Output: Method A
        obj.method_b()  # Output: Method B
        obj.method_c()  # Output: Method C
        obj.method_d()  # Output: Method D
        ```

</details>

<details><summary style="font-size:18px;color:#C71585">Differentiate between new and override modifiers.</summary>

In Python, there are no explicit "new" or "override" modifiers like in some other languages such as Java. However, in the context of object-oriented programming, we can discuss concepts similar to "new" and "override" in Python:

-   **Overriding**:

    -   In Python, overriding refers to the ability to define a method in a subclass that has the same name as a method in its superclass.
    -   When a method is called on an instance of the subclass, Python looks for the method in the subclass first. If it's not found, it looks for the method in the superclass.
    -   If the method is found in the subclass, it overrides the method with the same name in the superclass. This allows subclasses to provide specialized implementations of methods inherited from the superclass.

-   **New Method**:

    -   In Python, there's no direct equivalent of the "new" modifier as seen in languages like Java.
    -   However, you can define a method with the same name as an existing method in the superclass. This doesn't override the existing method; instead, it creates a new method with the same name in the subclass.
    -   This effectively hides the method from the superclass, but the superclass's method remains intact and can still be accessed through instances of the superclass.

</details>

<details><summary style="font-size:18px;color:#C71585">What is `__init__()` method in python?</summary>

</details>

<details><summary style="font-size:18px;color:#C71585">How is an empty class created in python?</summary>

</details>

<details><summary style="font-size:18px;color:#C71585">How does inheritance work in python? Explain it with an example.</summary>

</details>

<details><summary style="font-size:18px;color:#C71585">Are access specifiers used in python?</summary>

</details>

<details><summary style="font-size:18px;color:#C71585">How will you check if a class is a child of another class?</summary>

</details>

#### Pandas

1. What do you know about pandas?
2. Define pandas dataframe.
3. How will you combine different pandas dataframes?
4. Can you create a series from the dictionary object in pandas?
5. How will you identify and deal with missing values in a dataframe?
6. What do you understand by reindexing in pandas?
7. How to add new column to pandas dataframe?
8. How will you delete indices, rows and columns from a dataframe?
9. Can you get items of series A that are not available in another series B?
10. How will you get the items that are not common to both the given series A and B?
11. While importing data from different sources, can the pandas library recognize dates?

#### Numpy

1. What do you understand by NumPy?
2. How are NumPy arrays advantageous over python lists?
3. What are the steps to create 1D, 2D and 3D arrays?
4. You are given a numpy array and a new column as inputs. How will you delete the second column and replace the column with a new column value?
5. How will you efficiently load data from a text file?
6. How will you read CSV data into an array in NumPy?
7. How will you sort the array based on the Nth column?
8. How will you find the nearest value in a given numpy array?
9. How will you reverse the numpy array using one line of code?
10. How will you find the shape of any given NumPy array?

</details>
