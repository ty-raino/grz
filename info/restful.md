A RESTful route is a route that provides mapping between HTTP verbs (get, post, put, delete, patch) to controller CRUD actions (create, read, update, delete). Instead of relying solely on the URL to indicate what site to visit, a RESTful route also depends on the HTTP verb and the URL.

When your application receives an HTTP request, it introspects on that request and identifies the HTTP method and URL, connects that with a corresponding controller action that has that method and URL, executes the code in that action, and determines which response gets sent back to the client.



## Routes Overview | Magazine Website example

### Verb
```
get 
```

### Route
```
'/articles
```
### Action

`
| Index Action |
`

### Used For

`
| Index page to display all articles |
`




