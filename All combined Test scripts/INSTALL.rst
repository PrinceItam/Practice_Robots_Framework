<<<<<<< HEAD
Python installation
Robot Framework is implemented using Python, and a precondition to install it is having Python or its alternative implementation PyPy installed. Another recommended precondition is having the pip package manager available.

Robot Framework requires Python 3.6 or newer. If you need to use Python 2, Jython or IronPython, you can use Robot Framework 4.1.3.

Installing Python on Linux
On Linux you should have suitable Python installation with pip available by default. If not, you need to consult your distributions documentation to learn how to install them. This is also true if you want to use some other Python version than the one provided by your distribution by default.

To check what Python version you have installed, you can run python --version command in a terminal:

$ python --version
Python 3.8.10
Notice that if your distribution provides also older Python 2, running python may use that. To use Python 3, you can use python3 command or even more version specific command like python3.8. You need to use these version specific variants also if you have multiple Python 3 versions installed and need to pinpoint which one to use:

$ python3.9 --version
Python 3.9.10
$ python3.10 --version
Python 3.10.2
Installing Robot Framework directly under the system provided Python has a risk that possible problems can affect the whole Python installation used also by the operating system itself. Nowadays Linux distributions typically use user installs by default to avoid such problems, but users can also themselves decide to use virtual environments.

Installing Python on Windows
On Windows Python is not available by default, but it is easy to install. The recommended way to install it is using the official Windows installers available at http://python.org. For other alternatives, such as installing from the Microsoft Store, see the official Python documentation.

When installing Python on Windows, it is recommended to add Python to PATH to make it and tools like pip and Robot Framework easier to execute from the command line. When using the official installer, you just need to select the Add Python 3.x to PATH checkbox on the first dialog.

To make sure Python installation has been successful and Python has been added to PATH, you can open the command prompt and execute python --version:

C:\>python --version
Python 3.9.4
If you install multiple Python versions on Windows, the Python that is used when you execute python is the one first in PATH. If you need to use others, the easiest way is using the py launcher:

C:\>py --version
Python 3.9.4
C:\>py -3.10 --version
Python 3.10.2
Installing Python on macOS
MacOS does not provide Python 3 compatible Python version by default, so it needs to be installed separately. The recommended approach is using the official macOS installers available at http://python.org. If you are using a package manager like Homebrew, installing Python via it is possible as well.

You can validate Python installation on macOS using python --version like on other operating systems.

PyPy installation
PyPy is an alternative Python implementation. Its main advantage over the standard Python implementation is that it can be faster and use less memory, but this depends on the context where and how it is used. If execution speed is important, at least testing PyPy is probably a good idea.

Installing PyPy is a straightforward procedure and you can find both installers and installation instructions at http://pypy.org. To validate that PyPy installation was successful, run pypy --version or pypy3 --version.

Note

Using Robot Framework with PyPy is officially supported only on Linux.

Configuring PATH
The PATH environment variable lists directories where commands executed in a system are searched from. To make using Python, pip and Robot Framework easier from the command line, it is recommended to add the Python installation directory as well as the directory where commands like pip and robot are installed into PATH.

When using Python on Linux or macOS, Python and tools installed with it should be automatically in PATH. If you nevertheless need to update PATH, you typically need to edit some system wide or user specific configuration file. Which file to edit and how depends on the operating system and you need to consult its documentation for more details.

On Windows the easiest way to make sure PATH is configured correctly is setting the Add Python 3.x to PATH checkbox when running the installer. To manually modify PATH on Windows, follow these steps:

Find Environment Variables under Settings. There are variables affecting the whole system and variables affecting only the current user. Modifying the former will require admin rights, but modifying the latter is typically enough.
Select PATH (often written like Path) and click Edit. If you are editing user variables and PATH does not exist, click New instead.
Add both the Python installation directory and the Scripts directory under the installation directory into PATH.
Exit the dialog with Ok to save the changes.
Start a new command prompt for the changes to take effect.
Installing using pip
These instructions cover installing Robot Framework using pip, the standard Python package manager. If you are using some other package manager like Conda, you can use it instead but need to study its documentation for instructions.

When installing Python, you typically get pip installed automatically. If that is not the case, you need to check the documentation of that Python installation for instructions how to install it separately.

Running pip command
Typically you use pip by running the pip command, but on Linux you may need to use pip3 or even more Python version specific variant like pip3.8 instead. When running pip or any of its variants, the pip version that is found first in PATH will be used. If you have multiple Python versions installed, you may need to pinpoint which exact version you want to use. This is typically easiest done by running python -m pip and substituting python with the Python version you want to use.

To make sure you have pip available, you can run pip --version or equivalent.

Examples on Linux:

$ pip --version
pip 20.2 from ... (python 3.8)
$ python3.10 -m pip --version
pip 20.2 from ... (python 3.10)
Examples on Windows:

