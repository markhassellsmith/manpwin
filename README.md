# ManpWIN - Advanced Fractal Explorer

![Platform](https://img.shields.io/badge/platform-Windows%2010%2F11-blue)
![C++](https://img.shields.io/badge/C++-17-blue.svg)
![CMake](https://img.shields.io/badge/CMake-3.23+-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Visual Studio](https://img.shields.io/badge/Visual%20Studio-2022-purple.svg)

An educational C++ fractal rendering application featuring 240+ fractal types, deep-zoom technology with perturbation theory, BLA acceleration, and arbitrary-precision arithmetic. This self-contained fork includes all dependencies and requires no configuration.

---

## Screenshots

![Mandelbrot Set](docs/images/mandelbrot-classic.png)
*Classic Mandelbrot set with smooth coloring*

![Deep Zoom](docs/images/deep-zoom-perturbation.png)
*Deep zoom using perturbation theory and BLA acceleration*

![Barnsley M2 Fractal](docs/images/barnsley-m2.png)
*Barnsley M2 IFS fractal*

![Hailstone Sequence](docs/images/Hailstone-sequence.png)
*2D Hailstone sequence with cycle detection*

---

## Quick Start

### Pre-built Executable

[![Latest Release](https://img.shields.io/github/v/release/markhassellsmith/manpwin)](https://github.com/markhassellsmith/manpwin/releases/latest)

**[Download Latest Release](https://github.com/markhassellsmith/manpwin/releases/latest)**

No installation or Visual Studio required. Extract and run on Windows 10/11 (64-bit).

### Build from Source

```bash
git clone https://github.com/markhassellsmith/manpwin.git
cd manpwin
# Open ManpWIN64.sln in Visual Studio 2022 and build (F5)
```

All dependencies are included. The project builds without additional configuration.

**Requirements:**
- Windows 10 or 11 (x64)
- Visual Studio 2022 (Community Edition supported)
- Git (for cloning)

---

## Educational Applications

This project serves as a comprehensive platform for studying fractals, numerical methods, and computational mathematics across multiple disciplines.

### Mathematics

**Complex Dynamics & Numerical Analysis:**
- 240+ fractal types: Mandelbrot, Julia sets, Newton fractals, exotic variants
- Perturbation theory for studying chaotic systems
- Deep zoom with magnifications exceeding 10^100
- Arbitrary-precision arithmetic (MPFR, QD, DD libraries)
- Numerical stability demonstrations

**Advanced Algorithms:**
- BLA (Bilinear Approximation) series approximation
- Perturbation algorithm with reference orbits
- Newton-Raphson root finding
- Analytical derivative calculations

### Computer Science

**Software Architecture:**
- Large-scale C++ project (156 source files, 6 CMake subprojects)
- Template metaprogramming with generic numeric types
- Object-oriented design patterns
- Custom formula parser with VM execution

**Performance Engineering:**
- Multithreaded rendering engine
- Cache optimization techniques
- Memory management with smart pointers
- Vectorization-ready code structure

### Physics & Engineering

**Applications Across Disciplines:**
- **Electrical:** Chua's circuit, fractal antennas, chaos-based encryption
- **Mechanical:** Turbulent flow, nonlinear oscillators, fracture mechanics
- **General:** Strange attractors (Lorenz, Rössler, Hénon), bifurcation analysis, orbit traps

---

## Technical Features

### Deep Zoom Technology
- Perturbation theory for efficient extreme magnification
- BLA series expansion to skip iterations
- Arbitrary precision (MPFR) up to thousands of decimal places
- FloatExp extended exponent range
- Automatic precision scaling

### Rendering Capabilities
- Escape-time, slope/derivative shading, distance estimation
- Potential field, orbit trap, biomorph modes
- 24-bit true color with smooth gradients
- Bump mapping and animated color cycling
- Fractint .map palette support

### Performance
- Multithreaded engine (all CPU cores)
- Solid guessing and boundary tracing
- Progressive rendering
- Dynamic task distribution
- Memory-mapped file support

### Formula System
- Custom scripting language
- Virtual machine bytecode execution
- 100+ built-in mathematical functions
- Fractint formula compatibility

---

## Fractal Categories (240+ Types)

**Classic Fractals (20+):** Mandelbrot variants, Julia sets, Burning Ship, Newton fractals, Magnet fractals

**Advanced Variants (40+):** MandelDerivatives, Mandelbar/Tricorn, Spider, Thorn, Tetration, Power Towers

**Scientific Systems (30+):** Strange attractors (Lorenz, Rössler, Hénon, Pickover, Chua), bifurcation diagrams, Lyapunov fractals

**Hailstone Sequences:** 2D integer lattice dynamics with cycle detection, 5 transformation presets

**Geometric & IFS (20+):** Sierpinski, Apollonius, Pascal triangle, L-Systems, Barnsley fern

**Artistic Fractals (25+):** BuddhaBrot, Popcorn, Hopalong, Plasma, DLA, Langton's ant

**Tierazon Set (30+):** Phoenix, Hypercomplex, Froth, Icon/Icon3D, function compositions

**Research Fractals (15+):** Perturbation-optimized, polynomial, rational maps, Kleinian groups

**Custom:** User-defined formulas via scripting language

---

## Project Structure

```
manpwin/
├── ManpWIN64/              # Main application (156 C++ files)
│   ├── Perturbation.cpp    # Perturbation algorithm
│   ├── Approximation.cpp   # BLA acceleration
│   ├── Slope.cpp           # Derivative shading
│   ├── BigComplex.cpp      # Arbitrary-precision complex
│   ├── Pixel.cpp           # Standard iteration
│   └── ...
├── parser/                 # Formula parser & VM (21 files)
├── qdlib/                  # Quad-double arithmetic
├── pnglib/                 # PNG export
├── ZLib/                   # Compression
├── external/               # MPFR, GMP libraries
├── CMakeLists.txt          # Build configuration
└── ManpWIN64.sln           # Visual Studio solution
```

### Key Source Categories

**Core Rendering:** `Pixel.cpp`, `BigPixel.cpp`, `Perturbation.cpp`, `PertEngine.cpp`

**Precision Types:** `Complex.cpp`, `BigComplex.cpp`, `DDComplex.cpp`, `QDComplex.cpp`, `ExpComplex.cpp`

**Algorithms:** `Approximation.cpp`, `Slope.cpp`, `FwdDiff.cpp`, `MandelDerivatives.cpp`

**Fractals:** `FractintFunctions.cpp`, `TierazonFunctions.cpp`, `Miscfrac.cpp`, `Bif.cpp`

**Color:** `Colour.cpp`, `Colour1.cpp`, `ColourMethod.cpp`, `TrueCol.cpp`

---

## Student Project Ideas

### Beginner (1-2 weeks)
1. Add custom color palettes
2. Implement parameter presets
3. Create keyboard shortcuts
4. Implement simple fractal variants

### Intermediate (4-8 weeks)
5. Histogram-based coloring
6. Progressive rendering preview
7. Parameter animation system
8. Undo/redo navigation
9. New escape-time fractals
10. Distance estimation rendering
11. Statistical analysis tools
12. 3D lighting and shadows

### Advanced (8-16 weeks)
13. GPU acceleration (CUDA/OpenCL)
14. Distributed rendering
15. SIMD optimization (AVX2/AVX-512)
16. Adaptive precision management
17. Automatic differentiation
18. Fractal dimension calculator
19. Plugin architecture
20. Cross-platform port (Linux/Mac)

### Research-Level
21. Novel series approximation methods
22. Machine learning for exploration
23. Perturbation theory for complex formulas
24. Real-time deep zoom interaction

---

## Build Instructions

### Visual Studio (Recommended)

1. Install Visual Studio 2022 with "Desktop development with C++" workload
2. Clone repository: `git clone https://github.com/markhassellsmith/manpwin.git`
3. Open `ManpWIN64.sln`
4. Build (F5)

### Command Line

```bash
git clone https://github.com/markhassellsmith/manpwin.git
cd manpwin
cmake -B build -G "Visual Studio 17 2022" -A x64
cmake --build build --config Release
build\Release\ManpWIN64.exe
```

---

## Troubleshooting

**Build Issues:**
- Ensure all files from `external/lib/x64/` are present
- Clean and rebuild if linker errors occur
- Verify "Desktop development with C++" workload is installed

**Runtime Issues:**
- Use Release build for production (Debug is significantly slower)
- Blank window: Clean and rebuild to recompile resources
- Crashes: Ensure Debug/Release configuration matches

**Performance:**
- Enable BLA for deep zooms (automatic in most cases)
- Reduce max iterations for initial exploration
- Use multithreading (automatic)

---

## Technology Stack

**Core:** C++17, Win32 API, CMake 3.23+, Visual Studio 2022

**Mathematical Libraries:** MPFR 4.2.2, GMP 6.3.0, QD Library, DD Arithmetic

**Supporting:** libpng, ZLib, MPEG

---

## Learning Resources

**Books:**
- Mandelbrot, *The Fractal Geometry of Nature*
- Peitgen et al., *Chaos and Fractals*
- Pickover, *Computers, Pattern, Chaos and Beauty*

**Online:**
- [FractalForums.org](https://fractalforums.org/)
- [Kalles Fraktaler](https://github.com/knighty/kf)
- [Inigo Quilez - Distance Estimation](https://iquilezles.org/articles/distancefractals/)

**Papers:**
- Hart, "Distance Estimation for Fractals"
- Claude Heiland-Allen, perturbation theory articles
- Lorenz (1963), "Deterministic Nonperiodic Flow"

---

## Contributing

Contributions are welcome from students, educators, and researchers.

**Guidelines:**
- Test Debug and Release builds
- Keep dependencies in `external/` directory
- Follow existing code style
- Document significant changes
- Maintain backward compatibility

**Development Workflow:**
1. Fork repository
2. Create feature branch
3. Make changes and test
4. Submit pull request with description

**Priority Areas:**
- GPU acceleration, additional fractals, performance optimizations
- Documentation, tutorials, unit tests
- Novel algorithms, research contributions

---

## Credits

**Original Author:** Paul de Leeuw (Paul the LionHeart)

**Educational Fork:** Mark Hassell Smith (2024) - CMake modernization, dependency vendoring, documentation

**Libraries:** MPFR/GMP teams, QD library authors, libpng, zlib

**Research Community:** Fractal Forums, Kalles Fraktaler, Claude Heiland-Allen, fractal algorithm researchers

---
	
## License

Original code: Copyright Paul de Leeuw	  
Educational modifications: Copyright Mark Hassell Smith (2026)

**Libraries:** MPFR/GMP (LGPL v3), QD (BSD), libpng (PNG license), zlib (zlib license)

For educational and research use. Retain copyright notices and acknowledge sources in academic work.

---

## Contact

**Issues:** [GitHub Issues](https://github.com/markhassellsmith/manpwin/issues)

**Discussions:** GitHub Discussions, [FractalForums.org](https://fractalforums.org/)

---

*"Clouds are not spheres, mountains are not cones, coastlines are not circles, and bark is not smooth, nor does lightning travel in a straight line."* — Benoit Mandelbrot

**Last Updated:** 2026 | **Version:** Educational Fork 1.0 | **Status:** Active Development
