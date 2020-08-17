CREATE DATABASE GrandCircusTripPlanner
GO
USE GrandCircusTripPlanner
GO
CREATE TABLE TripPlanner(
TripPlannerID int PRIMARY KEY IDENTITY (1,1),
TripPlannerAddress NVARCHAR(60) NOT NULL,
TripPlannerDOB DATE NOT NULL,
TripPlannerName NVARCHAR(50) NOT NULL,
TripPlannerPhoneNumber NVARCHAR(11) NOT NULL,
);


CREATE TABLE Passport(
PassportID int PRIMARY KEY IDENTITY(1,1),
PassportExpirationDate DATE NOT NULL,
PassportNumber int NOT NULL,
PassportAddress NVARCHAR(60)NOT NULL,
TripPlannerID int NOT NULL, 
CONSTRAINT Passport_TripPlanner FOREIGN KEY
(
	TripPlannerID
	) REFERENCES TripPlanner(TripPlannerID)
);


CREATE TABLE TripInfo(
TripInfoID int PRIMARY KEY IDENTITY(1,1),
TripInfoBudget float NOT NULL,
TripInfoStartDate DATE NOT NULL,
TripInfoEndDate DATE NOT NULL,
TripInfoTravelMode NVARCHAR(20)NOT NULL,
TripInfoStartingDestination NVARCHAR(50)NOT NULL,
TripInfoEndingDestination NVARCHAR (50)NOT NULL,
);


CREATE TABLE TripPlannerTripInfo(
TripPlannerTripInfo int PRIMARY KEY IDENTITY (1,1),
TripPlannerID int NOT NULL,
TripInfoID int NOT NULL,
CONSTRAINT TripPlannerTripInfo_TripPlanner FOREIGN KEY 
	(
	TripPlannerID
	) REFERENCES TripPlanner(TripPlannerID),

CONSTRAINT TripPlannerTripInfo_TripInfo FOREIGN KEY
	(
	TripInfoID
	)REFERENCES TripInfo(TripInfoID),
);



CREATE TABLE Hotel(
HotelID int PRIMARY KEY IDENTITY (1,1),
HotelCheckInDate DATE NOT NULL,
HotelCheckOutDate DATE NOT NULL,
HotelCostPerNight float NOT NULL,
HotelAddress NVARCHAR(60) NOT NULL,
HotelPhoneNumber NVARCHAR (10) NOT NULL,
);


CREATE TABLE TripInfoHotel(
TripInfoHotelID int PRIMARY KEY IDENTITY(1,1),
TripInfoID int NOT NULL,
HotelID int NOT NULL,
CONSTRAINT TripInfoHotel_TripInfo FOREIGN KEY
	(
	TripInfoID
	)REFERENCES TripInfo(TripInfoID),
CONSTRAINT TripInfoHotel_Hotel FOREIGN KEY
	(
	HotelID
	)REFERENCES Hotel(HotelID),
);


