-- Création de la base de données
CREATE DATABASE IF NOT EXISTS Bibliotheque;
USE Bibliotheque;

-- Table des utilisateurs
CREATE TABLE Utilisateurs (
    id_utilisateur INT AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    prenom VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    mot_de_passe VARCHAR(255) NOT NULL,
    role ENUM('Utilisateur', 'Administrateur') DEFAULT 'Utilisateur',
    date_creation TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des livres
CREATE TABLE Livres (
    id_livre INT AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(200) NOT NULL,
    auteur VARCHAR(150) NOT NULL,
    categorie VARCHAR(100),
    annee_publication YEAR,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    date_ajout TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table des stocks
CREATE TABLE Stocks (
    id_stock INT AUTO_INCREMENT PRIMARY KEY,
    id_livre INT NOT NULL,
    quantite_total INT NOT NULL,
    quantite_disponible INT NOT NULL,
    FOREIGN KEY (id_livre) REFERENCES Livres(id_livre) ON DELETE CASCADE
);

-- Table des emprunts
CREATE TABLE Emprunts (
    id_emprunt INT AUTO_INCREMENT PRIMARY KEY,
    id_utilisateur INT NOT NULL,
    id_livre INT NOT NULL,
    date_emprunt DATE NOT NULL,
    date_retour_prevue DATE NOT NULL,
    date_retour_effective DATE,
    statut ENUM('En cours', 'Retourné', 'En retard') DEFAULT 'En cours',
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE,
    FOREIGN KEY (id_livre) REFERENCES Livres(id_livre) ON DELETE CASCADE
);

-- Table des notifications
CREATE TABLE Notifications (
    id_notification INT AUTO_INCREMENT PRIMARY KEY,
    id_utilisateur INT NOT NULL,
    message TEXT NOT NULL,
    date_envoi TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    statut ENUM('Non lu', 'Lu') DEFAULT 'Non lu',
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE
);

-- Table des recommandations
CREATE TABLE Recommandations (
    id_recommandation INT AUTO_INCREMENT PRIMARY KEY,
    id_utilisateur INT NOT NULL,
    id_livre INT NOT NULL,
    date_recommandation TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE,
    FOREIGN KEY (id_livre) REFERENCES Livres(id_livre) ON DELETE CASCADE
);

-- Table des logs pour les statistiques
CREATE TABLE Logs (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_utilisateur INT NOT NULL,
    action VARCHAR(255) NOT NULL,
    date_action TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE
);

-- Insertion de données initiales pour les tests
INSERT INTO Utilisateurs (nom, prenom, email, mot_de_passe, role) VALUES
('Admin', 'Principal', 'admin@bibliotheque.com', 'admin_password', 'Administrateur'),
('Jean', 'Dupont', 'jean.dupont@gmail.com', 'password123', 'Utilisateur');

INSERT INTO Livres (titre, auteur, categorie, annee_publication, isbn) VALUES
('Les Misérables', 'Victor Hugo', 'Roman', 1862, '9781234567890'),
('1984', 'George Orwell', 'Dystopie', 1949, '9781234567891'),
('Le Petit Prince', 'Antoine de Saint-Exupéry', 'Conte', 1943, '9781234567892');

INSERT INTO Stocks (id_livre, quantite_total, quantite_disponible) VALUES
(1, 5, 5),
(2, 3, 3),
(3, 10, 10);
