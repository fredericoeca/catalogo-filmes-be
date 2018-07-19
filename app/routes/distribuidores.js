var connectionFactory = require('../infra/connectionFactory');

module.exports = function (app) {

    app.get('/distribuidores', function(req, res) {

        var connection = connectionFactory();

        connection.query('SELECT * FROM distribuidor',function (err, result) {
            if(err != null){
                console.log(err);
            }
            res.json(result);
        });

        connection.end();
    });

};
