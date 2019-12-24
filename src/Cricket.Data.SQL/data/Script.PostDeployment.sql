﻿/* Post-Deployment Script */

/* Sample data for table [dbo].[User] */
INSERT [dbo].[User] ([UserName], [DisplayName], [IsAdmin]) VALUES ('UCA\Ullas Antony', 'Ullas Antony', 1);
GO

/* Sample data for table [dbo].[Team] */
INSERT [dbo].[Team] ([Code], [Name], [ColourPrimary], [ColourSecondary]) VALUES ('AUS', 'Australia', 'ffcd00', '00843d');
INSERT [dbo].[Team] ([Code], [Name], [ColourPrimary], [ColourSecondary]) VALUES ('BDS', 'Bangladesh', '016938', 'e10d02');
INSERT [dbo].[Team] ([Code], [Name], [ColourPrimary], [ColourSecondary]) VALUES ('ENG', 'England', '85defd', '1b4199');
INSERT [dbo].[Team] ([Code], [Name], [ColourPrimary], [ColourSecondary]) VALUES ('IND', 'India', '0381fa', 'ff431d');
INSERT [dbo].[Team] ([Code], [Name], [ColourPrimary], [ColourSecondary]) VALUES ('KEN', 'Kenya', '28704b', 'bb1824');
INSERT [dbo].[Team] ([Code], [Name], [ColourPrimary], [ColourSecondary]) VALUES ('NZ', 'New Zealand', 'f0e5e2', '000000');
INSERT [dbo].[Team] ([Code], [Name], [ColourPrimary], [ColourSecondary]) VALUES ('PAK', 'Pakistan', 'c0e57e', '354e38');
INSERT [dbo].[Team] ([Code], [Name], [ColourPrimary], [ColourSecondary]) VALUES ('SA', 'South Africa', '74cc68', 'e9f271');
INSERT [dbo].[Team] ([Code], [Name], [ColourPrimary], [ColourSecondary]) VALUES ('SL', 'Sri Lanka', '2e4787', 'ffe73c');
INSERT [dbo].[Team] ([Code], [Name], [ColourPrimary], [ColourSecondary]) VALUES ('WI', 'West Indies', 'a5183b', 'f5dc3a');
INSERT [dbo].[Team] ([Code], [Name], [ColourPrimary], [ColourSecondary]) VALUES ('ZIM', 'Zimbabwe', 'd70109', 'f4cd0e');
GO

