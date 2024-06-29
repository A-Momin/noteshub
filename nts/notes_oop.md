<details><summary style="font-size:20px;color:Orange">OOB Terms and Concepts</summary>

-   **Abstraction**:
    -   Abstraction is the concept of hiding the complex implementation details and showing only the essential features of an object.
    -   It focuses on what an object does rather than how it does it, providing a simplified view that facilitates understanding and reduces complexity.
    -   Abstraction is often achieved through interfaces or abstract classes.
-   **Encapsulation**:
    -   Encapsulation is the bundling of data (attributes) and methods that operate on the data within a single unit (class).
    -   It hides the internal state of an object from the outside world and restricts access to it through well-defined interfaces.
    -   Encapsulation helps achieve data abstraction and modularity, enhancing code maintainability and flexibility.
-   **Polymorphism**:
    -   Polymorphism allows objects of different classes to be treated as objects of a common superclass.
    -   It enables the same method name to behave differently depending on the object it is called on, based on the object's type.
    -   Polymorphism is achieved through method overriding and method overloading.
-   **Inheritance**:

    -   Inheritance is a mechanism where a new class (subclass) is created by deriving properties from an existing class (superclass).
    -   Subclasses inherit attributes and methods from their superclass and can override or extend them.
    -   It promotes code reuse and allows for hierarchical organization of classes.

-   **Method Overriding**:
    -   Method overriding occurs when a subclass provides a specific implementation of a method that is already defined in its superclass.
    -   It allows subclasses to customize or extend the behavior of inherited methods.
    -   Overridden methods have the same signature (name and parameters) as the methods they override.
-   **Method Overloading**:
    -   Method overloading refers to defining multiple methods in a class with the same name but different parameters.
    -   Python does not support method overloading by default (as in languages like Java or C++), but it can be simulated using default parameter values or variable-length argument lists.

</details>

---

<details><summary style="font-size:20px;color:Orange">Relationship in OOB</summary>

In Object-Oriented Programming (OOP), a relationship refers to the connection or association between classes or objects. It defines how classes or objects interact with each other to achieve specific functionalities or behaviors. Relationships are essential for modeling and designing complex systems by representing the connections and dependencies between different parts of a program.

1.  **Association**: Association represents a relationship between two classes, indicating that objects of one class are connected to objects of another class.

    -   It can be a one-to-one, one-to-many, or many-to-many relationship.
    -   Associations can be bidirectional or unidirectional.
    -   It's often represented by a line connecting the associated classes on a class diagram.
    -   Multiplicity notation indicates the number of instances allowed in the relationship.

    ```python

    class Zookeeper:
        def feed_animal(self, animal):
            print(f"Zookeeper is feeding the {animal.species}.")

    # Create instances
    zookeeper = Zookeeper()
    lion = Animal("Lion", "Roar")

    # Association
    zookeeper.feed_animal(lion)
    ```

    -   In this example, the Zookeeper class has a method feed_animal, creating an association with the Animal class. An instance of Zookeeper can interact with instances of Animal, demonstrating a simple form of association.

2.  **Aggregation**: Aggregation is a special form of association where one class represents the "whole" and another class represents the "part." The part can exist independently of the whole.

    -   Aggregation implies a relationship where one class contains another class, but the contained class can exist on its own.
    -   It's often represented by a diamond shape on the side of the whole class.
    -   Aggregation is less restrictive than composition; the part can be shared among different wholes.

    ```python

    class Zoo:
        def __init__(self, name):
            self.name = name
            self.animals = []

        def add_animal(self, animal):
            self.animals.append(animal)

    # Create instances
    zoo = Zoo("City Zoo")
    lion = Animal("Lion", "Roar")

    # Aggregation
    zoo.add_animal(lion)
    ```

    -   In this example, the Zoo class has a list of Animal objects. The Zoo is the whole, and Animal is the part. The Animal instances can exist independently, and the Zoo class can aggregate multiple Animal instances.

