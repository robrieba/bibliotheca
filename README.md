## Bibliotheca
A sample library system.
### Overview

This application models a simplistic library system.  Libraries with their collections can be viewed.  Books may be requested. An administrator can perform CRUD on library and book data by entering an administration mode.

The collections of each library may be searched by title or ISBN.  Search results will include books held both by the current branch and by other branches in the system.  That a book is available by interlibrary loan is indicated in the results.

Requests may be made for books from either the current branch or other branches via interlibrary loan (ILL).  Each library tracks the most requested book, even if this book is held in the collection of another library.  For instance, if “The Hobbit” is being held by Library A, it may still be the most requested book at Library B.

### Technology Used
- Rails 4 (4.2.3)
- Bootstrap
- JQuery
- ProstgreSQL

### Limitations

Since this application is a toy, there is much room for improvement.

#### Frontend

The frontend is clean, readable, functional and unattractive.  
- Bootstrap is used to make it moderately attractive.  
- Sample data includes thumbnail images from [placehold.it](http://placehold.it), introducing a noticeable performance hit before the images are cached.  
- JQuery and general AJAX usage is minimal.  
- The entire application would benefit from the eye of a designer.

#### Backend

Since the application is a toy, the database model is limited.  Models only exist for Libraries, Books, and Requests.  
- A stub was placed within the book table for tracking copies.  Since requests are merely queued, not processed, nothing happens with the copy field.  
- A real application would separate a book's profile from its instance and properly process requests based upon its availability.  
- In a busy library system, Redis might serve well for tracking the most requested books.  At the very least, this query could be more efficient (as a stored procedure, a cached value, or other).
- "Administration mode" is nothing but a proof-of-concept implemented by toggling a session variable.
- Data validation is minimal. Notably, image link validation (there are several gems for this) and ISBN validation ([there's gem for that](https://rubygems.org/gems/isbn_validation/versions/1.2.2)) are missing. These gems were not included in order to reduce complexity and testing time (and because this is not a real application).
