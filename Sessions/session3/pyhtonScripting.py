# Notes
# python is dynamically typed language, this means that we can change the type of a variable at any time.
# in dataTypes we have type which is None which equivelent to Null.
# exponent in python is ** not ^.
# floor division is //.
# we can't use ** with strings.
# we can use * with strings, which means that we can repeat the string by the number of times we want.
# division in python is always float. except if we decide to use floor division.
a = 5 ** 3
print(a)
a = 5 // 3
print(a)
a = "Ahmed" * 3
print(a)
# lets work on Lists
# Lists are ordered sequences of objects.
# Lists are mutable.
# Lists are indexed.
# Lists are heterogenous.
# Lists are dynamic.
# Lists are iterable.
# Lists are subscriptable.
# Lists are nestable.
# lists can be accessed by -ve index.
# -1 is the last element in the list.

# Functions


# in default values, we must but the default values at the end of the parameters.
def add(a, b=5) -> int:  # the arrow indicates the return type.
    return a + b


print(add(3.6,))

a = " abc def "
print(a.strip())  # remove spaces from the beginning and the end of the string.

a = "abc def"
print(a.split())  # split the string by spaces and return a list of the words.

a = "abc,def"
print(a.split(","))  # split the string by , and return a list of the words.

a = "abc"
print(a.replace("a", "A"))  # replace a with A.

a = ["abc", "def"]
print(a.append('fsd'))


# reading files:
def read_file(file_path="/data/"):
    print("reading file", file_path)


print(read_file())
print(read_file("/data/ahmed.txt"))

# defining the path of the file
filePath = 'anyFile.txt'

# opening the path in write mode
file = open(filePath, 'w')
# when we open the file in write mode, it will create the file if it doesn't exist.
# and it will clear all the content if the file already exists.
file.write('Hello World')
file.close()

# opening the path in append mode
file = open(filePath, 'a')
file.write('\nThis is the second line')
file.close()

# opening the path in reading mode
file = open(filePath, 'r')
print(file.read())
file.close()

# in this block we need to read a file with multiple lines and remove the empty lines.
path = "newLinesStriping.txt"
file = open(path, 'r')
lines = file.readlines()
cleanContent = []
print(lines)
for line in lines:
    if line.strip() != "":
        cleanContent.append(line.strip())

# now I want to write this in the anyFile
file2 = open("anyFile.txt", 'w')
for content in cleanContent:
    file2.write(content + "\n")
file2.close()
file.close()

# modules
# modules are files that contain python code.
# modules are used to organize the code.
# modules are used to reuse the code.
# modules are used to share the code.
# modules are used to make the code more readable.
# modules are used to make the code more maintainable.
# modules are used to make the code more testable.
# modules are used to make the code more scalable.
# modules are used to make the code more secure.
