## Add package
Pkg.add("Package name")

## Update packages
Pkg.update()

## Update to the latest package version
Pkg.checkout("Package name")

## List all installed packages
Pkg.installed()

## Matrics

```julia
matrix = [3 3 1;4 3 1;1 1 -1]
```

## Array

```julia
arr = Array{T}(3,3) # two dimension array with 3x3 elements
arr[1,:] # first row
arr[:,1] # first column
collect(1:2:15) # from range

# handle array
a = [1 2]
b = [3 4]
cat([1], a, b) # => 2x2 [1 2; 3 4] == vcat
cat([2], a, b) # => 1x4 [1 2 3 4] == hcat
```
