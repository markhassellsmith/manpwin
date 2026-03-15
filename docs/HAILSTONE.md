# Hailstone Sequence Visualization

## User Guide

### Overview

The Hailstone Sequence Visualization feature allows you to explore discrete dynamical systems on the integer lattice (ℤ × ℤ). Starting from any integer point, the system applies transformation rules based on parity (even/odd) to generate fascinating mathematical sequences that either cycle or diverge to infinity.

### Accessing the Feature

**Menu Path:** `Fractal Type` → `Hailstone`

1. Click on the `Fractal Type` menu in the main menu bar
2. Select `Hailstone` from the dropdown menu
3. The Hailstone configuration dialog will appear

### Configuration Dialog

The Hailstone dialog allows you to configure the following parameters:

#### Starting Point
- **Start X**: X-coordinate of the starting point (accepts any integer, including negative values)
- **Start Y**: Y-coordinate of the starting point (accepts any integer, including negative values)
- **Default**: (-10, 6) - a point known to produce interesting behavior

#### Iteration Control
- **Max Iterations**: Maximum number of steps to compute (default: 150)
  - Higher values allow longer sequences to develop
  - Lower values focus on initial behavior

#### Transformation Preset
Choose from five different transformation algorithms:

1. **Current 2D Hailstone** (Default)
   - Original implementation with rich mathematical behavior
   - Rules based on (x, y) parity:
     - (even, even): x' = x/2, y' = y/2
     - (even, odd): x' = x/2 + 1, y' = 3y - 1
     - (odd, even): x' = 3x - 1, y' = y/2 - 1
     - (odd, odd): x' = 3x + 1, y' = 3y - 3

2. **Simple Collatz**
   - Classic Collatz conjecture applied to both dimensions independently
   - Rules: If coordinate is even, divide by 2; if odd, apply 3n + 1
   - Simpler behavior, often converging faster

3. **Symmetric Variant**
   - Symmetric transformation with balanced growth/shrinkage
   - Rules: Odd coordinates use 3x - 1 consistently
   - Produces more symmetric patterns

4. **Coordinate Swap**
   - Swaps X and Y coordinates in specific parity cases
   - Creates interesting diagonal behaviors
   - Useful for studying coordinate coupling

5. **Bounded Growth**
   - Uses 2x expansion instead of 3x to control growth
   - Rules: Replaces 3n operations with 2n operations
   - Produces more controlled, less divergent sequences

#### Display Options
- **Show Axes**: Display X and Y coordinate axes
- **Show Point Labels**: Display (N, X, Y) coordinates at each point
- **Show Dots**: Draw dots at sequence endpoints

### Interactive Controls

Once a Hailstone sequence is displayed, you can toggle display options via the menu:

**Menu Path:** `Fractal Type` → Toggle Options

- **Toggle Axes** - Show/hide coordinate axes
- **Toggle Labels** - Show/hide point coordinate labels  
- **Toggle Dots** - Show/hide endpoint dots

### Understanding the Visualization

The visualization displays:

1. **Sequence Path**: Colored line segments connecting each point in the sequence
2. **Cycle Detection**: If the sequence returns to a previously visited point, the cycle portion is highlighted in magenta
3. **Information Overlay** (top-left corner):
   ```
   Hailstone Sequence (N,X,Y)
   Starting point: (0, x₀, y₀)
   Total points: n
   [If cycle detected:]
   Cycle Detected: Point (step_end, x, y)
   Duplicate of: (start_step, x, y)
   Cycle length: step_end - step_start
   ```

4. **Coordinate Axes**: Integer axes with tick marks for scale reference
5. **Point Labels**: Each point shows its step number and coordinates (N, X, Y)

### Interesting Starting Points to Try

- **(-10, 6)**: Default - shows complex behavior before cycling
- **(1, 1)**: Quickly finds a small cycle
- **(-20, 15)**: Diverges - reaches max iterations without cycling
- **(0, 0)**: Origin behavior - varies by transformation preset
- **(5, -3)**: Demonstrates negative coordinate handling

### Mathematical Notes