C:\> pip --version
pip 20.2.2 from ... (python 3.9)
C:\> py -m 3.10 -m pip --version
pip 20.2.1 from ... (python 3.10)
In the subsequent sections pip is always run using the pip command. You may need to use some of the other approaches explained above in your environment.

Installing and uninstalling Robot Framework
The easiest way to use pip is by letting it find and download packages it installs from the Python Package Index (PyPI), but it can also install packages downloaded from the PyPI separately. The most common usages are shown below and pip documentation has more information and examples.

Python dependencies
Many steps are automated using the generic Invoke tool with a help by our rellu utilities, but also other tools and modules are needed. A pre-condition is installing all these, and that's easiest done using pip and the provided requirements-dev.txt file:

pip install -r requirements.txt

# Uninstall
pip uninstall robotframework
Installing from source
Another installation alternative is getting Robot Framework source code and installing it using the provided setup.py script. This approach is recommended only if you do not have pip available for some reason.

You can get the source code by downloading a source distribution as a zip package from PyPI and extracting it. An alternative is cloning the GitHub repository and checking out the needed release tag.

Once you have the source code, you can install it with the following command:

python setup.py install
The setup.py script accepts several arguments allowing, for example, installation into a non-default location that does not require administrative rights. It is also used for creating different distribution packages. Run python setup.py --help for more details.

Verifying installation
To make sure that the correct Robot Framework version has been installed, run the following command:

$ robot --version
Robot Framework 5.0 (Python 3.8.10 on linux)
If running these commands fails with a message saying that the command is not found or recognized, a good first step is double-checking the PATH configuration.

If you have installed Robot Framework under multiple Python versions, running robot will execute the one first in PATH. To select explicitly, you can run python -m robot and substitute python with the right Python version.

$ python3.10 -m robot --version
Robot Framework 5.0 (Python 3.10.2 on linux)

C:\>py -3.10 -m robot --version
Robot Framework 5.0 (Python 3.10.3 on win32)
Virtual environments
Python virtual environments allow Python packages to be installed in an isolated location for a particular system or application, rather than installing all packages into the same global location. They have two main use cases:

Install packages needed by different projects into their own environments. This avoids conflicts if projects need different versions of same packages.
Avoid installing everything under the global Python installation. This is especially important on Linux where the global Python installation may be used by the distribution itself and messing it up can cause severe problems.
=======
Python installation
Robot Framework is implemented using Python, and a precondition to install it is having Python or its alternative implementation PyPy installed. Another recommended precondition is having the pip package manager available.

Robot Framework requires Python 3.6 or newer. If you need to use Python 2, Jython or IronPython, you can use Robot Framework 4.1.3.

Installing Python on Linux
On Linux you should have suitable Python installation with pip available by default. If not, you need to consult your distributions documentation to learn how to install them. This is also true if you want to use some other Python version than the one provided by your distribution by default.

To check what Python version you have installed, you can run python --version command in a terminal:

$ python --version
Python 3.8.10
Notice that if your distribution provides also older Python 2, running python may use that. To use Python 3, you can use python3 command or even more version specific command like python3.8. You need to use these version specific variants also if you have multiple Python 3 versions installed and need to pinpoint which one to use:

$ python3.9 --version
Python 3.9.10
$ python3.10 --version
Python 3.10.2
Installing Robot Framework directly under the system provided Python has a risk that possible problems can affect the whole Python installation used also by the operating system itself. Nowadays Linux distributions typically use user installs by default to avoid such problems, but users can also themselves decide to use virtual environments.

Installing Python on Windows
On Windows Python is not available by default, but it is easy to install. The recommended way to install it is using the official Windows installers available at http://python.org. For other alternatives, such as installing from the Microsoft Store, see the official Python documentation.

When installing Python on Windows, it is recommended to add Python to PATH to make it and tools like pip and Robot Framework easier to execute from the command line. When using the official installer, you just need to select the Add Python 3.x to PATH checkbox on the first dialog.

To make sure Python installation has been successful and Python has been added to PATH, you can open the command prompt and execute python --version:

C:\>python --version
Python 3.9.4
If you install multiple Python versions on Windows, the Python that is used when you execute python is the one first in PATH. If you need to use others, the easiest way is using the py launcher:

C:\>py --version
Python 3.9.4
C:\>py -3.10 --version
Python 3.10.2
Installing Python on macOS
MacOS does not provide Python 3 compatible Python version by default, so it needs to be installed separately. The recommended approach is using the official macOS installers available at http://python.org. If you are using a package manager like Homebrew, installing Python via it is possible as well.

You can validate Python installation on macOS using python --version like on other operating systems.