/* Sample data for table [dbo].[Player] */
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'WI'), 'Vivian', 'Isaac Alexander', 'Richards', CAST('1952-Mar-07' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'ENG'), 'Graham', 'Alan', 'Gooch', CAST('1953-Jul-23' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'WI'), 'Desmond', 'Leo', 'Haynes', CAST('1956-Feb-15' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'PAK'), 'Javed', 'Mohammad Khan', 'Miandad', CAST('1957-Jun-12' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'AUS'), 'David', 'Clarence', 'Boon', CAST('1960-Dec-29' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'NZ'), 'Martin', 'David', 'Crowe', CAST('1962-Sep-22' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'SL'), 'Arjuna', '', 'Ranatunga', CAST('1963-Dec-01' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'IND'), 'Mohammad', '', 'Azharuddin', CAST('1963-Feb-08' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'AUS'), 'Mark', 'Edward', 'Waugh', CAST('1965-Jun-02' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'AUS'), 'Stephen', 'Rodger', 'Waugh', CAST('1965-Jun-02' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'SL'), 'Aravinda', 'Pinnaduwage', 'de Silva', CAST('1965-Oct-17' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'SA'), 'Gary', '', 'Kirsten', CAST('1967-Nov-23' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'ZIM'), 'Andrew', '', 'Flower', CAST('1968-Apr-28' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'PAK'), 'Saeed', '', 'Anwar', CAST('1968-Sep-06' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'SL'), 'Sanath ', 'Teran', 'Jayasuriya', CAST('1969-Jun-30' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'WI'), 'Brian', 'Charles', 'Lara', CAST('1969-May-02' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'KEN'), 'Stephen', 'Ogonji', 'Tikolo', CAST('1971-Jun-25' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'AUS'), 'Adam', 'Craig', 'Gilchrist', CAST('1971-Nov-14' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'AUS'), 'Matthew', 'Lawrence', 'Hayden', CAST('1971-Oct-29' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'IND'), 'Saurav', 'Chandidas', 'Ganguly', CAST('1972-Jul-08' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'NZ'), 'Stephen', 'Paul', 'Fleming', CAST('1973-Apr-01' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'IND'), 'Sachin', 'Ramesh', 'Tendulkar', CAST('1973-Apr-24' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'IND'), 'Rahul', 'Sharad', 'Dravid', CAST('1973-Jan-11' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'WI'), 'Shivnarine', '', 'Chanderpaul', CAST('1974-Aug-16' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'AUS'), 'Ricky', 'Thomas', 'Ponting', CAST('1974-Dec-19' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'SA'), 'Herschelle', 'Herman', 'Gibbs', CAST('1974-Feb-23' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'NZ'), 'Scott', 'Bernard', 'Styris', CAST('1975-Jul-10' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'SA'), 'Jacques', 'Henry', 'Kallis', CAST('1975-Oct-16' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'SL'), 'Tillakaratne', 'Mudiyanselage', 'Dilshan', CAST('1976-Oct-14' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'SL'), 'Mahela', 'Denagamage Proboth de Silva', 'Jayawardene', CAST('1977-May-27' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'SL'), 'Kumar', 'Chokshanada', 'Sangakkara', CAST('1977-Oct-27' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'IND'), 'Virender', '', 'Sehwag', CAST('1978-Oct-20' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'WI'), 'Christopher', 'Henry', 'Gayle', CAST('1979-Sep-21' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'AUS'), 'Michael', 'John', 'Clarke', CAST('1981-Apr-02' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'SA'), 'Graeme', 'Craig', 'Smith', CAST('1981-Feb-01' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'IND'), 'Mahendra', 'Singh', 'Dhoni', CAST('1981-Jul-07' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'SA'), 'Hashim', 'Mahomed', 'Amla', CAST('1983-Mar-31' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'SA'), 'Abraham', 'Benjamin', 'de Villiers', CAST('1984-Feb-17' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'SA'), 'Francois', '', 'du Plessis', CAST('1984-Jul-13' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'NZ'), 'Ross', 'Luteru Poutoa Lote', 'Taylor', CAST('1984-Mar-08' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'AUS'), 'Aaron', 'James', 'Finch', CAST('1986-Nov-17' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'AUS'), 'David', 'Andrew', 'Warner', CAST('1986-Oct-27' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'NZ'), 'Martin', 'James', 'Guptill', CAST('1986-Sep-30' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'IND'), 'Rohit', 'Gurunath', 'Sharma', CAST('1987-Apr-30' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'BDS'), 'Mushfiqur', 'Mohammad', 'Rahim', CAST('1987-Jun-09' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'BDS'), 'Shakib', '', 'Al Hasan', CAST('1987-Mar-24' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'IND'), 'Virat', '', 'Kohli', CAST('1988-Nov-05' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'AUS'), 'Steven', 'Peter Devereux', 'Smith', CAST('1989-Jun-02' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'NZ'), 'Kane', 'Stuart', 'Williamson', CAST('1990-Aug-08' AS DATE));
INSERT [dbo].[Player] ([TeamID], [GivenName], [OtherGivenNames], [FamilyName], [DateOfBirth]) VALUES ((SELECT [TeamID] FROM [dbo].[Team] WHERE [Code] = 'ENG'), 'Joseph', 'Edward', 'Root', CAST('1990-Dec-30' AS DATE));
GO

