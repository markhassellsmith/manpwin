# Screenshot Guide for README

This guide provides exact steps to capture the three screenshots needed for the README.

## 🎯 Screenshots Needed

1. **Classic Mandelbrot Set** - Shows the iconic fractal everyone recognizes
2. **Deep Zoom Example** - Demonstrates advanced perturbation/BLA capabilities
3. **Strange Attractor** - Shows the variety beyond Mandelbrot sets

---

## 📁 Preparation

### Create Images Directory
```powershell
mkdir docs\images -Force
```

### Launch the Application
```powershell
# From project root
.\build\Release\ManpWIN64.exe
```

Or double-click: `build\Release\ManpWIN64.exe`

---

## 📸 Screenshot 1: Classic Mandelbrot Set

**Purpose**: The iconic fractal - immediate recognition factor

### Steps:
1. **Launch the application**
2. **It should start with Mandelbrot set by default** (if not: Fractal → Mandelbrot)
3. **Adjust for best appearance**:
   - Wait for the initial render to complete (progress bar at bottom)
   - **Press `C` key** to open the Color Palette dialog
   - In the dialog, you can:
     - Select different color schemes from dropdown
     - Click "Random" button to generate random palettes
     - Adjust palette settings
   - Click OK when you find colors you like
   - **Or use live color cycling:**
     - Press **`+` key** (plus/equals key) to cycle colors forward
     - Press **`-` key** (minus key) to cycle colors backward
     - Press **`+`** or **`-`** again to turn off cycling
   - Suggested: Look for **smooth rainbow gradients** or **blue/purple themes**
4. **Optional enhancements**:
   - Menu: **Options → Iterations → Set to 1000** (for smoother colors)
   - Menu: **Options → Enable Smooth Coloring** (if available)
5. **Wait for full render** (progress bar at bottom should complete)
6. **Capture screenshot**:
   - **Option A**: Press `Print Screen`, paste in Paint, crop, save as `docs\images\mandelbrot-classic.png`
   - **Option B**: Use Windows Snipping Tool (Win+Shift+S), capture window, save as PNG
   - **Option C**: Use app's built-in save: **File → Save Image → PNG**, save to `docs\images\mandelbrot-classic.png`

### What to Look For:
- ✅ Full Mandelbrot set visible (the "apple" or "heart" shape)
- ✅ Colorful, not just black and white
- ✅ Smooth gradients (not banded colors)
- ✅ Clear details in the bulbs and tendrils

### Alternative Settings to Try:
If default doesn't look good:
- **Fractal → Mandelbrot → Power 2** (ensure standard)
- **Zoom level**: Should show the full set (zoom out if needed: right-click or View → Zoom Out)
- **Color options**:
  - Press **`C`** to open color palette dialog → try different schemes
  - Press **`+`** (plus key) to cycle colors forward (creates animated color shifts)
  - Press **`-`** (minus key) to cycle colors backward
  - Press **`1`** key to toggle random color generation
- **Resolution**: Menu → Options → Screen Size → larger if needed

---

## 📸 Screenshot 2: Deep Zoom Example

**Purpose**: Showcases the unique perturbation/BLA capabilities - what makes this software special

### Steps:
1. **Start with Mandelbrot set** (from Screenshot 1)
2. **Find an interesting area to zoom into**:
   - **Easy method**: Click on the **edge/boundary** of the main bulb several times
   - **Specific recommendation**: Click on the "seahorse valley" (right side of the main bulb, where it meets the tail)
   - Each click zooms in 2x
3. **Zoom deep** (click 20-30 times, or drag a small rectangle to zoom into)
4. **Watch the magic**:
   - Status bar should show **increasing magnification** (e.g., "Zoom: 1.23e+25")
   - You may see messages about **"Perturbation mode"** or **"BLA acceleration"**
   - Look for **self-similar patterns** (miniature Mandelbrot sets appearing)
