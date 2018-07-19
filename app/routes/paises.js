var connectionFactory = require('../infra/connectionFactory');

module.exports = function (app) {

    app.get('/paises', function(req, res) {

        var connection = connectionFactory();

        connection.query('SELECT * FROM pais',function (err, result) {
            if(err != null){
                console.log(err);
            }
            res.json(result);
        });

        connection.end();
    });

    app.get('/paises/:id', function (req, res) {

        var connection = connectionFactory();
        var id = req.params.id;

        connection.query('SELECT * FROM pais WHERE pai_id = ?', id,function (err, result) {
            if(err != null){
                console.log(err);
            }
            res.json(result);
        });

        connection.end();
    });

}

