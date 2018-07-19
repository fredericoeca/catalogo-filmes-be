var connectionFactory = require('../infra/connectionFactory');

module.exports = function (app) {

    app.get('/elencos', function (req, res) {

        var connection = connectionFactory();
        var response = [];

        connection.query('SELECT e.ele_id, f.fil_nome, a.art_nome, a.art_foto FROM elenco AS e INNER JOIN filme AS f ON e.ele_filme = f.fil_id ' +
            ' INNER JOIN artista AS a ON e.ele_artista = a.art_id ', function (err, result) {
            result.forEach(function (elenco) {
                response.push({
                    ele_id: elenco.ele_id,
                    fil_nome: elenco.fil_nome,
                    art_nome: elenco.art_nome,
                    art_foto: elenco.art_foto.toString(),
                    ele_atividade: elenco.ele_atividade
                })
            });
            res.json(response || '');
        });
        connection.end();
    });

    app.get('/elencos/elenco', function (req, res) {

        var connection = connectionFactory();
        var response = [];
        var filme = req.query.filme;

        connection.query('SELECT e.ele_id, f.fil_nome, a.art_nome, a.art_foto, e.ele_atividade FROM elenco AS e INNER JOIN filme AS f ON e.ele_filme = f.fil_id ' +
            ' INNER JOIN artista AS a ON e.ele_artista = a.art_id WHERE e.ele_filme = ?', filme, function (err, result) {
            result.forEach(function (elenco) {
                response.push({
                    ele_id: elenco.ele_id,
                    fil_nome: elenco.fil_nome,
                    art_nome: elenco.art_nome,
                    art_foto: elenco.art_foto.toString(),
                    ele_atividade: elenco.ele_atividade
                })
            });
            res.json(response    || '');
        });
        connection.end();
    });

    app.post('/elencos', function (req, res) {

        var connection = connectionFactory();

        var e = {   
            ele_filme: req.body.ele_filme,
            ele_artista: req.body.ele_artista,
            ele_atividade: req.body.ele_atividade
        };

        connection.query('INSERT INTO elenco SET ? ', e, function (err, result) {
            if(err) res.status(400).json(err);

            return res.status(200).json(result);
        });

        connection.end();
    })

};