5. **Capture when you see**:
   - Magnification level > **10^20** (shown in status bar or title bar)
   - Beautiful fractal details filling the screen
   - Self-similar structures (mini-Mandelbrot sets)
6. **Take screenshot**: Same methods as Screenshot 1, save as `docs\images\deep-zoom-perturbation.png`

### What to Look For:
- ✅ High zoom level visible in title/status (10^20 or higher)
- ✅ Intricate, detailed patterns
- ✅ Self-similarity clearly visible
- ✅ Smooth rendering (proves BLA/perturbation is working)

### Tips:
- If rendering is slow, you're doing it right! (Deep zooms are computationally intensive)
- If colors become banded, increase iterations: **Options → Max Iterations → 10000**
- If it says "Switching to perturbation mode" - perfect! Capture that state
- The more you zoom, the more impressive (but also slower to render)

### Pro Tip:
Look for **spiral formations** or **filaments** - these make the best deep zoom screenshots.

---

## 📸 Screenshot 3: Strange Attractor

**Purpose**: Shows the diversity beyond Mandelbrot - demonstrates 240+ fractal types

### Recommended Options (Pick ONE):

### Option A: **Pickover Attractor** (Recommended - unique to this software!)

1. **Menu: Fractal → Tierazon → Pickover** (or similar path)
   - Might be under: **Fractal → Strange Attractors → Pickover**
   - Look for fractal types with "Pickover" in the name
2. **Wait for render** (should be relatively fast)
3. **Look for**: Chaotic, organic-looking swirls and tendrils
4. **Capture**: Save as `docs\images\pickover-attractor.png`

### Option B: **Lorenz Attractor** (Classic "butterfly" attractor)

1. **Menu: Fractal → Strange Attractors → Lorenz** 
2. **Wait for render**
3. **Look for**: Butterfly-shaped double-spiral pattern
4. **Optional**: Rotate view if 3D controls available
5. **Capture**: Save as `docs\images\lorenz-attractor.png`

### Option C: **Burning Ship** (Dramatic alternative)

1. **Menu: Fractal → Burning Ship**
2. **Wait for render**
3. **Look for**: Sharp, crystalline structures (looks like a "burning" ship)
4. **Zoom into edges** for dramatic spikes and towers
5. **Capture**: Save as `docs\images\burning-ship.png`

### Option D: **Julia Set** (Classic and beautiful)

1. **Menu: Fractal → Julia Set**
2. **Adjust parameters** (may auto-animate through different Julia sets)
3. **Look for**: Symmetric, snowflake-like patterns
4. **Find a visually interesting parameter** (lots of detail, nice symmetry)
5. **Capture**: Save as `docs\images\julia-set.png`

### Option E: **Barnsley M2** (IFS Fractal)

1. **Press `T` key** to open Fractal Type selector
2. **Scroll to find "BarnsleyM2"** in the list
3. **Click on it** and click OK
4. **Wait for render**
5. **Look for**: Fern-like or organic IFS (Iterated Function System) patterns
6. **Capture**: Save as `docs\images\barnsley-m2.png`

### What to Look For:
- ✅ Clearly different from Mandelbrot set
- ✅ Visually interesting (colors, patterns, structure)
- ✅ Demonstrates variety of fractal types
- ✅ Not too chaotic (students should see structure)

---

## 🎨 General Screenshot Tips

### Technical Quality:
- **Resolution**: Capture at least 800x600, preferably 1024x768 or higher
- **Format**: PNG (lossless, good for screenshots)
- **Cropping**: Include the fractal render area, can exclude menus/status if desired
- **Color**: Make sure colors are vibrant (cycle palettes if needed)

### Visual Appeal:
- **Contrast**: Choose palettes with good contrast (not all dark or all light)
- **Smooth**: Enable smooth/continuous coloring if available
- **Interesting**: Find areas with lots of detail, not just solid blocks of color
- **Diverse**: Three screenshots should look distinctly different from each other

