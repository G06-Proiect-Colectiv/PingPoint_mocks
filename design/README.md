# Explorator Urban - Urban Explorer Prototype

A mobile-first web application prototype for urban exploration and trail discovery, built with HTML, CSS (Tailwind), and JavaScript.

## Features

### 🗺️ Interactive Map Interface
- Satellite map background with custom trail drawing
- Orange trail visualization with animated cursors
- Touch and mouse support for trail creation
- Multiple cursor types (circle, star, arrow, dot, pin, flag, fire, heart, diamond, rocket, target, crown)

### 🚶‍♂️ Trail System
- **"Traseele mele" Mode**: Randomly generated trails with different cursor types
- **"Traseul actual" Mode**: User-drawn trails with real-time drawing
- Trail toggle functionality
- Automatic trail generation and rendering

### 📍 Daily Location Challenge
- Daily location discovery system
- Step-by-step directions with navigation
- Camera integration for location verification
- Progressive content unlocking

### 👤 User Profile
- User statistics and achievements
- Customizable cursor trail settings
- Personal trail collection
- Scrollable profile interface

### ⚙️ Settings & Customization
- Dark mode toggle
- Unit preferences (KM/Mile)
- Notification settings
- Map type selection (Satellite, Standard, Terrain, Hybrid)

### 🎯 Progressive Unlocking
- Content unlocks after completing daily challenges
- "Alte Trasee" and "Noi Trasee" sections become available
- Cursor customization unlocks after location discovery

## Technical Implementation

### Frontend Technologies
- **HTML5**: Semantic structure and accessibility
- **Tailwind CSS**: Utility-first styling framework
- **JavaScript (ES6+)**: Interactive functionality and state management
- **Canvas API**: Custom trail drawing and cursor rendering

### Key Components
- **Login Screen**: Simple authentication entry point
- **Map Canvas**: Real-time trail drawing with shadows and effects
- **Swipe Panel**: Bottom sheet interface for content discovery
- **Modal System**: Camera and celebration screens
- **Profile System**: User data and customization options

### Responsive Design
- Mobile-first approach
- Touch event handling
- Adaptive canvas sizing
- Cross-device compatibility

## File Structure

```
project/
├── index.html          # Main application file
├── images.jpeg         # User profile picture
├── photo.png          # Map background image
├── photo1.png         # Additional assets
├── photo2.png         # Additional assets
└── README.md          # This file
```

## Getting Started

1. **Clone or download** the project files
2. **Open `index.html`** in a modern web browser
3. **Click "Conectează-te"** to access the main interface
4. **Explore the map** and interact with the trail system

## Usage Guide

### Basic Navigation
1. **Login**: Start by clicking the login button
2. **Map Interaction**: Use the floating buttons for profile, trail toggle, and map menu
3. **Trail Drawing**: In "Traseul actual" mode, drag on the map to create trails
4. **Daily Challenge**: Click "Începe călătoria" to start the location challenge

### Trail Modes
- **Traseele mele**: View randomly generated trails with different cursors
- **Traseul actual**: Draw your own trails manually

### Profile Features
- View statistics and achievements
- Customize cursor appearance
- Access personal trail collection

## Browser Compatibility

- Chrome 80+
- Firefox 75+
- Safari 13+
- Edge 80+

## Development Notes

- Built with vanilla JavaScript for maximum compatibility
- Canvas-based rendering for smooth trail animations
- Event-driven architecture for responsive interactions
- Modular code structure for maintainability

## Future Enhancements

- [ ] GPS integration for real location tracking
- [ ] Trail sharing and social features
- [ ] Offline trail caching
- [ ] Advanced map layers and filters
- [ ] Achievement system expansion

## License

This project is a prototype for educational and demonstration purposes.