PyPy installation
PyPy is an alternative Python implementation. Its main advantage over the standard Python implementation is that it can be faster and use less memory, but this depends on the context where and how it is used. If execution speed is important, at least testing PyPy is probably a good idea.

Installing PyPy is a straightforward procedure and you can find both installers and installation instructions at http://pypy.org. To validate that PyPy installation was successful, run pypy --version or pypy3 --version.

Note

Using Robot Framework with PyPy is officially supported only on Linux.

Configuring PATH
The PATH environment variable lists directories where commands executed in a system are searched from. To make using Python, pip and Robot Framework easier from the command line, it is recommended to add the Python installation directory as well as the directory where commands like pip and robot are installed into PATH.

When using Python on Linux or macOS, Python and tools installed with it should be automatically in PATH. If you nevertheless need to update PATH, you typically need to edit some system wide or user specific configuration file. Which file to edit and how depends on the operating system and you need to consult its documentation for more details.

On Windows the easiest way to make sure PATH is configured correctly is setting the Add Python 3.x to PATH checkbox when running the installer. To manually modify PATH on Windows, follow these steps:

Find Environment Variables under Settings. There are variables affecting the whole system and variables affecting only the current user. Modifying the former will require admin rights, but modifying the latter is typically enough.
Select PATH (often written like Path) and click Edit. If you are editing user variables and PATH does not exist, click New instead.
Add both the Python installation directory and the Scripts directory under the installation directory into PATH.
Exit the dialog with Ok to save the changes.
Start a new command prompt for the changes to take effect.
Installing using pip
These instructions cover installing Robot Framework using pip, the standard Python package manager. If you are using some other package manager like Conda, you can use it instead but need to study its documentation for instructions.

When installing Python, you typically get pip installed automatically. If that is not the case, you need to check the documentation of that Python installation for instructions how to install it separately.

Running pip command
Typically you use pip by running the pip command, but on Linux you may need to use pip3 or even more Python version specific variant like pip3.8 instead. When running pip or any of its variants, the pip version that is found first in PATH will be used. If you have multiple Python versions installed, you may need to pinpoint which exact version you want to use. This is typically easiest done by running python -m pip and substituting python with the Python version you want to use.

To make sure you have pip available, you can run pip --version or equivalent.

Examples on Linux:

$ pip --version
pip 20.2 from ... (python 3.8)
$ python3.10 -m pip --version
pip 20.2 from ... (python 3.10)
Examples on Windows:

C:\> pip --version
pip 20.2.2 from ... (python 3.9)
C:\> py -m 3.10 -m pip --version
pip 20.2.1 from ... (python 3.10)
In the subsequent sections pip is always run using the pip command. You may need to use some of the other approaches explained above in your environment.

Installing and uninstalling Robot Framework
The easiest way to use pip is by letting it find and download packages it installs from the Python Package Index (PyPI), but it can also install packages downloaded from the PyPI separately. The most common usages are shown below and pip documentation has more information and examples.

Python dependencies
Many steps are automated using the generic Invoke tool with a help by our rellu utilities, but also other tools and modules are needed. A pre-condition is installing all these, and that's easiest done using pip and the provided requirements-dev.txt file:

pip install -r requirements.txt

# Uninstall
pip uninstall robotframework
Installing from source
Another installation alternative is getting Robot Framework source code and installing it using the provided setup.py script. This approach is recommended only if you do not have pip available for some reason.

You can get the source code by downloading a source distribution as a zip package from PyPI and extracting it. An alternative is cloning the GitHub repository and checking out the needed release tag.

Once you have the source code, you can install it with the following command:

python setup.py install
The setup.py script accepts several arguments allowing, for example, installation into a non-default location that does not require administrative rights. It is also used for creating different distribution packages. Run python setup.py --help for more details.

Verifying installation
To make sure that the correct Robot Framework version has been installed, run the following command:

$ robot --version
Robot Framework 5.0 (Python 3.8.10 on linux)
If running these commands fails with a message saying that the command is not found or recognized, a good first step is double-checking the PATH configuration.

If you have installed Robot Framework under multiple Python versions, running robot will execute the one first in PATH. To select explicitly, you can run python -m robot and substitute python with the right Python version.

$ python3.10 -m robot --version
Robot Framework 5.0 (Python 3.10.2 on linux)

C:\>py -3.10 -m robot --version
Robot Framework 5.0 (Python 3.10.3 on win32)
Virtual environments
Python virtual environments allow Python packages to be installed in an isolated location for a particular system or application, rather than installing all packages into the same global location. They have two main use cases:

Install packages needed by different projects into their own environments. This avoids conflicts if projects need different versions of same packages.
Avoid installing everything under the global Python installation. This is especially important on Linux where the global Python installation may be used by the distribution itself and messing it up can cause severe problems.
>>>>>>> 4cf21733bfc8cdf4260ae8e9e7b516591dc41872
