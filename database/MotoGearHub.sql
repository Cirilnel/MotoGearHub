DROP SCHEMA IF EXISTS MotoGearHub;
CREATE SCHEMA MotoGearHub;

USE MotoGearHub;

CREATE TABLE Utente (
    Email VARCHAR(100),
    Username VARCHAR(50),
    Password VARCHAR(64),
    Nome VARCHAR(100),
    Cognome VARCHAR(100),
    is_admin BOOLEAN,
    PRIMARY KEY (Email),
    UNIQUE (Username)
);

CREATE TABLE Carrello (
    IdCarrello INT PRIMARY KEY,
    Totale DECIMAL(10, 2),
    NumeroDiProdotti INT,
    EmailUtente VARCHAR(100),
    FOREIGN KEY (EmailUtente) REFERENCES Utente(Email)
);

CREATE TABLE Categoria (
    IdCategoria INT PRIMARY KEY,
    NomeCategoria VARCHAR(100)
);

CREATE TABLE Prodotto (
    IdProdotto INT PRIMARY KEY,
    Marca VARCHAR(100),
    Image VARCHAR(100),
    Prezzo DECIMAL(10, 2),
    QuantitaInMagazzino INT,
    Nome VARCHAR(100),
    Descrizione TEXT,
    IdCategoria INT,
    FOREIGN KEY (IdCategoria) REFERENCES Categoria(IdCategoria)
);

CREATE TABLE MetodoPagamento (
    IdMetodoPagamento INT PRIMARY KEY,
    NomeBanca VARCHAR(100),
    TipoDiCarta VARCHAR(50),
    Iban VARCHAR(34)
);

CREATE TABLE Ordine (
    ID_ordine INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    NCarta VARCHAR(16) NOT NULL,
    email VARCHAR(50) NOT NULL,
    data DATE NOT NULL,
    spesa FLOAT NOT NULL,
    indirizzo VARCHAR(50) NOT NULL,
    FOREIGN KEY (email) REFERENCES Utente(email),
    FOREIGN KEY (NCarta) REFERENCES Metodo_Di_Pagamento(NCarta)
);

CREATE TABLE Spedizione (
    IdSpedizione INT PRIMARY KEY,
    IndirizzoSpedizione VARCHAR(200),
    GiornoDiArrivo DATE,
    Corriere VARCHAR(100)
);

CREATE TABLE Stivale (
    IdStivale INT PRIMARY KEY,
    LivelloDiProtezione VARCHAR(50),
    Taglia VARCHAR(10)
);

CREATE TABLE Pneumatici (
    IdPneumatici INT PRIMARY KEY,
    Tipologia VARCHAR(50),
    Misura VARCHAR(10),
    Pressione DECIMAL(5, 2)
);

CREATE TABLE Casco (
    IdCasco INT PRIMARY KEY,
    LivelloDiProtezione VARCHAR(50),
    Tipologia VARCHAR(50)
);

CREATE TABLE Abbigliamento (
    IdAbbigliamento INT PRIMARY KEY,
    Tipologia VARCHAR(50),
    Taglia VARCHAR(10),
    LivelloDiProtezione VARCHAR(50)
);

CREATE TABLE Guanti (
    IdGuanti INT PRIMARY KEY,
    Tipologia VARCHAR(50),
    LivelloDiProtezione VARCHAR(50)
);

CREATE TABLE Contiene (
    IdCarrello INT,
    IdProdotto INT,
    Quantita INT,
    PRIMARY KEY (IdCarrello, IdProdotto),
    FOREIGN KEY (IdCarrello) REFERENCES Carrello(IdCarrello),
    FOREIGN KEY (IdProdotto) REFERENCES Prodotto(IdProdotto)
);

CREATE TABLE Contenente (
    IdOrdine INT,
    IdProdotto INT,
    Quantita INT,
    PrezzoDiAcquisto DECIMAL(10, 2),
    PRIMARY KEY (IdOrdine, IdProdotto),
    FOREIGN KEY (IdOrdine) REFERENCES Ordine(IdOrdine),
    FOREIGN KEY (IdProdotto) REFERENCES Prodotto(IdProdotto)
);

CREATE TABLE UtenteCarrello (
    EmailUtente VARCHAR(100),
    IdCarrello INT,
    PRIMARY KEY (EmailUtente, IdCarrello),
    FOREIGN KEY (EmailUtente) REFERENCES Utente(Email),
    FOREIGN KEY (IdCarrello) REFERENCES Carrello(IdCarrello)
);

CREATE TABLE UtenteOrdine (
    EmailUtente VARCHAR(100),
    IdOrdine INT,
    PRIMARY KEY (EmailUtente, IdOrdine),
    FOREIGN KEY (EmailUtente) REFERENCES Utente(Email),
    FOREIGN KEY (IdOrdine) REFERENCES Ordine(IdOrdine)
);


