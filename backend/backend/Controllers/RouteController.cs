using backend.Data;
using backend.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using System.Net.Http;
using System.Text.Json;

namespace backend.Controllers
{
    [ApiController]
    [Route("api/route")]
    public class RouteController : ControllerBase
    {
        private readonly PingPointDbContext dbContext;
        private readonly HttpClient _httpClient;
        private readonly IConfiguration _config;
        public RouteController(PingPointDbContext context, IConfiguration config)
        {
            dbContext = context;
            _httpClient = new HttpClient();
            _config = config;
        }

        [HttpGet("/{id}")]
        public async Task<ActionResult<Models.Route>> GetRoute(int id)
        {
            var route = await dbContext.Routes.FindAsync(id);
            if (route == null)
            {
                return NotFound();
            }
            return Ok(route);
        }

        [HttpPost]
        public async Task<ActionResult<Models.Route>> CreateRoute(Models.Route route)
        {
            try
            {
                // For demo: replace with real coordinates from your Location table
                // Example: StartLocationId and EndLocationId could point to Location objects
                var start = await dbContext.Locations.FindAsync(route.StartLocationId);
                var end = await dbContext.Locations.FindAsync(route.EndLocationId);

                if (start == null || end == null)
                    return BadRequest("Invalid StartLocationId or EndLocationId.");

                // Build Directions API URL
                string apiKey = _config["GoogleMaps:ApiKey"]!;
                string url = $"https://maps.googleapis.com/maps/api/directions/json?origin=" +
                    $"{start.Latitude},{start.Longitude}" +
                        $"&destination={end.Latitude},{end.Longitude}&key={apiKey}";

                // Call Google Directions API
                var response = await _httpClient.GetAsync(url);
                response.EnsureSuccessStatusCode();
                var jsonString = await response.Content.ReadAsStringAsync();

                using var doc = JsonDocument.Parse(jsonString);
                var root = doc.RootElement;

                if (root.GetProperty("status").GetString() != "OK")
                    return BadRequest("Google Directions API failed.");

                var routeData = root.GetProperty("routes")[0];
                var leg = routeData.GetProperty("legs")[0];

                var distance = leg.GetProperty("distance").GetProperty("value").GetDouble();
                var duration = leg.GetProperty("duration").GetProperty("value").GetDouble();
                var polyline = routeData.GetProperty("overview_polyline").GetProperty("points").GetString();

                // Fill in route info
                route.Polyline = polyline;
                route.Distance = distance;
                route.Duration = duration;

                dbContext.Routes.Add(route);
                await dbContext.SaveChangesAsync();

                return CreatedAtAction(nameof(GetRoute), new { id = route.Id }, route);
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Internal server error: {ex.Message}");
            }
        }

        // PUT: api/routes/{id}
        [HttpPut("{id}")]
        public async Task<IActionResult> UpdateRoute(int id, Models.Route updatedRoute)
        {
            if (id != updatedRoute.Id)
                return BadRequest("Route ID mismatch");

            var route = await dbContext.Routes.FindAsync(id);
            if (route == null)
                return NotFound();

            route.Name = updatedRoute.Name;
            route.StartLocationId = updatedRoute.StartLocationId;
            route.EndLocationId = updatedRoute.EndLocationId;
            route.Polyline = updatedRoute.Polyline;

            await dbContext.SaveChangesAsync();
            return NoContent();
        }
    }
}
