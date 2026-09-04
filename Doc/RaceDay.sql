USE RaceDayDb;
GO

SELECT 
    r.Id AS RegistrationId,
    CONCAT(u.First_Name, ' ', u.Last_Name) AS ParticipantName,
    e.Title AS EventTitle,
    c.Title AS CategoryTitle,
    r.Bib_Number,
    ISNULL(
        RIGHT('0' + CAST(res.Finish_Time_Seconds / 3600 AS VARCHAR), 2) + ':' +
        RIGHT('0' + CAST((res.Finish_Time_Seconds % 3600) / 60 AS VARCHAR), 2) + ':' +
        RIGHT('0' + CAST(res.Finish_Time_Seconds % 60 AS VARCHAR), 2),
        'Pending'
    ) AS FormattedFinishTime
FROM dbo.Registration r
JOIN dbo.[User] u ON r.User_Id = u.Id
JOIN dbo.Category c ON r.Category_Id = c.Id
JOIN dbo.Event e ON c.Event_Id = e.Id
LEFT JOIN dbo.Results res ON res.Registration_Id = r.Id;