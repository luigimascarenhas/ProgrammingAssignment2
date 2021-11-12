#Programming Assignement 2 - cache 	Matrix

#starting the code
makeCacheMatrix <- function(x = matrix()) { #The makeCacheMatrix function is responsible for creating a "matrix" object, which can store its inverse
  f <- NULL
  set <- function(y){ 
  x <<- y # "<<-" operator can be used to assign a value to an object in an environment that is different from the current environment
  f <<- NULL # The key to managing variables at different levels is the double arrow assignment operator <<-
  }          #Unlike the usual single arrow assignment (<-) that always works on the current level, the double arrow operator can modify variables in parent levels.
  get <- function()x
  setInverse <- function(inverse) f <<- inverse
  getInverse <- function() f 
  list(set = set, get = get, 
  setInverse = setInverse, 
  getInverse = getInverse)
}


# The function below (cacheSolve) calculates the inverse of the special object given by the function above, which we view in this exercise as a "matrix".

cacheSolve <- function(x, ...) { #See? We have dot dot dot too 
        ## Return a matrix that is the inverse of 'x'
  f <- x$getInverse()
  if(!is.null(f)){
  message("getting cached data")
  return(f)
  }
  mat <- x$get()
  f <- solve(mat,...)
  x$setInverse(f)
  f 
} 