/* Sample data for table [dbo].[WorldCupPlayer] */
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Vivian' AND [FamilyName] = 'Richards'), 1975, 1987, 23, 21, 5, 1013, 181, 0, 1191, 3, 5, 0, 84, 22);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Graham' AND [FamilyName] = 'Gooch'), 1979, 1992, 21, 21, 1, 897, 115, 0, 1418, 1, 8, 1, 80, 4);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Desmond' AND [FamilyName] = 'Haynes'), 1979, 1992, 25, 25, 2, 854, 105, 0, 1485, 1, 3, 0, 67, 4);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Javed' AND [FamilyName] = 'Miandad'), 1975, 1996, 33, 30, 5, 1083, 103, 0, 1592, 1, 8, 2, 72, 3);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'David' AND [FamilyName] = 'Boon'), 1987, 1992, 16, 16, 1, 815, 100, 0, 1117, 2, 5, 0, 72, 5);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Martin' AND [FamilyName] = 'Crowe'), 1983, 1992, 21, 21, 5, 880, 100, 1, 1053, 1, 8, 1, 82, 7);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Arjuna' AND [FamilyName] = 'Ranatunga'), 1983, 1999, 30, 29, 8, 969, 88, 1, 1197, 0, 7, 3, 99, 7);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Mohammad' AND [FamilyName] = 'Azharuddin'), 1987, 1999, 30, 25, 4, 826, 93, 0, 1066, 0, 8, 2, 69, 5);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Mark' AND [FamilyName] = 'Waugh'), 1992, 1999, 22, 22, 3, 1004, 130, 0, 1199, 4, 4, 2, 87, 9);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Stephen' AND [FamilyName] = 'Waugh'), 1987, 1999, 33, 30, 10, 978, 120, 1, 1207, 1, 6, 0, 73, 13);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Aravinda' AND [FamilyName] = 'de Silva'), 1987, 2003, 35, 32, 3, 1064, 145, 0, 1229, 2, 6, 2, 107, 15);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Gary' AND [FamilyName] = 'Kirsten'), 1996, 2003, 21, 21, 4, 806, 188, 1, 1068, 1, 5, 2, 79, 7);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Andrew' AND [FamilyName] = 'Flower'), 1992, 2003, 30, 29, 4, 815, 115, 1, 1195, 1, 4, 2, 63, 3);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Saeed' AND [FamilyName] = 'Anwar'), 1996, 2003, 21, 21, 4, 915, 113, 1, 1157, 3, 3, 0, 90, 6);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Sanath ' AND [FamilyName] = 'Jayasuriya'), 1992, 2007, 38, 37, 3, 1165, 120, 0, 1285, 3, 6, 0, 120, 27);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Brian' AND [FamilyName] = 'Lara'), 1992, 2007, 34, 33, 4, 1225, 116, 0, 1420, 2, 7, 1, 124, 17);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Stephen' AND [FamilyName] = 'Tikolo'), 1996, 2011, 28, 27, 1, 768, 96, 0, 1128, 0, 8, 1, 78, 10);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Adam' AND [FamilyName] = 'Gilchrist'), 1999, 2007, 31, 31, 1, 1085, 149, 0, 1107, 1, 8, 1, 141, 19);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Matthew' AND [FamilyName] = 'Hayden'), 2003, 2007, 22, 21, 2, 987, 158, 0, 1062, 3, 2, 0, 106, 23);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Saurav' AND [FamilyName] = 'Ganguly'), 1999, 2007, 21, 21, 3, 1006, 183, 0, 1298, 4, 3, 1, 79, 25);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Stephen' AND [FamilyName] = 'Fleming'), 1996, 2007, 33, 33, 3, 1075, 134, 1, 1398, 2, 5, 2, 134, 11);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Sachin' AND [FamilyName] = 'Tendulkar'), 1992, 2011, 45, 44, 4, 2278, 152, 0, 2560, 6, 15, 2, 241, 27);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Rahul' AND [FamilyName] = 'Dravid'), 1999, 2007, 22, 21, 7, 860, 145, 0, 1147, 2, 6, 0, 76, 3);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Shivnarine' AND [FamilyName] = 'Chanderpaul'), 1996, 2011, 31, 28, 4, 970, 102, 1, 1561, 1, 7, 0, 82, 13);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Ricky' AND [FamilyName] = 'Ponting'), 1996, 2011, 46, 42, 4, 1743, 140, 1, 2180, 5, 6, 1, 145, 31);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Herschelle' AND [FamilyName] = 'Gibbs'), 1999, 2007, 25, 23, 4, 1067, 143, 0, 1221, 2, 8, 1, 106, 28);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Scott' AND [FamilyName] = 'Styris'), 2003, 2011, 26, 22, 5, 909, 141, 0, 1026, 2, 6, 1, 69, 17);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Jacques' AND [FamilyName] = 'Kallis'), 1996, 2011, 36, 32, 7, 1148, 128, 1, 1543, 1, 9, 2, 86, 13);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Tillakaratne' AND [FamilyName] = 'Dilshan'), 2007, 2015, 27, 25, 4, 1112, 161, 1, 1196, 4, 4, 2, 122, 9);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Mahela' AND [FamilyName] = 'Jayawardene'), 1999, 2015, 40, 34, 3, 1100, 115, 1, 1280, 4, 5, 3, 99, 12);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Kumar' AND [FamilyName] = 'Sangakkara'), 2003, 2015, 37, 35, 8, 1532, 124, 0, 1770, 5, 7, 1, 147, 14);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Virender' AND [FamilyName] = 'Sehwag'), 2003, 2011, 22, 22, 0, 843, 175, 0, 794, 2, 3, 1, 108, 18);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Christopher' AND [FamilyName] = 'Gayle'), 2003, 2019, 35, 34, 1, 1186, 215, 0, 1310, 2, 6, 2, 116, 49);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Michael' AND [FamilyName] = 'Clarke'), 2007, 2015, 25, 21, 7, 888, 93, 1, 943, 0, 8, 0, 85, 11);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Graeme' AND [FamilyName] = 'Smith'), 2003, 2011, 20, 20, 1, 747, 91, 0, 865, 0, 6, 0, 84, 6);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Mahenda' AND [FamilyName] = 'Dhoni'), 2007, 2019, 29, 25, 7, 780, 91, 1, 867, 0, 5, 2, 59, 15);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Hashim' AND [FamilyName] = 'Amla'), 2011, 2019, 22, 22, 2, 842, 159, 0, 1012, 2, 5, 0, 76, 6);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Abraham' AND [FamilyName] = 'de Villiers'), 2007, 2015, 23, 22, 3, 1207, 162, 1, 1029, 4, 6, 4, 121, 37);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Francois' AND [FamilyName] = 'du Plessis'), 2011, 2019, 23, 21, 5, 926, 109, 0, 1070, 2, 7, 0, 74, 11);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Ross' AND [FamilyName] = 'Taylor'), 2007, 2019, 33, 30, 3, 1002, 131, 1, 1354, 1, 6, 2, 76, 17);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Aaron' AND [FamilyName] = 'Finch'), 2015, 2019, 18, 18, 0, 787, 153, 0, 801, 3, 4, 2, 73, 24);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'David' AND [FamilyName] = 'Warner'), 2015, 2019, 18, 18, 2, 992, 178, 0, 1011, 4, 3, 0, 104, 17);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Martin' AND [FamilyName] = 'Guptill'), 2011, 2019, 27, 27, 4, 995, 237, 1, 1126, 2, 4, 2, 108, 24);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Rohit' AND [FamilyName] = 'Sharma'), 2015, 2019, 17, 17, 2, 978, 140, 0, 1019, 6, 3, 1, 100, 23);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Mushfiqur' AND [FamilyName] = 'Rahim'), 2007, 2019, 29, 28, 5, 877, 102, 1, 1104, 1, 6, 2, 71, 10);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Shakib' AND [FamilyName] = 'Al Hasan'), 2007, 2019, 29, 29, 4, 1146, 124, 1, 1393, 2, 10, 1, 107, 8);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Virat' AND [FamilyName] = 'Kohli'), 2011, 2019, 26, 26, 4, 1030, 107, 0, 1188, 2, 6, 0, 91, 5);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Steven' AND [FamilyName] = 'Smith'), 2011, 2019, 24, 20, 2, 834, 105, 0, 931, 1, 8, 0, 74, 7);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Kane' AND [FamilyName] = 'Williamson'), 2011, 2019, 23, 22, 6, 911, 148, 0, 1163, 2, 3, 0, 86, 6);
INSERT [dbo].[WorldCupPlayer] ([PlayerID], [SpanBegin], [SpanEnd], [Matches], [Innings], [NotOut], [Runs], [Highest], [HighestIsNotOut], [BallsFaced], [Centuries], [Fifties], [Ducks], [Fours], [Sixes]) VALUES ((SELECT [PlayerID] FROM [dbo].[Player] WHERE [GivenName] = 'Joseph' AND [FamilyName] = 'Root'), 2015, 2019, 17, 16, 2, 758, 121, 0, 861, 3, 3, 0, 67, 4);
GO