3.  **Composition**: Composition is a stronger form of aggregation where the part cannot exist independently of the whole. If the whole is destroyed, the parts are also destroyed.

    -   It implies a strong ownership relationship. The part is a fundamental component of the whole.
    -   It's often represented by a filled diamond shape on the side of the whole class.
    -   Lifecycle management of the part is controlled by the whole.

    ```python

    class Zoo:
        def __init__(self, name):
            self.name = name
            self.animals = []

        def add_animal(self, animal):
            self.animals.append(animal)

        def perform_zookeeper_duties(self, zookeeper):
            for animal in self.animals:
                zookeeper.feed_animal(animal)

    # Create instances
    zoo = Zoo("City Zoo")
    lion = Animal("Lion", "Roar")
    zookeeper = Zookeeper()

    # Composition
    zoo.add_animal(lion)
    zoo.perform_zookeeper_duties(zookeeper)
    ```

    -   In this example, the Zoo class has a method perform_zookeeper_duties that takes a Zookeeper instance and performs duties for each animal in the zoo. The Zoo and Zookeeper classes are in a composition relationship because the Zookeeper is an integral part of the Zoo, and its actions are tightly coupled with the zoo's functionality.

4.  **Inheritance**: Inheritance represents an "is-a" relationship, where a subclass inherits attributes and behaviors from a superclass.

    -   It allows the creation of a new class based on an existing class.
    -   The subclass (derived class) inherits the properties and behaviors of the superclass (base class).
    -   It promotes code reuse and supports the concept of polymorphism.

    ```python
    class Animal:
        def __init__(self, species):
            self.species = species

        def make_sound(self):
            print("Generic animal sound")


    class Dog(Animal):
        def make_sound(self):
            print("Woof!")

    # Inheritance
    dog = Dog("Canine")
    dog.make_sound()  # Outputs: Woof!
    ```

    -   In this example, Dog is a subclass of Animal. The Dog class inherits the species attribute from the Animal class and overrides the make_sound method.

5.  **Dependency**: Dependency is a relationship where one class relies on another class, but it is not part of an association, aggregation, or composition. It indicates that a change in one class may affect another class.

    -   It is a weaker relationship compared to association.
    -   Dependencies are typically represented by a dashed arrow on a class diagram.
    -   Changes in the independent class may require modifications in the dependent class.

    ```python
    class Car:
        def start_engine(self, key):
            print(f"Engine started with key: {key}")


    class Driver:
        def drive_car(self, car):
            print("Driver is driving the car.")
            car.start_engine("ignition key")

    # Dependency
    car = Car()
    driver = Driver()
    driver.drive_car(car)
    ```

    -   In this example, the Driver class depends on the Car class for driving. The Driver class has a method that takes a Car instance as a parameter, demonstrating a dependency.

</details>

---

<details><summary style="font-size:20px;color:Orange">OOB in Python</summary>

In Python, class definitions can include various arguments and features. Below is a list of commonly used arguments with examples:

-   **Class Body**: The class body contains attributes and methods.

    ```python
    class MyClass:
        attribute = "value"

        def method(self):
            return "Hello, world!"
    ```

-   **Inheritance**: You can inherit from one or more classes.

    ```python
    class ChildClass(ParentClass):
        pass
    ```

-   **Metaclasses**: You can specify a metaclass for customizing class creation.

    ```python
    class MyClass(metaclass=MyMetaclass):
        pass
    ```

-   **Class Attributes**: Class attributes are shared among all instances of a class.

    ```python
    class MyClass:
        class_attribute = "shared"
    ```

-   **Constructor (\_\_init\_\_)**: The constructor initializes instance attributes.

    ```python
    class MyClass:
        def __init__(self, arg1, arg2):
            self.arg1 = arg1
            self.arg2 = arg2
    ```

-   **Slots**: Slots restrict the attributes a class can have.

    ```python
    class MyClass:
        __slots__ = ("attr1", "attr2")
    ```

-   **Property**: Properties allow you to use methods as attributes.

    ```python
    class MyClass:
        @property
        def my_property(self):
            return "This is a property."
    ```

-   **Docstring**: A docstring provides documentation for the class.

    ```python
    class MyClass:
        """This is a docstring."""
    ```

-   **Decorator**: You can use decorators to modify class behavior.

    ```python
    @my_decorator
    class MyClass:
        pass
    ```

-   **Classmethod**: The `classmethod()` decorator is used to define class methods, which are methods that operate on the class itself rather than instances of the class. Class methods receive the class itself as the first argument (`cls` by convention), rather than the instance (`self`).

    ```python
    class MyClass:
        @classmethod
        def my_class_method(cls):
            return "Class method."
    ```

