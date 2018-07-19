var connectionFactory = require('../infra/connectionFactory');

module.exports = function (app) {

    app.get('/filmes', function (req, res) {

        var connection = connectionFactory();
        var response = [];
        connection.query('SELECT f.fil_id, f.fil_nome, f.fil_titulo_original, f.fil_lancamento, p.pai_nome, p.pai_sigla, i.idi_nome, i.idi_sigla, d.dis_nome, g.gen_nome, ' +
            'f.fil_sinopse, f.fil_duracao, f.fil_visto, f.fil_media, f.fil_cartaz FROM filme AS f INNER JOIN pais AS p ON f.fil_pais = p.pai_id INNER JOIN idioma ' +
            'AS i ON f.fil_idioma = i.idi_id INNER JOIN distribuidor AS d ON f.fil_distribuidor = d.dis_id INNER JOIN genero AS g ON ' +
            'f.fil_genero = g.gen_id ORDER BY f.fil_lancamento DESC ',function (err, result) {
            result.forEach(function(filme) {
                response.push({
                    fil_id: filme.fil_id,
                    fil_nome: filme.fil_nome,
                    fil_titulo_original: filme.fil_titulo_original,
                    fil_lancamento: filme.fil_lancamento,
                    pai_sigla: filme.pai_sigla,
                    pai_nome: filme.pai_nome,
                    idi_nome: filme.idi_nome,
                    idi_sigla: filme.idi_sigla,
                    dis_nome: filme.dis_nome,
                    gen_nome: filme.gen_nome,
                    fil_sinopse: filme.fil_sinopse,
                    fil_duracao: filme.fil_duracao,
                    fil_visto: filme.fil_visto,
                    fil_media: filme.fil_media,
                    fil_cartaz: filme.fil_cartaz.toString()
                })
            });
            res.json(response || '');
        });

        connection.end();
    });

    app.get('/filmes/:id', function (req, res) {

        var connection = connectionFactory();
        var id = req.params.id;
        var response = [];
        connection.query('SELECT f.fil_id, f.fil_nome, f.fil_titulo_original, f.fil_lancamento, p.pai_nome,  p.pai_sigla, i.idi_nome, i.idi_sigla, d.dis_nome, g.gen_nome, ' +
            'f.fil_sinopse, f.fil_duracao, f.fil_visto, f.fil_media, f.fil_cartaz FROM filme AS f INNER JOIN pais AS p ON f.fil_pais = p.pai_id INNER JOIN idioma ' +
            'AS i ON f.fil_idioma = i.idi_id INNER JOIN distribuidor AS d ON f.fil_distribuidor = d.dis_id INNER JOIN genero AS g ON ' +
            'f.fil_genero = g.gen_id WHERE fil_id = ?', id,function (err, result) {
            result.forEach(function(filme) {
                response.push({
                    fil_id: filme.fil_id,
                    fil_nome: filme.fil_nome,
                    fil_titulo_original: filme.fil_titulo_original,
                    fil_lancamento: filme.fil_lancamento,
                    pai_sigla: filme.pai_sigla,
                    pai_nome: filme.pai_nome,
                    idi_nome: filme.idi_nome,
                    idi_sigla: filme.idi_sigla,
                    dis_nome: filme.dis_nome,
                    gen_nome: filme.gen_nome,
                    fil_sinopse: filme.fil_sinopse,
                    fil_duracao: filme.fil_duracao,
                    fil_visto: filme.fil_visto,
                    fil_media: filme.fil_media,
                    fil_cartaz: filme.fil_cartaz.toString()
                })
            });
            res.json(response[0] || '');

            /* Recuperar registro unico por id */
            //if(err != null){
            //    console.log(err);
            //}
            //res.json(result[0]);
        });

        connection.end();
    });

    app.post('/filmes', function(req, res) {

        var connection = connectionFactory();

        var f = {
            fil_nome: req.body.fil_nome,
            fil_titulo_original: req.body.fil_titulo_original,
            fil_lancamento: req.body.fil_lancamento,
            fil_pais: req.body.fil_pais,
            fil_idioma: req.body.fil_idioma,
            fil_distribuidor: req.body.fil_distribuidor,
            fil_genero: req.body.fil_genero,
            fil_sinopse: req.body.fil_sinopse,
            fil_duracao: req.body.fil_duracao,
            fil_visto: req.body.fil_visto,
            fil_media: req.body.fil_media,
            fil_cartaz: req.body.fil_cartaz.data
        };

        connection.query('INSERT INTO filme SET ? ', f, function (err, result) {
            if(err) res.status(400).json(err);

            return res.status(200).json(result);
        });

        connection.end();
    });

    app.put('/filmes', function (req, res) {

        /*var connection = connectionFactory();

         connection.query('SELECT * FROM filme',function (err, result) {
         if(err != null){
         console.log(err);
         }
         res.json(result);
         });

         connection.end();*/
        res.end('put teste ok');

    });

    app.delete('/filmes/:id', function (req, res) {

        var connection = connectionFactory();
        var id = req.params.id;

        connection.query('DELETE FROM filme WHERE fil_id = ?', id,function (err, result) {
            if(err != null){
                console.log(err);
            }
            res.json(result);
        });
    
        connection.end();

    });
    
}