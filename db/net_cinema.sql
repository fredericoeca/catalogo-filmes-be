/* Criando banco do Net Cinema */
CREATE DATABASE net_cinema;

USE net_cinema;

/* Tabela de filmes */
CREATE TABLE filme(
fil_id INT NOT NULL AUTO_INCREMENT,
fil_nome VARCHAR(64),
fil_titulo_original VARCHAR(64),
fil_lancamento VARCHAR(8),
fil_pais INT NOT NULL,
fil_idioma INT NOT NULL,
fil_distribuidor INT NOT NULL,
fil_genero INT NOT NULL,
fil_sinopse VARCHAR(400),
fil_duracao VARCHAR(16),
fil_visto TINYINT,
fil_media TINYINT,	
CONSTRAINT filme_pk PRIMARY KEY(fil_id),
KEY pais_filme_fk(fil_pais),
KEY idioma_filme(fil_idioma),
KEY distribuidor_filme(fil_distribuidor),
KEY genero_filme(fil_genero),
CONSTRAINT pais_filme_fk FOREIGN KEY (fil_pais) REFERENCES pais(pai_id),
CONSTRAINT idioma_filme_fk FOREIGN KEY (fil_idioma) REFERENCES idioma(idi_id),
CONSTRAINT distribuidor_filme_fk FOREIGN KEY (fil_distribuidor) REFERENCES distribuidor(dis_id),
CONSTRAINT genero_filme_fk FOREIGN KEY (fil_genero) REFERENCES genero(gen_id));

SET FOREIGN_KEY_CHECKS=1;

/* Tabela País */
CREATE TABLE pais(
pai_id INT NOT NULL AUTO_INCREMENT,
pai_nome VARCHAR(64),
pai_sigla VARCHAR(10),
CONSTRAINT pais_pk PRIMARY KEY (pai_id));

/* Tabela Idioma */
CREATE TABLE idioma(
idi_id INT NOT NULL AUTO_INCREMENT,
idi_pais INT NOT NULL,
idi_nome VARCHAR(64),
idi_sigla VARCHAR(10),
CONSTRAINT idioma_pk PRIMARY KEY (idi_id),
KEY pais_idioma_fk(idi_pais),
CONSTRAINT pais_idioma_fk FOREIGN KEY (idi_pais) REFERENCES pais(pai_id));

/* Tabela Genero */
CREATE TABLE genero(
gen_id INT NOT NULL AUTO_INCREMENT,
gen_nome VARCHAR(64),
CONSTRAINT genero_pk PRIMARY KEY (gen_id));

/* Tabela Idioma */
CREATE TABLE distribuidor(
dis_id INT NOT NULL AUTO_INCREMENT,
dis_nome VARCHAR(64),
CONSTRAINT distribuidor_pk PRIMARY KEY (dis_id));

/* Lista de filmes com nomes das Foreign Key */
SELECT f.fil_id, f.fil_nome, f.fil_titulo_original, f.fil_lancamento, p.pai_nome, i.idi_nome, d.dis_nome, g.gen_nome, f.fil_sinopse, f.fil_duracao,
f.fil_visto, f.fil_media FROM filme AS f INNER JOIN pais AS p ON f.fil_pais = p.pai_id INNER JOIN idioma AS i ON f.fil_idioma = i.idi_id 
INNER JOIN distribuidor AS d ON f.fil_distribuidor = d.dis_id INNER JOIN genero AS g ON f.fil_genero = g.gen_id; 

/* Lista de Distribuidores */
INSERT INTO distribuidor(dis_nome) VALUES ("20th Century Fox");
INSERT INTO distribuidor(dis_nome) VALUES ("Paramount Pictures");
INSERT INTO distribuidor(dis_nome) VALUES ("MTV Films");
INSERT INTO distribuidor(dis_nome) VALUES ("Nickelodeon Movies");
INSERT INTO distribuidor(dis_nome) VALUES ("DreamWorks");
INSERT INTO distribuidor(dis_nome) VALUES ("Sony Pictures");
INSERT INTO distribuidor(dis_nome) VALUES ("Columbia Pictures");
INSERT INTO distribuidor(dis_nome) VALUES ("TriStar Pictures");
INSERT INTO distribuidor(dis_nome) VALUES ("NBC Universal");
INSERT INTO distribuidor(dis_nome) VALUES ("Universal Studios");
INSERT INTO distribuidor(dis_nome) VALUES ("Warner Bros.");
INSERT INTO distribuidor(dis_nome) VALUES ("New Line Cinema");
INSERT INTO distribuidor(dis_nome) VALUES ("HBO Films");
INSERT INTO distribuidor(dis_nome) VALUES ("Disney Channel");
INSERT INTO distribuidor(dis_nome) VALUES ("Walt Disney Pictures");
INSERT INTO distribuidor(dis_nome) VALUES ("Hollywood Pictures");
INSERT INTO distribuidor(dis_nome) VALUES ("Touchstone Pictures");
INSERT INTO distribuidor(dis_nome) VALUES ("Pixar Animation");
INSERT INTO distribuidor(dis_nome) VALUES ("Miramax Films");
INSERT INTO distribuidor(dis_nome) VALUES ("Marvel Studios");
INSERT INTO distribuidor(dis_nome) VALUES ("Lucasfilm");
INSERT INTO distribuidor(dis_nome) VALUES ("ABC Studios.");
INSERT INTO distribuidor(dis_nome) VALUES ("Warner Independent");
INSERT INTO distribuidor(dis_nome) VALUES ("Castle Rock");

