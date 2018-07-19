var app = require('./config/express')();

var routesFilmes = require('./app/routes/filmes')(app);
var routesPaises = require('./app/routes/paises')(app);
var routesIdiomas = require('./app/routes/idiomas')(app);
var routesGeneros = require('./app/routes/generos')(app);
var routesDistribuidores = require('./app/routes/distribuidores')(app);
var routesArtistas = require('./app/routes/artistas')(app);
var routesNacionalidades = require('./app/routes/nacionalidades')(app);
var routesElencos = require('./app/routes/elenco')(app);
var routesUsuarios = require('./app/routes/usuarios')(app);

var server = app.listen(3000, function() {
    console.log("Listening on port %s...", server.address().port);
});