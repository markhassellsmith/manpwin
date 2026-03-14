# Contributing to ManpWIN

**Welcome!** We're excited you're interested in contributing to the ManpWIN educational fractal explorer. This project is specifically designed to be accessible for students, researchers, and educators.

---

## 🎯 First-Time Contributors Welcome!

This is a **student-friendly project**. We welcome contributions from:
- 🎓 Undergraduate and graduate students
- 👨‍🏫 Educators improving teaching materials
- 🔬 Researchers extending fractal algorithms
- 💻 Developers optimizing performance
- 📝 Technical writers improving documentation

**Never contributed to open source before?** No problem! Start with documentation improvements or simple feature additions.

---

## 🚀 Quick Start

### 1. Set Up Your Development Environment

```bash
# Fork the repository on GitHub, then clone your fork
git clone https://github.com/YOUR_USERNAME/manpwin.git
cd manpwin

# Add upstream remote to stay in sync
git remote add upstream https://github.com/markhassellsmith/manpwin.git

# Build the project
# Option A: Open ManpWIN64.sln in Visual Studio 2022 and press F5
# Option B: Command line
cmake -B build -G "Visual Studio 17 2022" -A x64
cmake --build build --config Release
```

### 2. Verify Your Build

- **Debug Build**: Slower but helpful for development
  ```bash
  cmake --build build --config Debug
  build\Debug\ManpWIN64.exe
  ```

- **Release Build**: Fast, use for testing performance
  ```bash
  cmake --build build --config Release
  build\Release\ManpWIN64.exe
  ```

---

## 🔄 Development Workflow

### Creating a Feature Branch

```bash
# Update your local repository
git checkout master
git pull upstream master

# Create a new branch for your feature
git checkout -b feature/your-feature-name
# Examples:
#   feature/add-burning-ship-power3
#   fix/palette-loading-bug
#   docs/improve-readme-examples
```

### Making Changes

1. **Write code** following our style guidelines (see below)
2. **Test thoroughly** in both Debug and Release configurations
3. **Document your changes** with clear comments for complex algorithms
4. **Commit with clear messages**:
   ```bash
   git add .
   git commit -m "Add Burning Ship power-3 variant"
   # Good commit messages are:
   # - Concise but descriptive
   # - Start with a verb (Add, Fix, Update, Remove)
   # - Reference issue numbers if applicable (#123)
   ```

### Testing Your Changes

**Before submitting a pull request, verify:**

- [ ] ✅ Compiles successfully in **Debug** configuration
- [ ] ✅ Compiles successfully in **Release** configuration  
- [ ] ✅ No new compiler warnings introduced
- [ ] ✅ Application runs without crashes
- [ ] ✅ New fractals render correctly (if applicable)
- [ ] ✅ Existing fractals still work (regression test)
- [ ] ✅ Code follows existing style conventions
- [ ] ✅ Complex algorithms have explanatory comments
- [ ] ✅ No memory leaks (use Debug build + profiling tools)

### Submitting a Pull Request

```bash
# Push your branch to your fork
git push origin feature/your-feature-name

# Then on GitHub:
# 1. Navigate to your fork
# 2. Click "New Pull Request"
# 3. Select your feature branch
# 4. Fill out the PR template (describe your changes clearly)
# 5. Submit!
```

**Pull Request Checklist:**
- Clear title summarizing the change
- Description of **what** changed and **why**
- Screenshots (if UI or rendering changes)
- Reference to related issues (if any)
- Confirmation you've tested in Debug and Release
- Note any breaking changes or new dependencies

---

## 📝 Code Style Guidelines

### General Principles

- **Follow existing style** - When in Rome, code like the Romans
- **Clarity over cleverness** - Readable code is maintainable code
- **Comment complex math** - Explain algorithms, not obvious syntax
- **Use descriptive names** - `referenceTolerance` not `refTol`

### C++ Conventions

**Formatting:**
- **Indentation**: Tabs (existing code uses tabs)
- **Brace Style**: K&R with modifications (match existing files)
  ```cpp
  if (condition) {
      // code here
  }
  
  void Function()
  {
      // Note: Some files use this style
  }
  ```
