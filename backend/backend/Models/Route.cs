namespace backend.Models
{
    public class Route
    {
        public int Id { get; set; }
        public string? Name { get; set; }
        public int StartLocationId { get; set; }
        public int EndLocationId { get; set; }
        public string? Polyline { get; set; }
        public double Distance { get; set; }
        public  double Duration { get; set; }
    }
}