### File Organization:
```
docs/
  images/
    mandelbrot-classic.png         (Screenshot 1)
    deep-zoom-perturbation.png     (Screenshot 2)
    pickover-attractor.png         (Screenshot 3)
    [or lorenz-attractor.png, burning-ship.png, julia-set.png]
```

---

## 🔧 Troubleshooting

### Problem: "Application won't launch"
**Solution**: Make sure you built Release configuration:
```powershell
cmake --build build --config Release
.\build\Release\ManpWIN64.exe
```

### Problem: "Rendering is too slow"
**Solution**: 
- Use **Release build** (10-100x faster than Debug)
- Lower max iterations: **Options → Max Iterations → 500-1000**
- Smaller window size initially

### Problem: "Colors are ugly/banded"
**Solution**:
- Press **`C`** key to open color palette dialog → select different color schemes
- Or press **`+`** key to cycle colors forward (animated color rotation)
- Or press **`-`** key to cycle colors backward
- Press **`1`** key to toggle random color generation
- Try: **Options → Smooth Coloring → Enable** (if available in menus)
- Increase iterations for smoother gradients: **Options → Max Iterations → 1000+**

### Problem: "Can't find Strange Attractors menu"
**Solution**:
- Look under: **Fractal → [browse all types]**
- Try: **Fractal → Tierazon → Pickover**
- Alternative: Use **Burning Ship** or **Julia Set** for Screenshot 3

### Problem: "Don't see zoom level / perturbation message"
**Solution**:
- Check title bar or status bar at bottom
- Zoom in more (20-30 clicks, or drag very small rectangle)
- May auto-enable perturbation at high zoom - watch for status messages

### Problem: "Screenshot capture method?"
**Three easy options**:
1. **Snipping Tool**: Press `Win+Shift+S`, select area, paste in Paint, save
2. **Print Screen**: Press `PrtScn`, paste in Paint, crop, save
3. **App built-in**: `File → Save Image → PNG` (if available)

---

## ✅ Final Checklist

Before updating README:
- [ ] Three PNG files created in `docs\images\`
- [ ] Files are reasonable size (< 1 MB each, ideally 200-500 KB)
- [ ] Screenshots are clear and colorful
- [ ] Each screenshot shows a distinctly different fractal type/technique
- [ ] Filenames match what's referenced in README:
  - `mandelbrot-classic.png`
  - `deep-zoom-perturbation.png`
  - `pickover-attractor.png` (or alternative)

---

## 🚀 After Taking Screenshots

Update the README.md by uncommenting and verifying the image paths:

```markdown
## 📸 Screenshots

![Mandelbrot Set](docs/images/mandelbrot-classic.png)
*Classic Mandelbrot set with smooth coloring - the iconic fractal that started it all*

![Deep Zoom](docs/images/deep-zoom-perturbation.png)
*Deep zoom at 10^50+ magnification using perturbation theory and BLA acceleration - exploring self-similarity at extreme scales*

![Barnsley M2 Fractal](docs/images/barnsley-m2.png)
*Barnsley M2 IFS fractal - one of 240+ fractal types, demonstrating the variety beyond Mandelbrot sets*
```

---

## 💡 Bonus: If You Want REALLY Impressive Screenshots

### For Mandelbrot:
- Zoom into the "seahorse valley" (right side of main bulb)
- Or zoom into the "elephant valley" (between main bulb and circular bulb on left)
- Find areas with **spirals** - most visually striking

### For Deep Zoom:
- Zoom until magnification is > **10^50** (may take 5-10 minutes to render)
- Look for **mini-Mandelbrot sets** within the structures
- Capture when you see both the high zoom level AND beautiful detail

### For Attractor:
- If software allows, **rotate 3D view** for best angle (if applicable)
- Try multiple strange attractors and pick the most visually interesting
- **Pickover Attractor** is great because it's unique to this software and credited in README

---

**Ready to go!** 

Run the app, follow steps 1-3, take three screenshots, save to `docs\images\`, and you're done! 🎉

If you get stuck on any step, let me know which one and I'll provide more specific guidance.