- **Line Length**: Aim for 120 characters, but readability wins
- **Whitespace**: Space after keywords, around operators

**Naming:**
- **Classes**: `PascalCase` (e.g., `PerturbationEngine`, `ComplexNumber`)
- **Functions/Methods**: `PascalCase` (e.g., `CalculateOrbit`, `RenderPixel`)
- **Variables**: `camelCase` (e.g., `maxIterations`, `zoomLevel`)
- **Constants**: `UPPER_CASE` or `kConstantName` (match existing code)
- **Member variables**: `m_variableName` or `variableName` (match file conventions)

**Best Practices:**
```cpp
// ✅ GOOD: Clear, documented, type-safe
Complex CalculateMandelbrotIteration(const Complex& z, const Complex& c, int maxIter)
{
    // Standard Mandelbrot iteration: z = z^2 + c
    // Returns final z value after iteration or escape
    Complex zn = z;
    for (int i = 0; i < maxIter; i++) {
        zn = zn * zn + c;
        if (zn.Magnitude() > 2.0) {
            break; // Escaped
        }
    }
    return zn;
}

// ❌ AVOID: Unclear names, magic numbers, no comments
Complex Calc(Complex a, Complex b, int n)
{
    Complex x = a;
    for (int i = 0; i < n; i++) {
        x = x * x + b;
        if (x.Mag() > 2) break;
    }
    return x;
}
```

### Comments

**When to Comment:**
- ✅ Complex mathematical algorithms (always!)
- ✅ Non-obvious optimizations
- ✅ Workarounds for known issues
- ✅ Citations to papers or references
- ✅ Why a particular approach was chosen

**When NOT to Comment:**
- ❌ Obvious operations (`i++; // increment i`)
- ❌ Restating the code (`x = 5; // set x to 5`)

**Example:**
```cpp
// Calculate series approximation using BLA (Bilinear Approximation)
// Reference: Knighty's fractal forums posts on BLA optimization
// This skips up to 10,000 iterations in constant time for deep zooms
void ApproximateSeries(const Complex& z0, int skipCount)
{
    // Polynomial coefficients from reference orbit
    Complex A = m_refOrbit.GetCoefficient(0);
    Complex B = m_refOrbit.GetCoefficient(1);
    Complex C = m_refOrbit.GetCoefficient(2);
    
    // Approximate position after skipCount iterations
    // Formula: z_n ≈ A + B*δz + C*δz^2 + ...
    Complex delta = z0 - m_refOrbit.GetPoint(0);
    // ... implementation ...
}
```

---

## 🎯 Types of Contributions

### 🌱 Beginner-Friendly Areas

**Great for first contributions:**
1. **Documentation improvements**
   - Fix typos or unclear explanations
   - Add code examples
   - Improve README sections
   
2. **Add color palettes**
   - Implement new interpolation schemes in `Colour.cpp`
   - Easy to test visually!

3. **Parameter presets**
   - Create favorite fractal configurations
   - Help users discover interesting locations

4. **Simple fractal variants**
   - Modify exponents in existing formulas
   - Start with `Pixel.cpp` as template

### 🌿 Intermediate Areas

**Good for learning the codebase:**
5. **Histogram-based coloring**
   - Statistical analysis of iteration distribution
   - Color equalization algorithms

6. **Progressive rendering**
   - Multi-resolution preview system
   - Asynchronous rendering

7. **Parameter animation**
   - Interpolation between fractal states
   - Keyframe system

8. **New fractal implementations**
   - Research and implement new escape-time fractals
   - Understand convergence criteria

### 🌳 Advanced Areas

**Requires deep understanding:**
9. **GPU acceleration**
   - CUDA/OpenCL kernel development
   - Massive performance impact

10. **Distributed rendering**
    - Network-based computation
    - Load balancing algorithms

11. **Advanced precision management**
    - Automatic precision level selection
    - Hybrid precision strategies

12. **New approximation techniques**
    - Extend BLA to more fractal types
    - Research-level mathematics

