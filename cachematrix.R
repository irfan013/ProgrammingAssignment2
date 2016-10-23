## Put comments here that give an overall description of what your
## functions do
## Write a short comment describing this function
# makeCacheMatrix is a function that returns a list of functions
# Its puspose is to store a martix and a cached value of the inverse of the 
# matrix. Contains the following functions:
# * setMat      set the value of a matrix
# * getMat      get the value of a matrix
# * cInverse   get the cahced value (inverse of the matrix)
# * getInv     get the cahced value (inverse of the matrix)



makeCacheMatrix <- function(x = matrix()) {
        # initially nothing is cached so set c (cache) it to NULL
        c <- NULL
        
        # storing the matrix
        setMat<- function(newValue) {
                x <<- newValue
        # As the matrix is assigned a new value, flush the c(cache)
                c <<- NULL
        }

        # returns the matrix which is stored earliter
        getMat<- function() {
                x
        }

        # cache the given argument 
        cInverse <- function(solve) {
                c <<- solve
        }

        # get the cached value
        getInv <- function() {
                c
        }
        
        # return a list. Each named element of the list is a function
        list(setMatrix = setMat, getMat = getMat, cInverse = cInverse, getInv = getInv)
}

}


## Write a short comment describing this function

cacheSolve <- function(y, ...) { 
	  # get the cached value
        inv <- y$getInv()
        # if a cached value exists return it
        if(!is.null(inv)) {
                message("getting cached data")
                return(inv)
        }
        # otherwise get the matrix, caclulate the inverse and store it in
        # the cache
        data <- y$getMat()
        inv <- solve(data)
        y$cInverse(inv)
        
        # return the inverse
        inv
}
}
