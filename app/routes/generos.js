var connectionFactory = require('../infra/connectionFactory');

module.exports = function (app) {

    app.get('/generos', function(req, res) {

        var connection = connectionFactory();

        connection.query('SELECT * FROM genero',function (err, result) {
            if(err != null){
                console.log(err);
            }
            res.json(result);
        });

        connection.end();
    });
    
}