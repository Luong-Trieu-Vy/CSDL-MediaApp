CREATE DATABASE MediaApp;

USE MediaApp;

-- Tạo bảng Users để lưu thông tin đăng nhập

CREATE TABLE Users (
    UserID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(50) NOT NULL UNIQUE,
    Password NVARCHAR(255) NOT NULL,
    Email NVARCHAR(100),
    LastLoginDate DATETIME, -- Thêm thời gian đăng nhập cuối
    RememberMe BIT DEFAULT 0, -- Thêm cờ ghi nhớ đăng nhập
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- Tạo bảng Songs để lưu thông tin bài hát
CREATE TABLE Songs (
    SongID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    Duration INT, -- Thời lượng tính bằng giây
    FilePath NVARCHAR(500) NOT NULL,
    UploadDate DATETIME DEFAULT GETDATE()
);

-- Tạo bảng Videos để lưu thông tin video
CREATE TABLE Videos (
    VideoID INT PRIMARY KEY IDENTITY(1,1),
    Title NVARCHAR(100) NOT NULL,
    FilePath NVARCHAR(500) NOT NULL
);


-- Tạo bảng Playlists
CREATE TABLE Playlists (
    PlaylistID INT PRIMARY KEY IDENTITY(1,1),
    UserID INT FOREIGN KEY REFERENCES Users(UserID),
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    CreatedDate DATETIME DEFAULT GETDATE()
);

-- Tạo bảng PlaylistSongs để lưu các bài hát trong playlist
CREATE TABLE PlaylistSongs (
    PlaylistID INT FOREIGN KEY REFERENCES Playlists(PlaylistID),
    SongID INT FOREIGN KEY REFERENCES Songs(SongID),
    OrderNumber INT,
    DateAdded DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (PlaylistID, SongID)
);

-- Tạo bảng PlaylistVideos để lưu các video trong playlist
CREATE TABLE PlaylistVideos (
    PlaylistID INT FOREIGN KEY REFERENCES Playlists(PlaylistID),
    VideoID INT FOREIGN KEY REFERENCES Videos(VideoID),
    OrderNumber INT,
    DateAdded DATETIME DEFAULT GETDATE(),
    PRIMARY KEY (PlaylistID, VideoID)
);