-   **Staticmethod**: The `staticmethod()` decorator is used to define static methods, which are methods that do not operate on instances or class variables. They are similar to regular functions but are defined within a class for organization purposes.

    ```python
    class MyClass:
        @staticmethod
        def my_static_method():
            return "Static method."
    ```

-   **Abstractmethod**: The `abstractmethod()` decorator is used to define abstract methods within abstract base classes. Abstract methods are methods that must be implemented by concrete subclasses. Abstract base classes cannot be instantiated directly.

    ```python
    from abc import ABC, abstractmethod

    class Shape(ABC):
        @abstractmethod
        def area(self):
            pass

    class Rectangle(Shape):
        def __init__(self, length, width):
            self.length = length
            self.width = width

        def area(self):
            return self.length * self.width

    rect = Rectangle(5, 4)
    print("Area of rectangle:", rect.area())  # Output: 20
    ```

-   **Abstract Classes (abc module)**: Abstract classes define abstract methods that must be implemented by subclasses.

#### Some Important Special Methods

-   **\_\_new\_\_()** Method: The `__new__()` method is a special method in Python that is responsible for creating a new instance of a class. It is a static method that is called before the **\_\_init\_\_()** method during object instantiation. The primary purpose of `__new__()` is to create and return a new instance of the class.

    ```python
    class MyClass:
        def __new__(cls, *args, **kwargs):
            print("Creating a new instance of MyClass")
            instance = super().__new__(cls)  # Create a new instance
            return instance

    # Instantiate MyClass
    obj = MyClass()
    ```

    -   We define a class MyClass with a custom `__new__()` method.
    -   Inside `__new__()`, we print a message to indicate that a new instance is being created.
    -   We call the superclass's `__new__()` method to create the instance.
    -   Finally, we return the newly created instance.

-   **\_\_call\_\_()** Method: The `__call__()` method allows an object to be called as if it were a function. When an object's `__call__()` method is invoked, the object behaves as a callable, similar to a function.

    ```python
    class CallableClass:
        def __call__(self, *args, **kwargs):
            print("CallableClass instance is called")

    # Create an instance of CallableClass
    obj = CallableClass()

    # Call the instance as if it were a function
    obj()
    ```

    -   We define a class CallableClass with a `__call__()` method.
    -   Inside `__call__()`, we print a message to indicate that the instance is being called.
    -   We create an instance obj of CallableClass.
    -   We call the instance obj as if it were a function, which invokes its `__call__()` method.

-   **\_\_annotations\_\_** Attribute: The `__annotations__` attribute is a special attribute that stores annotations associated with function or method arguments and return values. Annotations are optional metadata that can be added to function definitions to provide additional information about the function's parameters and return values.

    ```python
    def add(x: int, y: int) -> int:
        return x + y

    # Access the annotations
    print(add.__annotations__)
    ```

    -   We define a function add that takes two arguments x and y, both of type int, and returns an int.
    -   We add annotations to the function parameters and return value using the : syntax.
    -   We access the `__annotations__` attribute of the function to retrieve the annotations.
    -   The `__annotations__` attribute returns a dictionary containing the annotations for each parameter and the return value.

-   **\_\_new\_\_()** vs **\_\_init\_\_()**:

    -   **\_\_new\_\_()**: The `__new__()` method is responsible for creating a new instance of a class. It returns a new instance of the class. This instance is then passed as the first argument (`self`) to the `__init__` method.

        -   Instance creation refers to the process of creating a new instance of a class, i.e., allocating memory for the object and setting up its initial state.
        -   Instance creation occurs before instance initialization. The `__new__()` method is called first, followed by the `__init__` method.
        -   The `__new__()` method returns the newly created instance, which is then passed to the `__init__` method for initialization.

    -   **\_\_init\_\_()**: The `__init__()` method is responsible for initializing the newly created instance after it has been created by `__new__()`. It is an instance method that is called after the `__new__()` method, with the newly created instance (`self`) as its first argument.
        -   Instance initialization refers to the process of setting up the initial state of the newly created instance, such as initializing instance variables, performing setup tasks, or any other initialization logic.
        -   Instance initialization occurs after instance creation. The `__init__()` method is called after `__new__()` and receives the newly created instance as its first argument (`self`).
        -   Inside the `__init__()` method, you typically perform actions such as initializing instance variables, setting up the object's initial state, or performing any other initialization tasks specific to the object.

</details>
