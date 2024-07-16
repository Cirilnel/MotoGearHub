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
    IdOrdine INT PRIMARY KEY,
    Costo DECIMAL(10, 2),
    Data DATE,
    EmailUtente VARCHAR(100),
    IdMetodoPagamento INT,
    FOREIGN KEY (EmailUtente) REFERENCES Utente(Email),
    FOREIGN KEY (IdMetodoPagamento) REFERENCES MetodoPagamento(IdMetodoPagamento)
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

CREATE TABLE MetodoPagamentoOrdine (
    IdMetodoPagamento INT,
    IdOrdine INT,
    PRIMARY KEY (IdMetodoPagamento, IdOrdine),
    FOREIGN KEY (IdMetodoPagamento) REFERENCES MetodoPagamento(IdMetodoPagamento),
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
(1, 'MarcaA','Image1', 25.00, 100, 'Prodotto1', 'Descrizione del prodotto 1', 1),
(2, 'MarcaB','Image2' ,50.00, 50, 'Prodotto2', 'Descrizione del prodotto 2', 2),
(3, 'MarcaC','Image3' ,75.00, 30, 'Prodotto3', 'Descrizione del prodotto 3', 3),
(4, 'MarcaD','Image4',100.00, 20, 'Prodotto4', 'Descrizione del prodotto 4', 4),
(5, 'MarcaE','Image5',150.00, 10, 'Prodotto5', 'Descrizione del prodotto 5', 5);

INSERT INTO MetodoPagamento (IdMetodoPagamento, NomeBanca, TipoDiCarta, Iban) VALUES
(1, 'BancaA', 'Visa', 'IT60X0542811101000000123456'),
(2, 'BancaB', 'MasterCard', 'IT60X0542811101000000654321');

INSERT INTO Ordine (IdOrdine, Costo, Data, EmailUtente, IdMetodoPagamento) VALUES
(1, 100.50, '2024-05-01', 'mario.rossi@example.com', 1),
(2, 50.75, '2024-05-02', 'luigi.bianchi@example.com', 2);

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
