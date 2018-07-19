var connectionFactory = require('../infra/connectionFactory');

module.exports = function (app) {

    app.get('/nacionalidades', function(req, res) {

        var connection = connectionFactory();

        connection.query('SELECT * FROM nascionalidade',function (err, result) {
            if(err != null){
                console.log(err);
            }
            res.json(result);
        });

        connection.end();
    });

}