The system exhibits two fundamental behaviors:

1. **Cycling**: The sequence returns to a previous point and enters a periodic orbit
2. **Divergence**: The sequence grows without bound, escaping to infinity

By the Pigeonhole Principle, any bounded sequence must eventually cycle, as there are only finitely many integer points within any finite radius.

---

## Developer Implementation Guide

This section provides complete specifications for implementing the Hailstone sequence visualization feature.

---

## Table of Contents

1. [Mathematical Foundation](#mathematical-foundation)
2. [Core Features](#core-features)
3. [Algorithm Implementation](#algorithm-implementation)
4. [Visualization Components](#visualization-components)
5. [Cycle Detection](#cycle-detection)
6. [CSV Export](#csv-export)
7. [Configuration Options](#configuration-options)
8. [UI Integration Guidelines](#ui-integration-guidelines)

---

## Mathematical Foundation

### The 2D Hailstone System

The 2D Hailstone sequence is a discrete dynamical system on the integer lattice (ℤ × ℤ) defined by iterative rules based on parity.

**Given a point (x, y), the next point (x', y') is determined by:**

| Condition | x' | y' |
|-----------|----|----|
| x even, y even | x/2 | y/2 |
| x even, y odd | x/2 + 1 | 3y - 1 |
| x odd, y even | 3x - 1 | y/2 - 1 |
| x odd, y odd | 3x + 1 | 3y - 3 |

### Mathematical Behavior

The system exhibits two fundamental behaviors:

1. **Cycling**: Sequence returns to a previous point, entering a periodic orbit
2. **Divergence**: Sequence grows unbounded, escaping to infinity

**Note:** By the Pigeonhole Principle, any bounded sequence must eventually cycle, as there are only finitely many integer points within any finite radius.

---

## Core Features

### 1. Sequence Generation
- Start from any integer point (x₀, y₀)
- Apply rules iteratively up to MaxIterations
- Track all visited points

### 2. Cycle Detection
- Detect when sequence returns to a previously visited point
- Record cycle start step, end step, and repeated coordinates
- Calculate cycle length
- Stop iteration when cycle found

### 3. Visual Display
- Plot sequence path with colored line segments
- Highlight detected cycles in distinct color (magenta)
- Display coordinate labels at points
- Show axes with integer tick marks
- Auto-scale view to focus on sequence

### 4. Information Overlay
Display on visualization:
```
Hailstone Sequence (N,X,Y)
Starting point: (0, x₀, y₀)
Total points: n
[If cycle detected:]
Cycle Detected: Point (step_end, x, y)
Duplicate of: (step_start, x, y)
Cycle length: step_end - step_start
```

### 5. CSV Export
Export sequence data to file with:
- Header comments with sequence statistics
- Cycle information (if detected)
- Data rows: N, X, Y

---

## Algorithm Implementation

### Core Sequence Generation

```csharp
public static int FHailStoneNextX(int xin, int yin)
{
    if (xin % 2 == 0 && yin % 2 == 0)
        return xin / 2;
    else if (xin % 2 == 0 && yin % 2 != 0)
        return xin / 2 + 1;
    else if (xin % 2 != 0 && yin % 2 == 0)
        return 3 * xin - 1;
    else
        return 3 * xin + 1;
}

public static int FHailStoneNextY(int xin, int yin)
{
    if (xin % 2 == 0 && yin % 2 == 0)
        return yin / 2;
    else if (xin % 2 == 0 && yin % 2 != 0)
        return 3 * yin - 1;
    else if (xin % 2 != 0 && yin % 2 == 0)
        return yin / 2 - 1;
    else
        return 3 * yin - 3;
}
```

### Sequence Generation with Cycle Detection

```csharp
// Data structure for sequence points
var intPoints = new List<(int step, int intX, int intY, Color color)>();
var visitedPoints = new HashSet<(int, int)>();  // For cycle detection

int intX = startIntX;
int intY = startIntY;
intPoints.Add((0, intX, intY, Color.Red));
visitedPoints.Add((intX, intY));

int cycleStartStep = -1;
int cycleEndStep = -1;
int cycleX = 0, cycleY = 0;

for (int index = 1; index <= maxIterations; index++)
{
    // Calculate color for this step (optional - for visualization)
    Color lineColor = GetColorForStep(index);

    // Apply Hailstone rules
    int nextIntX = FHailStoneNextX(intX, intY);
    int nextIntY = FHailStoneNextY(intX, intY);

    intPoints.Add((index, nextIntX, nextIntY, lineColor));

    intX = nextIntX;
    intY = nextIntY;

    // Cycle detection
    if (detectCycles && visitedPoints.Contains((intX, intY)))
    {
        // Found a cycle! Find where it started
        cycleEndStep = index;
        cycleX = intX;
        cycleY = intY;

        for (int i = 0; i < intPoints.Count; i++)
        {
            if (intPoints[i].intX == intX && intPoints[i].intY == intY)
            {
                cycleStartStep = i;
                break;
            }
        }

        // Log cycle detection
        Console.WriteLine($"CYCLE DETECTED! Point ({intX}, {intY}) repeats at step {cycleEndStep}, first seen at step {cycleStartStep}. Cycle length: {cycleEndStep - cycleStartStep}");
        break;
    }

    visitedPoints.Add((intX, intY));
}
```

---

## Visualization Components

### Auto-Scaling

The visualization should auto-scale to focus on the sequence:

```csharp
// Calculate bounds from sequence points
double minX = points.Min(p => p.x);
double maxX = points.Max(p => p.x);
double minY = points.Min(p => p.y);
double maxY = points.Max(p => p.y);

// Add 15% padding on each side
double rangeX = maxX - minX;
double rangeY = maxY - minY;
double paddingX = rangeX * 0.15;
double paddingY = rangeY * 0.15;

minX -= paddingX;
maxX += paddingX;
minY -= paddingY;
maxY += paddingY;

// Calculate center and range for rendering
double centerX = (minX + maxX) / 2.0;
double centerY = (minY + maxY) / 2.0;
double dataRangeX = maxX - minX;
double dataRangeY = maxY - minY;
```

### Coordinate Transformation

Transform from mathematical coordinates to screen coordinates:

```csharp
// Calculate pixels per unit
float pixelsPerUnitX = screenWidth / (float)dataRangeX;
float pixelsPerUnitY = screenHeight / (float)dataRangeY;

// Transform origin to screen center, flip Y axis (math convention: Y-up)
graphics.TranslateTransform(screenWidth / 2.0f, screenHeight / 2.0f);
graphics.ScaleTransform(pixelsPerUnitX, -pixelsPerUnitY);
graphics.TranslateTransform(-(float)centerX, -(float)centerY);
```

### Drawing the Sequence

```csharp
// Draw lines connecting points
for (int i = 0; i < points.Count - 1; i++)
{
    var (step1, x1, y1, color1) = points[i];
    var (step2, x2, y2, color2) = points[i + 1];

    // Check if this segment is part of the cycle
    bool isInCycle = cycleStartStep >= 0 && i >= cycleStartStep && i < cycleEndStep;

    if (isInCycle)
    {
        // Use thicker, distinct color for cycle (e.g., magenta, 2.5x normal width)
        graphics.DrawLine(cyclePen, (float)x1, (float)y1, (float)x2, (float)y2);
    }
    else
    {
        // Normal colored line
        graphics.DrawLine(normalPen, (float)x1, (float)y1, (float)x2, (float)y2);
    }
}

// Draw dots at each point (optional)
foreach (var (step, x, y, color) in points)
{
    graphics.FillEllipse(dotBrush, (float)x - dotRadius, (float)y - dotRadius, 
                         dotDiameter, dotDiameter);
}
```

### Axes Drawing

```csharp
// Draw X-axis (y=0) if it's within view
if (yMin <= 0 && yMax >= 0)
{
    graphics.DrawLine(axisPen, (float)xMin, 0, (float)xMax, 0);
}

// Draw Y-axis (x=0) if it's within view
if (xMin <= 0 && xMax >= 0)
{
    graphics.DrawLine(axisPen, 0, (float)yMin, 0, (float)yMax);
}
```

### Integer Tick Marks

Calculate nice integer spacing for axis labels:

```csharp
private int CalculateNiceIntegerSpacing(int range)
{
    if (range <= 0) return 1;
    if (range <= 7) return 1;  // Very small ranges

    // Target ~5-10 tick marks
    int roughSpacing = range / 7;
    if (roughSpacing == 0) return 1;

    // Round to nice numbers: 1, 2, 5, 10, 20, 50, 100, etc.
    int magnitude = (int)Math.Pow(10, Math.Floor(Math.Log10(roughSpacing)));
    if (magnitude == 0) magnitude = 1;

    int normalized = roughSpacing / magnitude;

    if (normalized <= 1) return magnitude;
    if (normalized <= 2) return 2 * magnitude;
    if (normalized <= 5) return 5 * magnitude;
    return 10 * magnitude;
}
```

### Point Labels

Display coordinate labels at each point:

```csharp
// For each point, draw label showing (step, x, y)
foreach (var (step, intX, intY, color) in intPoints)
{
    // Convert integer to scaled coordinates
    double x = intX * scaleX;
    double y = intY * scaleY;

    // Transform to screen coordinates
    float screenX = screenCenterX + (float)((x - centerX) * pixelsPerUnitX);
    float screenY = screenCenterY - (float)((y - centerY) * pixelsPerUnitY);

    string label = $"({step}, {intX}, {intY})";
    
    // Draw label with background for readability
    graphics.DrawString(label, font, brush, screenX + 8, screenY + 2);
}
```

---

## Cycle Detection

### Core Logic

```csharp
// Cycle detection uses a HashSet to track visited (x, y) pairs
var visitedPoints = new HashSet<(int, int)>();

// On each iteration:
if (visitedPoints.Contains((intX, intY)))
{
    // Cycle detected!
    cycleDetected = true;
    cycleEndStep = currentStep;
    cyclePoint = (intX, intY);
    
    // Find where this point was first seen
    for (int i = 0; i < sequence.Count; i++)
    {
        if (sequence[i].coords == (intX, intY))
        {
            cycleStartStep = i;
            break;
        }
    }
    
    cycleLength = cycleEndStep - cycleStartStep;
    break;  // Stop iteration
}

visitedPoints.Add((intX, intY));
```

### Cycle Information Display

**On-screen overlay (top-left corner):**
```
Hailstone Sequence (N,X,Y)
Starting point: (0, x₀, y₀)
Total points: n
Cycle Detected: Point (end_step, x, y)
Duplicate of: (start_step, x, y)
Cycle length: length
```

**Visual highlighting:**
- Draw cycle portion with distinct color (magenta recommended)
- Use thicker line width (2.5x normal) for emphasis
- Keep non-cycle portions in normal colors

---

## CSV Export

### File Format

```csv
# Hailstone Sequence (N X Y)
# Starting point: (0 x₀ y₀)
# Total points: n
# [If cycle detected:]
# Cycle Detected: Point (end_step x y)
# Duplicate of: (start_step x y)
# Cycle length: length
# [If no cycle:]
# No cycle detected - stopped at MaxIterations
#
N, X, Y
0, x₀, y₀
1, x₁, y₁
2, x₂, y₂
...
```

**Note:** Header comment lines use **spaces** instead of commas in coordinates to avoid CSV parsing issues.

### Implementation

```csharp
void ExportPointsToCSV(List<(int step, int intX, int intY)> intPoints, 
                       int cycleStartStep, int cycleEndStep, int cycleX, int cycleY,
                       string filePath)
{
    try
    {
        // Ensure directory exists
        var directory = Path.GetDirectoryName(filePath);
        if (!string.IsNullOrEmpty(directory) && !Directory.Exists(directory))
        {
            Directory.CreateDirectory(directory);
        }

        using (var writer = new StreamWriter(filePath))
        {
            // Write header comments (spaces instead of commas)
            writer.WriteLine("# Hailstone Sequence (N X Y)");
            writer.WriteLine($"# Starting point: (0 {intPoints[0].intX} {intPoints[0].intY})");
            writer.WriteLine($"# Total points: {intPoints.Count}");

            if (cycleStartStep >= 0)
            {
                int cycleLength = cycleEndStep - cycleStartStep;
                writer.WriteLine($"# Cycle Detected: Point ({cycleEndStep} {cycleX} {cycleY})");
                writer.WriteLine($"# Duplicate of: ({cycleStartStep} {cycleX} {cycleY})");
                writer.WriteLine($"# Cycle length: {cycleLength}");
            }
            else
            {
                writer.WriteLine($"# No cycle detected - stopped at MaxIterations");
            }

            writer.WriteLine("#");

            // Header row (with commas and spaces)
            writer.WriteLine("N, X, Y");

            // Data rows
            for (int i = 0; i < intPoints.Count; i++)
            {
                var p = intPoints[i];
                writer.WriteLine($"{p.step}, {p.intX}, {p.intY}");
            }
        }

        Console.WriteLine($"Exported {intPoints.Count} points to {filePath}");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"Failed to export CSV: {ex.Message}");
    }
}
```

---

## Configuration Options

### Required Parameters

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| StartIntX | int | Starting X coordinate | -10 |
| StartIntY | int | Starting Y coordinate | 6 |
| MaxIterations | int | Maximum steps before stopping | 150 |
| DetectCycles | bool | Enable cycle detection | true |

### Display Options

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| ShowAxes | bool | Display X and Y axes | true |
| ShowPointLabels | bool | Show (N, X, Y) labels at points | true |
| ShowDots | bool | Draw dots at segment endpoints | true |
| LineWidth | float | Thickness of line segments | 0.002f |
| DotSize | float | Size of endpoint dots | 0.012f |
| ColorSpread | int | Color variation per iteration | 7 |

### Rendering Parameters

| Parameter | Type | Description | Default |
|-----------|------|-------------|---------|
| ScaleFactorX | double | Manual X scaling (0 = auto) | 0.0 |
| ScaleFactorY | double | Manual Y scaling (0 = auto) | 0.0 |

**Note:** When scale factors are 0, the system auto-scales based on the first 30% of the sequence (or first 50 iterations, whichever is less) to keep the view focused on the starting region.

---

## UI Integration Guidelines

### Menu Structure (Adaptable to your UI framework)

Suggested menu organization:

```
Visualizations
  └─ Hailstone Sequence
      ├─ Settings...           (Opens configuration dialog)
      ├─ Presets
      │   ├─ Default (-10, 6)
      │   ├─ Origin (0, 0)
      │   └─ Custom...
      └─ Export
          └─ Export to CSV...
```

### Toolbar Buttons (Optional)

- **Axes Toggle**: Show/hide axes
- **Point Labels Toggle**: Show/hide coordinate labels
- **Dots Toggle**: Show/hide endpoint dots
- **Settings**: Quick access to configuration

### Keyboard Shortcuts (Suggested)

- **Ctrl+H**: Open Hailstone visualization
- **F5**: Recalculate/refresh
- **Ctrl+E**: Export to CSV

### Configuration Dialog

Required fields:
- **Starting Point**: Two integer input fields (X, Y)
- **Max Iterations**: Integer input (range: 10-200)
- **Detect Cycles**: Checkbox
- **Display Options**: Checkboxes for axes, labels, dots

---

## Implementation Checklist

### Phase 1: Core Algorithm
- [ ] Implement `FHailStoneNextX` and `FHailStoneNextY` functions
- [ ] Implement sequence generation loop
- [ ] Test with known starting points

### Phase 2: Cycle Detection
- [ ] Add HashSet for visited points tracking
- [ ] Implement cycle detection logic
- [ ] Record cycle start, end, and length
- [ ] Test with points known to cycle

### Phase 3: Visualization
- [ ] Implement auto-scaling logic
- [ ] Set up coordinate transformation
- [ ] Draw sequence lines
- [ ] Draw axes and tick marks
- [ ] Add point labels

### Phase 4: Cycle Highlighting
- [ ] Detect cycle portion of sequence
- [ ] Draw cycle with distinct color/width
- [ ] Add on-screen information overlay

### Phase 5: CSV Export
- [ ] Implement file writing with headers
- [ ] Include cycle information in comments
- [ ] Test with Excel/spreadsheet software

### Phase 6: Configuration
- [ ] Create configuration data structure
- [ ] Implement settings dialog/UI
- [ ] Add presets support
- [ ] Test various parameter combinations

---

## Testing Recommendations

### Test Cases

1. **Simple Cycle**: (1, 1) - Should detect small cycle quickly
2. **Diverging**: (-20, 15) - Should reach MaxIterations without cycle
3. **Default**: (-10, 6) - Verify standard behavior
4. **Edge Cases**:
   - (0, 0) - Origin behavior
   - Very large starting values
   - Very small MaxIterations (e.g., 10)

### Verification

- **CSV Export**: Open in Excel, verify data and headers parse correctly
- **Cycle Detection**: Manually verify first and second occurrence of repeated point
- **Visual**: Check that magenta highlighting shows correct cycle portion
- **Performance**: Ensure 150-200 iterations complete quickly (< 1 second)

---

## Mathematical Notes

### Behavior Classification

Based on implementation experience, starting points exhibit:

1. **Cycling Behavior** (~40-60% of random starts)
   - Sequence enters periodic orbit
   - Cycle lengths vary widely (observed: 2 to 50+)
   - Typically stabilizes within 100 iterations

2. **Diverging Behavior** (~40-60% of random starts)
   - Coordinates grow in absolute value
   - No cycle detected within MaxIterations
   - Suggests escape to infinity

### Open Questions

These remain open for research/exploration:

- Are there any "attractor points" besides cycles?
- What is the basin structure in the (x, y) plane?
- Are there any finite invariant sets besides cycles?
- Do all non-diverging sequences cycle?

**Note:** The Pigeonhole Principle guarantees that any sequence that remains within a bounded region must eventually cycle.

---

## Example Output

### Console Output (Cycle Detected)
```
Calculating sequence from (-10, 6)
CYCLE DETECTED! Point (2, -9) repeats at step 30, first seen at step 21. Cycle length: 9
Exported 31 points to hailstone_points.csv
```

### CSV File (Cycle Detected)
```csv
# Hailstone Sequence (N X Y)
# Starting point: (0 -10 6)
# Total points: 31
# Cycle Detected: Point (30 2 -9)
# Duplicate of: (21 2 -9)
# Cycle length: 9
#
N, X, Y
0, -10, 6
1, -5, 3
...
21, 2, -9
...
30, 2, -9
```

### On-Screen Display (Cycle)
```
Hailstone Sequence (N,X,Y)
Starting point: (0, -10, 6)
Total points: 31
Cycle Detected: Point (30, 2, -9)
Duplicate of: (21, 2, -9)
Cycle length: 9
```
*Shown in magenta with highlighted cycle path*

### On-Screen Display (No Cycle)
```
Hailstone Sequence (N,X,Y)
Starting point: (0, -20, 15)
Total points: 150
```
*Shown in yellow - no cycle detected*

---

## References

### Source Implementation
This specification is based on a working C# WinForms implementation with the following key files:
- `Functions.cs`: Core Hailstone rules
- `HailstoneVisualization.cs`: Rendering and cycle detection
- `HailstoneConfig.cs`: Configuration management

### Related Work
- Classic 1D Collatz Conjecture (3n+1 problem)
- Discrete Dynamical Systems
- Iteration theory on integer lattices

---

## License and Attribution

This specification is derived from collaborative development work and is provided for educational and research purposes. When implementing in other projects, please attribute the core algorithm design and cycle detection methodology.

---

## Revision History

- **v1.0** (2026-03-13): Initial comprehensive specification
  - Core algorithm documented
  - Cycle detection fully specified
  - CSV export format defined
  - Visualization guidelines included

---

**End of Specification**

For questions or clarifications about implementation details, refer to the working source code or consult the mathematical foundations section.
