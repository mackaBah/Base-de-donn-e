-- Création d'une table utilisateurs avec les contraintes de base
CREATE TABLE utilisateurs (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    date_naissance DATE,
    date_inscription TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    statut ENUM('actif', 'inactif', 'suspendu') DEFAULT 'actif',
    
    -- Ajout des contraintes
    CONSTRAINT chk_email CHECK (email LIKE '%@%.%'),
    CONSTRAINT chk_date_naissance CHECK (date_naissance <= CURRENT_DATE)
);

-- Ajout d'index pour optimiser les recherches
CREATE INDEX idx_nom_prenom ON utilisateurs(nom, prenom);
CREATE INDEX idx_email ON utilisateurs(email);

-- Commentaires sur la table
COMMENT ON TABLE utilisateurs IS 'Table stockant les informations des utilisateurs';
COMMENT ON COLUMN utilisateurs.email IS 'Adresse email unique de l''utilisateur';
