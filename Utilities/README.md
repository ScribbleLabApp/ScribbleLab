# Scribble GYB (Generate Your Boilerplate)

The Scribble GYB configuration simplifies boilerplate code generation for ScribbleLabApp projects. By utilizing Python scripting capabilities, GYB provides a flexible approach to reducing repetitive code and improving consistency in Swift, Objective-C, and Objective-C++ projects.

## Table of Contents

1. [Overview](#overview)
2. [Installation](#installation)
   
   2.1 [Add scribble-gyb as git submodule](#option-1-add-scribble-gyb-as-git-submodule)
   
   2.2 [Manually Copy Files](#option-2-manually-copy-files-recommended)

3. [Template Syntax](#template-syntax)
   
   3.1 [Code Blocks](#python-code-blocks)
   
   3.2 [Variables & Placeholders](#variables-and-placeholders)
   
   3.3 [Conditional Logic](#conditional-logic)

   3.4 [Loops](#loops)

4. [Supported Types](#supported-types)
   
   4.1 [Supported Swift Types](#supported-swift-types)

   4.2 [Supported ObjC Types](#supported-objective-c-types)

   4.3 [Supported ObjC++ Types](#supported-objective-c-types-1)

5. [Using gyb_utils.py for Shared Utilities](#using-gyb-utils-py-for-shared-utilities)

   5.1 [Declaring global variables](#declaring-global-utilities-in-gyb-utils-py)

   5.2 [Importing and Using Utilities](#importing-and-using-utilities-in-gyb-templates)

6. [Using GYB with ObjC and ObjC++](#using-gyb-with-objective-c-and-objective-c++)

7. [Running Scribble-GYB](#running-scribble-gyb)

   7.1 [Steps to generate Source files](#steps-to-generate-code)

8. [Customization `(in planning)`](#customization-in-planning)

   8.1 [Purpose of the .gyb_config File](#purpose-of-the-gyb_config-file)

   8.2 [Proposed Structure of the .gyb_config File](#proposed-structure-of-the-gyb_config-file)

   8.3 [Configuration Elements](#configuration-elements)

      8.3.1 [Template Directives (templateDirectives)](#template-directives-templatedirectives)

      8.3.1.1 [Directive (templateDirectives/directive)](#directive-templatedirectivesdirective)

      8.3.2 [Output Configuration (outputConfiguration)](#output-configuration-outputconfiguration)

      8.3.2.1 [Output Path (outputConfiguration/outputPath)](#output-path-outputconfigurationoutputpath)

      8.3.2.2 [Project Root (projectRoot)](#project-root-projectroot)

      8.3.2.3 [File Naming Convention (outputConfiguration/fileNamingConvention)](#file-naming-convention-outputconfigurationfilenamingconvention)

      8.3.2.4 [Build Flags (outputConfiguration/buildFlags)](#build-flags-outputconfigurationbuildflags)

      8.3.3 [Import Management (importManagement)](#import-management-importmanagement)

      8.3.3.1 [Module (importManagement/Module)](#module-importmanagementmodule)

      8.3.3.2 [Advantages of using auto import Models](#advantages-of-using-auto-import-models)

   8.4 [Using the .gyb_config File](#using-the-gyb_config-file)

9. [Best Practices](#best-practices)

10. [Copyright Notice](#copyright-notice)

11. [Support Us](#support-us)

## Overview

GYB (Generate Your Boilerplate) is a tool used to generate source code by mixing Python code with template files. It allows developers to avoid redundancy by dynamically generating patterns across different files or languages. Scribble GYB offers a powerful way to ensure clean, consistent code while minimizing manual coding effort.

## Installation

Scribble GYB can be integrated into your project either as a Git submodule or by manually copying files into the project directory.

### Option 1: Add scribble-gyb as git submodule

1. Navigate to your project you want to use scribble-gyb in:

   ```shell
   cd your-project
   ```

2. Clone the repository into your project as a submodule:

    ```shell
    git clone https://github.com/ScribbleLabApp/scribble-gyb.git
    ```
3. Initialize and update the submodule:
    
    ```shell
    git submodule init
    git submodule update
    ```

#### Option 2: Manually Copy Files `(recommended)`

1. Clone the scribble-gyb config repository:

    ```shell
    git clone https://github.com/ScribbleLabApp/scribble-gyb.git
    ```

2. Create a `utils` directory in your project:   
   ```shell
   mkdir -p /path/to/your-project/utils
   ```

3. Copy the gyb runtime preprocessor to your repo

   ```shell
   cp -R scribble-gyb/* /path/to/your-project/utils/
   ```

4. Navigate to your project directory and ensure the files are in place under the utils directory.

## Template Syntax

GYB templates are composed of two primary elements:

   - **Python code blocks** for logic and control flow.
   - **Code placeholders** that insert Python values into generated code.

#### Python Code Blocks

Python code is either written inside `%{ ... }%` or `${...}$` blocks. These blocks are executed at template processing time, allowing for dynamic code generation based on runtime values or logic.

```python
%{
    import random
    random_value = random.randint(1, 100)
}%
```

#### Variables and Placeholders

Python variables defined inside a GYB template can be inserted into Swift, Objective-C, or Objective-C++ code using `${var}` syntax.

```swift
%{
py_greeting = "Hello, GYB!"
}%

public struct Greeting {
    public let message: String = "${py_greeting}"
}

print(Greeting.message) // [OUTPUT] ~> Hello, GYB!
```

```objc
%{
   message = "Hello, GYB ObjC!"
}%

NSString *greeting = @"${message}"; // [OUTPUT] ~> Hello, GYB ObjC!
```

#### Conditional Logic

GYB supports Python control flow constructs such as if statements, enabling conditional code generation.

```swift
%{
   is_logged_in = True
}%

% if is_logged_in:
   print("Welcome back!")
% else:
   print("Please log in.")
% end
```

```objc
%{
   use_large_buffer = True
}%

% if use_large_buffer:
   #define BUFFER_SIZE 1024
% else:
   #define BUFFER_SIZE 256
% end

char buffer[BUFFER_SIZE];
```

### Loops

GYB templates can use Python's `for` loops to generate repeated code blocks. 

```swift
%{
   fields = ['name', 'age', 'email']
}%

struct User {
   % for field in fields:
      var ${field}: String
   % end
}
```

##### Autogenerated Source

```swift
struct User {
   var name: String
   var age: String
   var email: String
}
```

```objc
%{
   methods = ['getName', 'getAge', 'getEmail']
}%

@interface User : NSObject
% for method in methods:
- (NSString *)${method};
% end
@end
```

##### Autogenerated Source

```objc
@interface User : NSObject

- (NSString *)getName;
- (NSString *)getAge;
- (NSString *)getEmail;

@end
```

## Supported Types

GYB supports a variety of data types, allowing you to easily generate code with the required type annotations and variable declarations. The following types are supported:

### Supported Swift Types

| **Type**       | **Description**                                   | **Value**                                   | **Example**                |
|----------------|---------------------------------------------------|---------------------------------------------|----------------------------|
| `String`       | Represents a sequence of characters.              | N/A                                         | `"Hello, World!"`           |
| `Int`          | Represents a signed integer.                      | `-9223372036854775808` to `9223372036854775807` | `42`                       |
| `Int8`         | Represents an 8-bit signed integer.               | `-128` to `127`                             | `Int8(127)`                |
| `Int16`        | Represents a 16-bit signed integer.               | `-32768` to `32767`                         | `Int16(32767)`             |
| `Int32`        | Represents a 32-bit signed integer.               | `-2147483648` to `2147483647`               | `Int32(2147483647)`        |
| `Int64`        | Represents a 64-bit signed integer.               | `-9223372036854775808` to `9223372036854775807` | `Int64(9223372036854775807)` |
| `UInt8`        | Represents an 8-bit unsigned integer.             | `0` to `255`                                | `UInt8(255)`               |
| `UInt16`       | Represents a 16-bit unsigned integer.             | `0` to `65535`                              | `UInt16(65535)`            |
| `UInt32`       | Represents a 32-bit unsigned integer.             | `0` to `4294967295`                         | `UInt32(4294967295)`       |
| `UInt64`       | Represents a 64-bit unsigned integer.             | `0` to `18446744073709551615`               | `UInt64(18446744073709551615)` |
| `Bool`         | Represents a Boolean value (`true` or `false`).   | `true` or `false`                           | `true`                     |
| `Double`       | Represents a double-precision floating-point number. | ~±1.7e308                                  | `3.14159`                  |
| `Float`        | Represents a single-precision floating-point number. | ~±3.4e38                                   | `2.71828f`                 |

### Supported Objective-C Types

| **Type**       | **Description**                                   | **Value**                                   | **Example**                |
|----------------|---------------------------------------------------|---------------------------------------------|----------------------------|
| `NSString`     | Represents a string object.                       | N/A                                         | `@"Hello, World!"`          |
| `NSInteger`    | Represents a signed integer.                      | `-9223372036854775808` to `9223372036854775807` | `NSInteger value = 42;`    |
| `NSUInteger`   | Represents an unsigned integer.                   | `0` to `18446744073709551615`               | `NSUInteger count = 10;`   |
| `BOOL`         | Represents a Boolean value (`YES` or `NO`).        | `YES` or `NO`                               | `BOOL isActive = YES;`     |
| `CGFloat`      | Represents a floating-point number, typically used for UI measurements. | Varies depending on the platform            | `CGFloat width = 100.0;`   |

### Supported Objective-C++ Types

| **Type**       | **Description**                                   | **Value**                                   | **Example**                |
|----------------|---------------------------------------------------|---------------------------------------------|----------------------------|
| `std::string`  | Represents a string object from the C++ Standard Library. | N/A                                     | `std::string name = "John";`|
| `int`          | Represents a signed integer.                      | `-2147483648` to `2147483647`               | `int age = 30;`            |
| `unsigned int` | Represents an unsigned integer.                   | `0` to `4294967295`                         | `unsigned int count = 5;`  |
| `bool`         | Represents a Boolean value (`true` or `false`).   | `true` or `false`                           | `bool isValid = true;`     |
| `float`        | Represents a single-precision floating-point number. | ~±3.4e38                                   | `float pi = 3.14f;`        |
| `double`       | Represents a double-precision floating-point number. | ~±1.7e308                                  | `double e = 2.71828;`      |

## Using gyb_utils.py for Shared Utilities

The `gyb_utils.py` file in the Scribble GYB configuration allows you to declare global variables, helper functions, or imports that can be reused across different GYB templates. This is especially useful when you have common logic or variables that need to be shared.

### Declaring Global Utilities in `gyb_utils.py`

You can modify the `gyb_utils.py` file to declare any utility functions, global variables, or imports. For example, you can declare shared constants or utility functions like this:

```py
# gyb_utils.py
PI = 3.14159

def square(x):
    return x * x
```

### Importing and Using Utilities in GYB Templates

Once you have your utilities declared, you can import them into any GYB template by using a simple Python import statement at the top of your template:

```py
%{
    from gyb_utils import *
}%

print("The value of PI is ${PI}")
print("The square of 4 is ${square(4)}")
```

This allows you to maintain clean, reusable code in your GYB templates, avoiding redundancy and making your templates more maintainable.

## Using GYB with Objective-C and Objective-C++

GYB can be used to generate code for Objective-C (`.m.gyb`) and Objective-C++ (`.mm.gyb`) files. This is particularly useful when generating boilerplate getter and setter methods, constants, or configuration code.

```objc
%{
   properties = ['name', 'age', 'email']
}%

@implementation User {
    % for prop in properties:
    NSString *_${prop};
    % end
}

% for prop in properties:
- (NSString *)${prop} {
    return _${prop};
}
% end

@end
```

This example generates getter methods dynamically based on the properties defined in a list.

```cpp
%{
   member_types = ['int', 'float', 'std::string']
   member_names = ['id', 'score', 'name']
}%

class Player {
    % for member_type, member_name in zip(member_types, member_names):
    ${member_type} ${member_name};
    % end

public:
    Player() {
        % for member_name in member_names:
        this->${member_name} = {};
        % end
    }
};
```

The following template demonstrates generating member variables and constructors for a C++ class.

## Running Scribble-GYB

To process your `.gyb` templates and generate source files, you must use the `generate-sources.sh` script provided in the repository.

### Steps to Generate Code

1. Ensure your GYB template files are in place with appropriate extensions (`.swift.gyb`, `.m.gyb`, `.mm.gyb`). To review the appropiate extensions for the used language look at the table below. 

   | Language | GYB Extension |
   | :------: | :------------: |
   | Swift | `.swift.gyb` |
   | ObjC | `.m.gyb` |
   | ObjC++ | `.mm.gyb` |

2. Run the `generate-sources.sh` script to generate the Swift, Objective-C, or Objective-C++ source files.

   ```sh
   chmod +x generate-sources.sh
   ./generate-sources.sh
   ```

The generated files will be saved in subdirectories under Sources or Tests, mirroring the location of the original GYB templates.

## Customization (in planning)

The customization of the Scribble GYB's processing configuration aims to enhance the flexibility and functionality of the GYB template processing. While this feature is currently in planning, we envision using a `.gyb_config` file formatted as XML to allow developers to tailor the behavior of GYB templates to meet their specific needs. This documentation outlines the intended structure, potential configurations, and usage of the `.gyb_config` file for customizing Scribble GYB.

> [!IMPORTANT]
> The customization of Scribble GYB's processing configuration is currently not available as it is in planning. This article should rather be seen as a descriptive proposal.
>
> Customization will be available in v1.0 of Scribble GYB. For more information visit our [GitHub repository](https://github.com/ScribbleLabApp/scribble-gyb).

### Purpose of the .gyb_config File

The `.gyb_config` file will serve as a centralized configuration point for various GYB processing options. By utilizing an XML format, developers will be able to define custom settings, such as:

- **Template Directives:** Set directives that modify how templates are processed, such as enabling or disabling certain features.
- **Output Configuration:** Control how the generated files are structured, named, or stored.
- **Import Management:** Define which utility modules or functions should be imported by default in all templates.

### Proposed Structure of the .gyb_config File

The configuration file will follow a well-defined XML structure, making it easy to read and modify. Below is an example of what a `.gyb_config` file might look like:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<gybConfig>
    <templateDirectives>
        <directive name="enableCaching" value="true" />
        <directive name="disableLineDirectives" value="false" />
    </templateDirectives>
    <outputConfiguration>
        <projectroot>../.</projectroot>
        <fileNamingConvention>
            <namePattern>{templateName}_{timestamp}</namePattern>
        </fileNamingConvention>
    </outputConfiguration>
    <importManagement>
        <module>gyb_utils</module>
        <module>gyb_helpers</module>
    </importManagement>
</gybConfig>
```

### Configuration Elements

##### Template Directives (templateDirectives)

Template Directives will contain directives that modify the behavior of template processing. Each directive will have a name attribute (to identify the directive) and a value attribute (to specify its state).

| Attribute         | Description                             | Type |
| :---------------: | :-------------------------------------: | :----: |
| directive         | Specifies the name of the directive to modify template processing. | `string` |


```xml
<templateDirectives>
    <directive name="" value="" />
</templateDirectives>
```

###### Directive (templateDirectives/directive)

Directives can significantly impact the processing of templates. For instance, enabling verbose logging can provide detailed insights into the GYB processing flow, while disabling line directives can simplify the output structure.

**Parameters:**

- `name`: A `string` that identifies the directive being set. This name is used within the GYB processing engine to apply specific behaviors.
- `value`: A `boolean` value that indicates the state of the directive. A value of `true` activates the directive, while `false` deactivates it.

The directive element specifies individual processing behaviors through its name and value attributes. Each directive is designed to control specific aspects of template processing.

| directive_name         | Description                             | Type |
| :---------------: | :-------------------------------------: | :----: |
| `enableVerboseLogging` | When set to `true`, enables verbose logging for the GYB process, providing detailed output for debugging purposes. | `bool` |
| `disableLineDirectives` | When set to `true`, disables the use of line directives within templates, which may simplify the output. | `bool` |
| `enableCaching` | When set to true, enables caching of processed templates to improve performance on subsequent requests. | `bool` |
| `disableOutputMinification` | When set to `true`, disables any output minification processes that may reduce file sizes but complicate readability. | `bool` |

```xml
<templateDirectives>
    <directive name="enableVerboseLogging" value="true" />
    <directive name="disableLineDirectives" value="true" />
    <directive name="enableCaching" value="true" />
    <directive name="disableOutputMinification" value="false" />
</templateDirectives>
```

##### Output Configuration (outputConfiguration)

Output Configuration will define settings related to the output of generated files. It can specify the directory for generated files and how filenames should be formatted.

| Attribute         | Description                             | Type |
| :---------------: | :-------------------------------------: | :----: |
| outputPath         | Specifies the directory where generated files will be stored. | `string` |
| projectRoot | | `string` |
| fileNamingConvention | Defines the naming pattern for generated files. | `string` |
| buildFlags | Optional flags to pass to the build process, if applicable. | `string` |

```xml
<outputConfiguration>
    <outputPath></outputPath>
    <fileNamingConvention></fileNamingConvention>
    <buildFlags></buildFlags>
</outputConfiguration>
```

###### Output Path (outputConfiguration/outputPath)

The `outputPath` specifies the directory where the generated files will be stored. This path can be either absolute or relative to the project root.

**Parameters:**
- `_path`: The path where the generated files will be saved.

```xml
<outputConfiguration>
    <outputPath>*.gyb/autogenerated</outputPath>
</outputConfiguration>
```

###### Project Root (projectRoot)

The `projectRoot` defines the root directory of the project. This is helpful for resolving relative paths within the project structure.

**Parameters:**
- `_path`: The root directory of the project, which can be used to construct relative paths for the output.

```xml
<outputConfiguration>
    <projectRoot>../.</projectRoot>
</outputConfiguration>

```

###### File Naming Convention (outputConfiguration/fileNamingConvention)

The `fileNamingConvention` specifies how the generated files will be named based on a naming pattern. This allows for consistent file naming that can include dynamic elements like the template name and timestamps.

| Attribute         | Description                             | Type |
| :---------------: | :-------------------------------------: | :----: |
| namingPattern | The pattern used to name generated files, supporting placeholders. | `string` |

```xml
<outputConfiguration>
    <namePattern>{templateName}_generated</namePattern>
</outputConfiguration>
```

###### Build Flags (outputConfiguration/buildFlags)

The `buildFlags element contains optional flags that can be passed to the build process. These flags can control various aspects of how files are compiled or processed.

| Attribute         | Description                             | Type |
| :---------------: | :-------------------------------------: | :----: |
| flag         | A specific flag to be passed to the build process. | `string` |

```xml
<outputConfiguration>
    <buildFlags>
        <flag></flag>
    </buildFlags>
</outputConfiguration>
```

**Overview of Build Flags:**

| flag         | Description                             | 
| :---------------: | :-------------------------------------: |
| `-O1`        | Enables optimization level 1 for performance improvement. |
| `-C` | Enables compile-time checks for better error reporting. |
| `-Wall` | Enables all compiler's warning messages, helping developers identify potential issues early. |
| `-Werror` | Treats all warnings as errors, enforcing stricter code quality and prompting fixes before compilation. |
| `-g` | Generates debug information for use with debuggers, allowing easier troubleshooting.
| `-ddb` | Defines a macro named DEBUG, typically used to enable or disable debugging code sections in the project. |


Build flags provide developers with the ability to customize the build process, allowing for optimizations, debugging aids, or other specific configurations needed for different environments.

```xml
<outputConfiguration>
    <buildFlags>
        <flag>-O1</flag>
        <flag>-C</flag>
    </buildFlags>
</outputConfiguration>
```

##### Import Management (importManagement)

The Import Management section is crucial for specifying utility modules or files that should be automatically imported into all GYB (Generate Your Boilerplate) templates. This feature simplifies template development by ensuring that common dependencies are consistently available, reducing the need for repetitive import statements in individual templates.

| Attribute         | Description                             | Type |
| :---------------: | :-------------------------------------: | :----: |
| module         | Specifies the name of the module to be imported into GYB templates. | `string` |

```xml
<importManagement>
    <module></module>
</importManagement>
```

###### Module (importManagement/Module)

Modules are predefined sets of functions, classes, or variables that encapsulate specific functionalities to be reused across different templates. By importing these modules, developers can leverage existing utility functions or libraries without needing to redefine or re-import them in every template file.

**Parameters:**
- `_moduleName`: The name of the module to be imported. This should match the actual module name in the project structure or within the GYB framework.

When a module is imported, all its exported functions, classes, and variables become available in the GYB template's scope. This allows developers to utilize the module's capabilities seamlessly, promoting code reuse and modular design.

###### Advantages of using auto import Models

By managing imports centrally, all templates can maintain a consistent set of available utilities. This minimizes discrepancies between different templates and helps ensure that they all function uniformly.

With automatic imports, GYB templates remain cleaner and more focused on their specific logic, as common utility imports do not clutter the top of each template file.

```xml
<importManagement>
    <module>gyb_utils</module>
    <module>gyb_foundation</module>
</importManagement>
```

In the example above, two modules, gyb_utils and gyb_foundation, are specified for import. This means that in every GYB template, functions or classes defined in these modules will be readily available for use.

### Using the .gyb_config File

Once the .gyb_config file is properly structured and placed within the project, the Scribble GYB processing engine will read and apply the configurations during template processing. Developers will need to ensure that the path to the .gyb_config file is correctly specified in their GYB processing script.

1. **Create the .gyb_config File:** Create a new file named `.gyb_config` in the root directory of your GYB templates.
2. **Define Configuration Settings:** Populate the file with the necessary configurations following the proposed XML structure
3. **Integrate with GYB Processing:** Ensure your GYB processing script is set up to read the `.gyb_config` file. This integration will involve parsing the XML and applying the settings before processing the templates.

## Best Practices

- **Modular Templates:** Keep your GYB templates as modular as possible. Small, reusable templates improve maintainability.
- **Consistent Naming:** Use clear and consistent naming conventions for your GYB variables and placeholders to improve readability.
- **Leverage gyb_utils.py:** Use gyb_utils.py to declare shared utilities or constants across multiple templates, reducing redundancy.
- **Avoid Complex Logic:** Keep Python logic in GYB templates straightforward. Complex business logic should be placed in helper functions or scripts outside of the GYB templates.

## Copyright Notice

Copyright (c) 2024, ScribbleLabApp LLC. All rights reserved.

Copyright (c) 2014 - 2024, Apple Inc. -
Swift is a trademark of Apple Inc. All rights reserved.

Copyright (c) 2001-2024, Python Software Foundation -
Python is a trademark of the Python Software Foundation. All rights reserved.

## Support Us

Your support is valuable to us and helps us dedicate more time to enhancing and maintaining this repository. Here's how you can contribute:

⭐️ **Leave a Star:** If you find this repository useful or interesting, please consider leaving a star on GitHub. Your stars help us gain visibility and encourage others in the community to discover and benefit from this work.

✨ **Follow us on Social Media:** If you find this repository useful or interesting, please consider leaving a sub on YouTube or Instagram. Your sub help us gain visibility and encourage others in the community to discover and benefit from this work.

📲 **Share with Friends:** If you like the idea behind this project, please share it with your friends, colleagues, or anyone who might find it valuable.
