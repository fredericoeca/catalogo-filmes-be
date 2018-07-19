var connectionFactory = require('../infra/connectionFactory');

module.exports = function (app) {
    
    app.post('/login', function (req, res) {

        var connection = connectionFactory();

        var email = req.body.login;
        var senha = req.body.senha;

        console.log("Usuario: " + email + " Senha: " + senha);

        connection.query("SELECT usu_id, usu_nome, usu_login, usu_data_cadastro, usu_token FROM " +
            " usuario WHERE usu_login = '" + email + "' AND usu_senha = '" + senha + "' ", function (err, result) {

            if(err) res.status(400).json(err);

            return res.status(200).json(result[0]);
        });
        connection.end();
    });

    app.post('/register', function (req, res) {
        var connection = connectionFactory();

        var u = {
            usu_nome: req.body.usu_nome,
            usu_login: req.body.usu_login,
            usu_senha: req.body.usu_senha,
            usu_data_cadastro: req.body.usu_data_cadastro,
            usu_token: req.body.usu_token,
            usu_foto: req.body.usu_foto.data
        };

        connection.query('INSERT INTO usuario SET ? ', u, function (err, result) {
            if(err) res.status(400).json(err);

            return res.status(200).json(result);
        });
        connection.end();
    });
};