/* Lista de Generos */
INSERT INTO genero(gen_nome) VALUES ("Ação");
INSERT INTO genero(gen_nome) VALUES ("Animação");
INSERT INTO genero(gen_nome) VALUES ("Aventura");
INSERT INTO genero(gen_nome) VALUES ("Comédia");
INSERT INTO genero(gen_nome) VALUES ("Comédia Romântica");
INSERT INTO genero(gen_nome) VALUES ("Comédia Dramática");
INSERT INTO genero(gen_nome) VALUES ("Cult");
INSERT INTO genero(gen_nome) VALUES ("Dança");
INSERT INTO genero(gen_nome) VALUES ("Documentário");
INSERT INTO genero(gen_nome) VALUES ("Drama");
INSERT INTO genero(gen_nome) VALUES ("Espioangem");
INSERT INTO genero(gen_nome) VALUES ("Fantasia");
INSERT INTO genero(gen_nome) VALUES ("Faroeste");
INSERT INTO genero(gen_nome) VALUES ("Ficção Científica");
INSERT INTO genero(gen_nome) VALUES ("Guerra");
INSERT INTO genero(gen_nome) VALUES ("Musical");
INSERT INTO genero(gen_nome) VALUES ("Policial");
INSERT INTO genero(gen_nome) VALUES ("Romance");
INSERT INTO genero(gen_nome) VALUES ("Suspense");
INSERT INTO genero(gen_nome) VALUES ("Terror");

/* Lista de Idiomas */
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Espanhol",1,"es-ar");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",2,"en-au");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Alemão",3,"de-at");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Francês",4,"fr-be");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Holandês",4,"nl-be");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Português",5,"pt-br");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",6,"en-ca");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Francês",6,"fr-ca");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Espanhol",7,"es-cl");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Chinês",8,"zh-cn");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Espanhol",9,"es-co");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Croata",10,"hr");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Dinamarquês",12,"da");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Arabe",13,"ar-eg");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Espanho",14,"es");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Finlandesa",15,"fi");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Francês",16,"fr");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",17,"en");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",17,"en-gb");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Alemão",18,"de");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Grego",19,"el");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Chinês",20,"hk");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Hindi",21,"oi");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Persa",22,"fa");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",23,"en-ie");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Irlandês",23,"ga");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Italiano",24,"it");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Japonês",25,"ja");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Coreano",26,"ko");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Espanhol",27,"es-mx");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Holandês",28,"nl");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",29,"en-nz");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Português",30,"pt");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",31,"en-za");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Russo",32,"ru");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Sueco",33,"sv");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Alemão",34,"de-ch");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Francês",34,"fr-ch");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Italiano",34,"it-ch");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Árabe",35,"ar-ae");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Ucraniano",36,"uk");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Espanhol",37,"es-uy");
INSERT INTO idioma(idi_nome,idi_pais,idi_sigla) VALUES ("Inglês",38,"en-us");

/* Lista Paises */
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Argentina","ARG");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Austrália","AUS");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Áustria","AUT");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Bélgica","BEL");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Brasil","BRA");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Canadá","CAN");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Chile","CHI");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("China","CHN");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Colômbia","COL");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Croácia","CRO");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Cuba","CUB");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Dinamarca","DEN");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Egito","EGY");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Espanha","ESP");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Finlândia","FIN");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("França","FRA");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Grã Bretanha","GBR");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Alemanha","GER");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Grécia","GRE");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Hong Kong","HKG");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("India","IND");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Irã","IRI");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Irlanda","IRL");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Itália","ITA");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Japão","JPN");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Coréia do Sul","KOR");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("México","MEX");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Holanda","NED");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Nova Zelândia","NZL");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Portugal","POR");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Africa do Sul","RSA");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Rússia","RUS");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Suécia","SWE");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Suíça","SWI");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Emirados Árabes Unidos","UAE");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Ucrânia","UKR");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Uruguai","URU");
INSERT INTO pais(pai_nome,pai_sigla) VALUES ("Estados Unidos","USA");