---

## 🔬 Adding a New Fractal (Example)

Here's a complete example of adding a simple fractal variant:

### Step 1: Define the Fractal Type

**Edit `ManpWIN64/Fractype.h`:**
```cpp
// Find the fractal type enumeration and add your new type
enum {
    MANDEL = 0,
    // ... existing types ...
    BURNINGSHIP_POWER3,  // Add your new type here
    // ... more types ...
    NUMFRACTAL  // Always keep this at the end
};
```

### Step 2: Implement the Formula

**Edit `ManpWIN64/Pixel.cpp`:**
```cpp
// Find the DoIteration function and add your case
int CPixel::DoIteration(Complex& z, Complex& c, int maxIter)
{
    switch (m_fractalType) {
        // ... existing cases ...
        
        case BURNINGSHIP_POWER3:
        {
            // Burning Ship with power 3: z = (|Re(z)| + i*|Im(z)|)^3 + c
            for (int i = 0; i < maxIter; i++) {
                double zr = fabs(z.real());  // Absolute value of real part
                double zi = fabs(z.imag());  // Absolute value of imaginary part
                
                Complex z_abs(zr, zi);
                z = z_abs.Power(3) + c;  // Cube and add constant
                
                if (z.MagnitudeSquared() > 4.0) {
                    return i;  // Escaped after i iterations
                }
            }
            return maxIter;  // Did not escape
        }
        
        // ... more cases ...
    }
}
```

### Step 3: Add UI Entry

**Edit `ManpWIN64/ManpWIN64.rc` (resource file):**
```rc
// Add menu item in the Fractal menu
POPUP "&Fractal"
BEGIN
    // ... existing menu items ...
    MENUITEM "Burning Ship Power 3", ID_FRACTAL_BURNINGSHIP_POWER3
END
```

### Step 4: Register in Fractal Table

**Edit appropriate initialization file:**
```cpp
// Add to fractal information table
{BURNINGSHIP_POWER3, "Burning Ship Power 3", "BurningShip^3", STANDARD_COMPLEX},
```

### Step 5: Test!

```bash
# Rebuild
cmake --build build --config Debug

# Run and test
build\Debug\ManpWIN64.exe

# Try your new fractal from the Fractal menu
# Verify it renders correctly
# Test different parameters and zoom levels
```

---

## 🐛 Reporting Bugs

**Good bug reports help us fix issues faster!**

**Include:**
- **Description**: What happened vs. what you expected
- **Steps to reproduce**: Exact sequence to trigger the bug
- **Environment**: Windows version, Visual Studio version, Debug/Release
- **Screenshots/error messages**: Visual evidence helps!
- **Fractal parameters**: Type, zoom level, precision mode (if relevant)

**Example:**
```
**Bug**: Application crashes when zooming beyond 10^50 magnification

**Steps to Reproduce:**
1. Load Mandelbrot fractal
2. Enable perturbation mode
3. Zoom to magnification > 10^50
4. Crash occurs with "Access Violation" error

**Environment:**
- Windows 11 22H2
- Visual Studio 2022 (17.5.0)
- Release configuration
- MPFR version 4.2.2

**Error Message:**
[Attach screenshot or copy error text]

**Additional Context:**
Works fine up to 10^40 magnification. Suspect precision overflow in BLA table.
```

---

## 💡 Suggesting Features

We love new ideas! **Before requesting a feature:**
1. Check existing issues to avoid duplicates
2. Consider if it fits the educational mission
3. Think about implementation complexity

**Great feature requests include:**
- **Use case**: Why is this useful for students/education?
- **Mathematical basis**: What's the algorithm/formula?
- **Implementation sketch**: How might it work?
- **Examples**: Link to papers, other software, visual examples

---

## 🧪 Testing Guidelines

### Manual Testing

**For rendering changes:**
1. Test at least 5 different fractal types
2. Try low zoom (< 10^5) and deep zoom (> 10^20)
3. Verify Debug and Release builds
4. Check multiple color modes
5. Test parameter variations

