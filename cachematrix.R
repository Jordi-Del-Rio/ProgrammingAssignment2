## Below, there is a pair of functions that cache and compute the 
## inverse of a matrix.

## First, function creates a special "matrix" object
## that can cache its inverse.

makeCacheMatrix <- function(mtx = matrix()) {
    inverse <- NULL
    set <- function(x) {
        mtx <<- x;
        inverse <<- NULL;
    }
    get <- function() return(mtx);
    setinv <- function(inv) inverse <<- inv;
    getinv <- function() return(inverse);
    return(list(set = set, get = get, 
                setinv = setinv, 
                getinv = getinv))
}

## Second function computes the inverse of the special
## "matrix" returned by  the first function. If the inverse has
## already been calculated (and the matrix has not changed), then
## cacheSolve retrieves the inverse from the cache.

cacheSolve <- function(mtx, ...) {
    inverse <- mtx$getinv()
    if(!is.null(inverse)) {
        message("Getting cached data")
        return(inverse)
    }
    data <- mtx$get()
    invserse <- solve(data, ...)
    mtx$setinv(inverse)
    return(inverse)
}