CREATE TABLE OrdineSpedizione (
    IdOrdine INT,
    IdSpedizione INT,
    PRIMARY KEY (IdOrdine, IdSpedizione),
    FOREIGN KEY (IdOrdine) REFERENCES Ordine(IdOrdine),
    FOREIGN KEY (IdSpedizione) REFERENCES Spedizione(IdSpedizione)
);

-- Inserimento dati

INSERT INTO Utente (Email, Username, Password, Nome, Cognome, is_admin) VALUES
('mario.rossi@example.com', 'mrossi', 'cGFzc3dvcmQx', 'Mario', 'Rossi', FALSE),
('luigi.bianchi@example.com', 'lbianchi', 'cGFzc3dvcmQy', 'Luigi', 'Bianchi', FALSE),
('admin@example.com', 'admin', 'YWRtaW5wYXNz', 'Admin', 'Admin', TRUE);

INSERT INTO Carrello (IdCarrello, Totale, NumeroDiProdotti, EmailUtente) VALUES
(1, 100.50, 3, 'mario.rossi@example.com'),
(2, 50.75, 2, 'luigi.bianchi@example.com');


INSERT INTO Categoria (IdCategoria, NomeCategoria) VALUES
(1, 'Stivale'),
(2, 'Pneumatici'),
(3, 'Casco'),
(4, 'Abbigliamento'),
(5, 'Guanti');

INSERT INTO Prodotto (IdProdotto, Marca,Image, Prezzo, QuantitaInMagazzino, Nome, Descrizione, IdCategoria) VALUES
(1, 'Alpinestars','product-1.jpg', 999.95, 5, 'ALPINESTARS SUPERTECH R10', 'Casco Integrale in Fibra della ALPINESTARS Modello SUPERTECH R10', 3),
(2, 'Dainese','product-2.jpg' ,309.95, 9, 'DAINESE VR46 DAEMON-X SAFETY HOODIE FULL ZIP', 'Felpa Dainese in morbido tessuto con protezioni morbide Pro-Shape 2.0', 4),
(3, 'Raven','product-3.jpg' ,219.99, 20, 'RAVEN JEANS', 'Jeans atletici slim fit con protezioni premium CE Livello 2', 4),
(4, 'Alpinestars','product-4.jpg',599.95, 3, 'ALPINESTARS GP FORCE PHANTOM', 'La tuta in pelle GP Force Phantom è realizzata in pelle bovina per una resistenza senza limiti!', 4),
(5, 'Mototecnica','product-5.jpg',180.00, 10, 'STIVALI MOTOTECNICA', 'Stivali Touring impermeabili e confortevoli, con protezioni integrate, suola in gomma antiscivolo e chiusura con velcro regolabile.', 1),
(6,'Alpinestars','product-6.jpg',179.00,30,'ALPINESTARS GUANTI MOTO IN PELLE GP PLUS R V2 NERO/ROSSO FLUO','Guanti in ecopelle Alpinestars Neri/Rossi Fluo',5),
(7,'Dainese','product-7.jpg',209.95,15,'GIUBBOTTO GIACCA MOTO DAINESE AVRO D2','La giacca Dainese Avro D2 Tex dal look aggressivo è realizzata in tessuto leggero D-Synth 350 con inserti Microelastic per una vestibilità confortevole ed ideale per la guida in moto',4),
(8,'Pirelli','product-8.jpg',240.00,7,'Pirelli Diablo Rosso Corsa 2','Pneumatici da corsa Pirelli, colore rosso Ferrari',2);




INSERT INTO Spedizione (IdSpedizione, IndirizzoSpedizione, GiornoDiArrivo, Corriere) VALUES
(1, 'Via Roma 1, Milano', '2024-05-03', 'CorriereA'),
(2, 'Via Milano 2, Roma', '2024-05-04', 'CorriereB');

INSERT INTO Stivale (IdStivale, LivelloDiProtezione, Taglia) VALUES
(1, 'Alta', 'M'),
(2, 'Media', 'L');

INSERT INTO Pneumatici (IdPneumatici, Tipologia, Misura, Pressione) VALUES
(1, 'Estivo', '205/55R16', 2.2),
(2, 'Invernale', '195/65R15', 2.5);

INSERT INTO Casco (IdCasco, LivelloDiProtezione, Tipologia) VALUES
(1, 'Alta', 'Integrale'),
(2, 'Media', 'Jet');

INSERT INTO Abbigliamento (IdAbbigliamento, Tipologia, Taglia, LivelloDiProtezione) VALUES
(1, 'Giacca', 'M', 'Alta'),
(2, 'Pantaloni', 'L', 'Media');

INSERT INTO Guanti (IdGuanti, Tipologia, LivelloDiProtezione) VALUES
(1, 'Invernale', 'Alta'),
(2, 'Estivo', 'Media');

