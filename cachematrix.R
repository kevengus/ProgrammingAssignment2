## These functions take a matrix, calculate it's inverse, 
## and store the inverse value for future use

## makeCacheMatrix is a helper function that yeilds a list. Each
## element of the list is itslef a function to be used in the creation / storing
## of the matrix and its inverse.

## It takes as an input a matrix (allowing for a default value)

## It initializes a variable 'm' as NULL. 
## It will store the cache value of the inverse.

## Defines the local 'set' function to store the value of the matrix 
## that we want the inverse of. 
## The set function also resets the value of 'm' to NULL, 
## using the '<<-' assignment operator.
## The '<<-' operator allows the local function to reset the value
## of the variable in the immediate parent enviornment. 
## This feature allows the makeCacheMatrix function to be reused on mulitple matrices. 

## Define the local 'get' function to retrieve the matrix to be inverted.

## Define the local 'setinverse' function to calculate 
## and store the value of the inverse of the stored function

## Define the local 'getinverse' function to retrieve the 
## stored value of the inverse.

## Create a list of each of the 4 local functions.

makeCacheMatrix <- function(x = matrix()) {

  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(solve) m <<- solve
  getinverse <- function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
  
}


## Define a function cacheSolve to be called on the helper function makeCacheMatrix

## cacheSolve takes an input the list returned from makeCacheMatrix
## which includes values for the matrix to be inverted and it's inverse (if previously calculated)

## Store the value of the inverse in 'm' by calling the 'getinverse' function on the input

## Test the result to see if the inverse has already been calculated.
## If not NULL, retrieve cached value by returning 'm'

## If test returns a NULL value, proceed to caculating the inverse

## store the matrix to be evaluated locally in 'data'

## re-set local value of 'm' by calculating the inverse of 'data'

## call 'setinverse' function from makeCacheMatrix to re-set 'm' in parent envrionment
## This uses the '<<-' operator (i.e. resets inside the makeCacheMatrix function)

cacheSolve <- function(x, ...) {
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
}