**For performance changes:**
1. Benchmark before and after
2. Test with different thread counts
3. Measure memory usage
4. Verify no visual regressions

### Automated Testing

Currently, the project lacks comprehensive unit tests. **Adding tests is a valuable contribution!**

Potential testing areas:
- Precision conversions (double ↔ BigDouble ↔ QD)
- Complex arithmetic operations
- Reference orbit calculations
- Color algorithm outputs
- Formula parser correctness

---

## 📚 Resources for Contributors

### Understanding the Codebase

**Key Files to Read First:**
- `ManpWIN64/Pixel.cpp` - Standard iteration implementation
- `ManpWIN64/Perturbation.cpp` - Perturbation algorithm
- `ManpWIN64/Colour.cpp` - Coloring algorithms
- `ManpWIN64/Fractype.h` - All fractal type definitions

**Architecture Overview:**
```
User Interface (Win32)
    ↓
Fractal Engine Dispatcher
    ↓
    ├─ Standard (double precision)
    ├─ High Precision (MPFR)
    └─ Perturbation + BLA (deep zoom)
    ↓
Precision-Abstracted Math (Complex, BigComplex, etc.)
    ↓
Base Libraries (MPFR, GMP, QD)
```

### Mathematical Resources

- [Fractal Forums](https://fractalforums.org/) - Active community
- [Kalles Fraktaler](https://github.com/knighty/kf) - Reference deep zoom implementation
- [MPFR Documentation](https://www.mpfr.org/)
- See README.md "Additional Resources" section for more

### Learning the Algorithms

**Start with simple fractals:**
1. Implement a basic Mandelbrot variant (change exponent)
2. Add a Julia set variation (different parameter)
3. Create a new color palette
4. Modify iteration escape condition

**Progress to advanced topics:**
1. Study perturbation theory implementation
2. Understand BLA table construction
3. Explore precision switching logic
4. Analyze multithreading architecture

---

## 🤝 Code of Conduct

**Be respectful and welcoming:**
- This is a learning-friendly environment
- All skill levels are welcome
- Ask questions - there are no "stupid" questions
- Help others learn and grow
- Give constructive feedback
- Credit others' work appropriately

**Unacceptable behavior:**
- Harassment, discrimination, or personal attacks
- Spam or off-topic discussions
- Plagiarism or uncredited copying
- Intentionally introducing bugs or malicious code

---

## 📞 Getting Help

**Stuck? Confused? Need guidance?**

1. **Read the README** - Comprehensive documentation
2. **Search existing issues** - Your question may be answered
3. **Ask in GitHub Discussions** - Community help
4. **Open an issue** - For bugs or feature requests
5. **Check Fractal Forums** - Broader fractal community

**For students working on course projects:**
- Describe your learning goals
- Show what you've tried
- Ask specific questions
- We're here to help you learn!

---

## 🎓 Educational Use

**For educators using this in teaching:**

We encourage you to:
- Fork and customize for your course
- Create assignments and labs
- Share your materials (with permission to include in repo)
- Provide feedback on educational effectiveness

**For students:**
- Feel free to use this for course projects
- Cite appropriately in academic work
- Share your cool discoveries!
- Contribute improvements back

---

## 📄 License Reminder

Contributions are made under the same license as the project. By submitting a pull request, you agree:
- Your contribution is your own original work
- You have the right to submit it
- You license it under the project's terms
- You retain copyright but grant usage rights

---

## 🌟 Recognition

**Contributors are valued!**

- All contributors will be acknowledged in CONTRIBUTORS.md
- Significant contributions may be highlighted in release notes
- Student projects that extend the software are celebrated
- Academic citations are encouraged for research contributions

---

## ✨ Final Thoughts

**Thank you for contributing to ManpWIN!**

Every contribution, no matter how small, helps make fractal mathematics more accessible to students worldwide. Whether you fix a typo, add a new fractal, or optimize an algorithm, you're helping someone learn.

**Happy fractal exploring and coding!** 🌀

---

*For questions about contributing, open a GitHub Discussion or issue.*
*This project is maintained as an educational resource for mathematics and computer science students.*
