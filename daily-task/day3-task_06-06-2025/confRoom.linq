<Query Kind="Program" />

void Main()
{
    // confRoom Table
    var confRooms = new List<confRoom>
    {
        new confRoom { Id = 1, ConfName = "Banyan", Capacity = 10 },
        new confRoom { Id = 2, ConfName = "Coconut", Capacity = 20 },
        new confRoom { Id = 3, ConfName = "Cypress", Capacity = 15 },
        new confRoom { Id = 4, ConfName = "Eucalyptus", Capacity = 25 },
        new confRoom { Id = 5, ConfName = "Lavender", Capacity = 30 }
    };
	confRooms.Dump("confRoom Table");

    // confDesc Table
    var confDescs = new List<confDesc>
    {
        new confDesc { Id = 1, RoomDesc = "Small team room with whiteboard" },
        new confDesc { Id = 2, RoomDesc = "Medium room with projector" },
        new confDesc { Id = 3, RoomDesc = "Video conferencing enabled room" },
        new confDesc { Id = 4, RoomDesc = "Large boardroom with AC" },
        new confDesc { Id = 5, RoomDesc = "Open space for group discussions" }
    };
	confDescs.Dump("confDesc Table");

    // Join both tables
    var result = from room in confRooms
                 join desc in confDescs on room.Id equals desc.Id
                 select new 
                 {
                     room.Id,
                     room.ConfName,
                     room.Capacity,
                     desc.RoomDesc
                 };

    result.Dump("Joined Table");
}

// Define confRoom
public class confRoom
{
    public int Id { get; set; }
    public string ConfName { get; set; }
    public int Capacity { get; set; }
}

// Define confDesc
public class confDesc
{
    public int Id { get; set; }
    public string RoomDesc { get; set; }
}
