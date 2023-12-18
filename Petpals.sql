
CREATE DATABASE PetPlatform;
use PetPlatform;

-- Pet Table
CREATE TABLE Pet (
    id INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    breed VARCHAR(255) NOT NULL,
    adopted BOOLEAN DEFAULT false
);




-- Dog Table (Inherits from Pet)
CREATE TABLE Dog (
    pet_id INT PRIMARY KEY,
    dog_breed VARCHAR(255) NOT NULL,
    FOREIGN KEY (pet_id) REFERENCES Pet(id)
);

-- Cat Table (Inherits from Pet)
CREATE TABLE Cat (
    pet_id INT PRIMARY KEY,
    cat_color VARCHAR(255) NOT NULL,
    FOREIGN KEY (pet_id) REFERENCES Pet(id)
);

-- PetShelter Table
CREATE TABLE PetShelter (
    pet_id INT PRIMARY KEY,
    FOREIGN KEY (pet_id) REFERENCES Pet(id)
);

-- Donation Table (Abstract)
CREATE TABLE Donation (
    id INT PRIMARY KEY,
    donor_name VARCHAR(255) NOT NULL,
    amount DECIMAL(10, 2) NOT NULL
);

-- CashDonation Table (Derived from Donation)
CREATE TABLE CashDonation (
    donation_id INT PRIMARY KEY,
    donation_date DATE NOT NULL,
    FOREIGN KEY (donation_id) REFERENCES Donation(id)
);

-- ItemDonation Table (Derived from Donation)
CREATE TABLE ItemDonation (
    donation_id INT PRIMARY KEY,
    item_type VARCHAR(255) NOT NULL,
    FOREIGN KEY (donation_id) REFERENCES Donation(id)
);
CREATE TABLE adoption_events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(255) NOT NULL,
    event_date DATE NOT NULL
);
CREATE TABLE participants (
    participant_id INT AUTO_INCREMENT PRIMARY KEY,
    participant_name VARCHAR(255) NOT NULL,
    event_id INT,
    FOREIGN KEY (event_id) REFERENCES adoption_events(event_id)
);
-- Insert data into participants table
INSERT INTO participants (participant_name, event_id) VALUES
('John Doe', 1),
('Jane Smith', 2),
('Bob Johnson', 3),
('Alice Williams', 4),
('Charlie Brown', 5);




-- Insert data into adoption_events table
INSERT INTO adoption_events (event_name, event_date) VALUES
('Pet Adoption Day', '2023-12-20'),
('Furry Friends Fair', '2023-12-25'),
('Paws in the Park', '2024-01-05'),
('Adopt-a-Palooza', '2024-01-15'),
('Whiskers Wonderland', '2024-02-01');


-- Insert data into Pet table
INSERT INTO Pet (id,name, age, breed) VALUES
(1,'Buddy', 3, 'Labrador'),
(2,'Mittens', 2, 'Siamese'),
(3,'Rocky', 4, 'German Shepherd'),
(4,'Whiskers', 1, 'Persian'),
(5,'Max', 2, 'Golden Retriever');

-- Insert data into Dog table
INSERT INTO Dog (pet_id, dog_breed) VALUES
(1, 'Golden Retriever'),
(3, 'Boxer'),
(5, 'Beagle'),
(2, 'Dachshund'),
(4, 'Siberian Husky');

-- Insert data into Cat table
INSERT INTO Cat (pet_id, cat_color) VALUES
(2, 'Gray'),
(4, 'White'),
(1, 'Black'),
(3, 'Orange'),
(5, 'Tabby');

-- Insert data into PetShelter table
INSERT INTO PetShelter (pet_id) VALUES
(1),
(3),
(5),
(2),
(4);

-- Insert data into Donation table
INSERT INTO Donation (id,donor_name, amount) VALUES
(1,'John Doe', 100.50),
(2,'Jane Smith', 75.25),
(3,'Bob Johnson', 50.00),
(4,'Alice Brown', 25.75),
(5,'Charlie Davis', 200.00);

-- Insert data into CashDonation table
INSERT INTO CashDonation (donation_id, donation_date) VALUES
(1, '2023-01-15'),
(3, '2023-02-01'),
(5, '2023-02-10'),
(2, '2023-01-20'),
(4, '2023-02-05');

-- Insert data into ItemDonation table
INSERT INTO ItemDonation (donation_id, item_type) VALUES
(2, 'Toys'),
(4, 'Food'),
(1, 'Bedding'),
(3, 'Collars'),
(5, 'Litter');

