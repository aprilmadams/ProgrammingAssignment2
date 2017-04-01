## Overall these functions will save processing power because it will create a special matrix and then create an inverse.  The special matrix saves on computation.

## This function is going to take set the inverse and then get the inverse of the matrix.

makeCacheMatrix <- function(x = matrix()) {

    inv <- NULL
    set <- function(y){
      x <<- y
      inv <<- NULL
    }
    get <- function() x
    setInverse <- function(solveMatrix) inv <<- solveMatrix
    getInverse <- function() inv
    list(set = set, get = get, setInverse = setInverse, getInverse = getInverse)
  }



## This function will inverse the matrix above
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getInverse()
  if(!is.null(inv)){
    message("getting cached data")
    return(inv)
  }
  data <- x$get()
  inv <- solve(data)
  x$setInverse(inv)
  inv      
}
