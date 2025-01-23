-- Création de la table des livres
CREATE TABLE IF NOT EXISTS Livres (
    id_livre INTEGER PRIMARY KEY AUTOINCREMENT,  -- Identifiant unique pour chaque livre
    titre TEXT NOT NULL,                         -- Titre du livre
    auteur TEXT NOT NULL,                        -- Auteur du livre
    categorie TEXT,                              -- Catégorie ou genre du livre
    annee_publication INTEGER,                   -- Année de publication
    isbn TEXT UNIQUE NOT NULL,                   -- Code ISBN unique
    stock INTEGER DEFAULT 0                      -- Nombre d'exemplaires en stock
);

-- Création de la table des utilisateurs
CREATE TABLE IF NOT EXISTS Utilisateurs (
    id_utilisateur INTEGER PRIMARY KEY AUTOINCREMENT, -- Identifiant unique de l'utilisateur
    nom TEXT NOT NULL,                                -- Nom de l'utilisateur
    prenom TEXT NOT NULL,                             -- Prénom de l'utilisateur
    email TEXT UNIQUE NOT NULL,                       -- Adresse email unique
    mot_de_passe TEXT NOT NULL,                       -- Mot de passe de l'utilisateur
    type_utilisateur TEXT CHECK(type_utilisateur IN ('Utilisateur', 'Administrateur')) NOT NULL
    -- Type d'utilisateur : soit simple utilisateur, soit administrateur
);

-- Création de la table des prêts
CREATE TABLE IF NOT EXISTS Prets (
    id_pret INTEGER PRIMARY KEY AUTOINCREMENT,     -- Identifiant unique du prêt
    id_utilisateur INTEGER NOT NULL,              -- Référence vers l'utilisateur qui emprunte
    id_livre INTEGER NOT NULL,                    -- Référence vers le livre emprunté
    date_emprunt DATE NOT NULL,                   -- Date de l'emprunt
    date_retour DATE,                             -- Date de retour (nullable)
    statut TEXT CHECK(statut IN ('En cours', 'Rendu')) DEFAULT 'En cours', -- Statut du prêt
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs (id_utilisateur), -- Contrainte clé étrangère
    FOREIGN KEY (id_livre) REFERENCES Livres (id_livre)                     -- Contrainte clé étrangère
);

-- Création de la table des notifications (optionnelle, pour enrichir le projet)
CREATE TABLE IF NOT EXISTS Notifications (
    id_notification INTEGER PRIMARY KEY AUTOINCREMENT, -- Identifiant unique de la notification
    id_utilisateur INTEGER NOT NULL,                  -- Référence vers l'utilisateur concerné
    message TEXT NOT NULL,                            -- Message de la notification
    date_notification DATE DEFAULT CURRENT_DATE,      -- Date de création de la notification
    lue BOOLEAN DEFAULT 0,                            -- Statut : 0 pour non lue, 1 pour lue
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs (id_utilisateur) -- Clé étrangère
);

-- Insertion de données initiales (livres)
INSERT INTO Livres (titre, auteur, categorie, annee_publication, isbn, stock) VALUES
('Les Misérables', 'Victor Hugo', 'Roman', 1862, '9781234567890', 5),
('1984', 'George Orwell', 'Dystopie', 1949, '9781234567891', 3),
('Le Petit Prince', 'Antoine de Saint-Exupéry', 'Conte', 1943, '9781234567892', 8),
('La Peste', 'Albert Camus', 'Philosophie', 1947, '9781234567893', 2),
('L\'Étranger', 'Albert Camus', 'Philosophie', 1942, '9781234567894', 4),
('Don Quichotte', 'Miguel de Cervantes', 'Aventure', 1605, '9781234567895', 1),
('Germinal', 'Émile Zola', 'Roman', 1885, '9781234567896', 6),
('Madame Bovary', 'Gustave Flaubert', 'Roman', 1857, '9781234567897', 7),
('Crime et Châtiment', 'Fiodor Dostoïevski', 'Roman', 1866, '9781234567898', 3),
('La Métamorphose', 'Franz Kafka', 'Fiction', 1915, '9781234567899', 5);

-- Insertion de données initiales (utilisateurs)
INSERT INTO Utilisateurs (nom, prenom, email, mot_de_passe, type_utilisateur) VALUES
('Dupont', 'Emilie', 'emilie.dupont@example.com', 'password1', 'Utilisateur'),
('Martin', 'Lucas', 'lucas.martin@example.com', 'password2', 'Utilisateur'),
('Tremblay', 'Antoine', 'antoine.tremblay@example.com', 'password3', 'Administrateur'),
('Gagnon', 'Sarah', 'sarah.gagnon@example.com', 'password4', 'Utilisateur'),
('Lefevre', 'Charlotte', 'charlotte.lefevre@example.com', 'password5', 'Administrateur');

-- Exemple de prêts (optionnel)
INSERT INTO Prets (id_utilisateur, id_livre, date_emprunt, date_retour, statut) VALUES
(1, 1, '2025-01-01', NULL, 'En cours'),
(2, 3, '2025-01-15', NULL, 'En cours'),
(3, 5, '2024-12-20', '2025-01-10', 'Rendu');
