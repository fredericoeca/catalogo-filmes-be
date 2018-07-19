var connectionFactory = require('../infra/connectionFactory');
var dateFormat = require('dateformat');

module.exports = function (app) {

    app.get('/api/artistas', function (req, res) {

        var connection = connectionFactory();
        var response = [];

        connection.query('SELECT a.art_id, a.art_nome, a.art_atividade, a.art_nascimento, a.art_foto, n.nas_nome FROM artista AS a ' +
            ' INNER JOIN nascionalidade AS n ON a.art_nascionalidade = n.nas_id ORDER BY a.art_nome ', function (err, result) {
            result.forEach(function (artista) {
                response.push({
                    art_id: artista.art_id,
                    art_nome: artista.art_nome,
                    nas_nome: artista.nas_nome,
                    art_atividade: artista.art_atividade,
                    art_nascimento: artista.art_nascimento,
                    art_foto: artista.art_foto.toString()
                })
            });
            res.json(response || '');
        });
        connection.end();
    });

    app.get('/artistas/:id', function (req, res) {

        var connection = connectionFactory();
        var response = [];
        var id = req.params.id;

        connection.query('SELECT a.art_id, a.art_nome, a.art_atividade, a.art_nascimento, a.art_foto, n.nas_nome FROM artista AS a ' +
            ' INNER JOIN nascionalidade AS n ON a.art_nascionalidade = n.nas_id WHERE art_id = ? ', id, function (err, result) {
            result.forEach(function (artista) {
                response.push({
                    art_id: artista.art_id,
                    art_nome: artista.art_nome,
                    nas_nome: artista.nas_nome,
                    art_atividade: artista.art_atividade,
                    art_nascimento: artista.art_nascimento,
                    art_foto: artista.art_foto.toString()
                })
            });
            res.json(response[0] || '');
        });
        connection.end();
    });

    app.post('/artistas', function (req, res) {

        var connection = connectionFactory();

        var a = {
            art_id: req.body.art_id,
            art_nome: req.body.art_nome,
            art_atividade: req.body.art_atividade,
            art_nascimento: dateFormat(req.body.art_nascimento, "yyyy-mm-dd"),
            art_nascionalidade: req.body.art_nascionalidade,
            art_foto: req.body.art_foto.data
        };

        connection.query('INSERT INTO artista SET ? ', a, function (err, result) {
            if(err) {
                console.log(JSON.stringify(err));
                res.status(400).json(err);
            }
            return res.status(200).json(result);
        });

        connection.end();
    });

};