# Best Practices

## PHP

* **Files Name** and **Class Name**, we will used **Upper Camel Case** examples:
    * **Files Name**, `src/Command/AddUserCommad.php`.
    * **Class Name**, `class AddUserCommand extends Command { /***/ }`

* **Functions Name** and **Variables Name**, we will used **Lower Camel Case** examples:
    * **Functions Name**, `private function validateUserData($username, $plainPassword, $email, $fullName) { /***/ }`.
    * **Variables Name**, `private $entityManager;`

## TWIG

```
// To Do...
```

## JAVASCRIPT

```
// To Do...
```

## EXTRAS 

### Naming standards: Snake Case, Kebab Case, Camel Case ..

* **Upper Case**: All the letters of the identifier are in capital letters, for example: `NOMENCLATUREEXAMPLE`. It is used, for example, for the constants defined in PHP.

* **Camel Case**: The name comes because it resembles the two humps of a camel, and can be divided into two types:
    * **Upper Camel Case**, when the first letter of each of the words is capitalized. Also called Pascal Case. Example: `ExampleOfNomenclature`.
    * **Lower Camel Case**, same as the previous one with the exception that the first letter is lower case. Example: `exampleNomenclature`.
It is widely used in Twitter #hashTags or in languages ​​such as Java, PHP, C # ...

* **Snake Case**: When each of the words is separated by an underscore (`_`). It is common in the names of variables and functions of languages ​​like C, although also Ruby and Python have adopted it. As the Camel Case there are varieties, like all letters in capital letters, called `SCREAMING_SNAKE_CASE`, which is used to define constants. Example: `example_of_nomenclature`

* **Kebab Case**: It's the same as the Snake Case, this time, they are middle dashes (`-`) that separate the words. Its most common use is of urls. Example: `example-nomenclature`

### Sources

* [Source Code Beautifier](https://ctrlq.org/beautifier/)