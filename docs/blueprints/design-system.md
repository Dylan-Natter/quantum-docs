---
sidebar_position: 2
title: Design System
description: Comprehensive design system for the Quantum Platform
---

# Design System

The Quantum Platform Design System provides a comprehensive set of design principles, components, and guidelines for creating consistent, accessible, and beautiful user experiences.

## Design Philosophy

### Core Principles

1. **Intent-Driven Design**: Every interface element should clearly communicate its purpose and expected outcome
2. **Progressive Disclosure**: Show information at the right level of detail for the user's current context
3. **Consistent Patterns**: Use consistent patterns across all interfaces to reduce cognitive load
4. **Accessibility First**: Design for all users, including those with disabilities
5. **Performance Conscious**: Optimize for speed and responsiveness

### Visual Identity

The Quantum Platform visual identity is inspired by modern, clean design principles with a focus on clarity and functionality.

## Color Palette

### Primary Colors

<div className="color-palette">
  <div className="color-group">
    <h4>Primary Blue</h4>
    <div className="color-swatches">
      <div className="color-swatch" style={{backgroundColor: '#0066CC', color: 'white'}}>
        <span>#0066CC</span>
        <span>Primary</span>
      </div>
      <div className="color-swatch" style={{backgroundColor: '#004499', color: 'white'}}>
        <span>#004499</span>
        <span>Primary Dark</span>
      </div>
      <div className="color-swatch" style={{backgroundColor: '#3388DD', color: 'white'}}>
        <span>#3388DD</span>
        <span>Primary Light</span>
      </div>
    </div>
  </div>
  
  <div className="color-group">
    <h4>Secondary Colors</h4>
    <div className="color-swatches">
      <div className="color-swatch" style={{backgroundColor: '#00CC66', color: 'white'}}>
        <span>#00CC66</span>
        <span>Success</span>
      </div>
      <div className="color-swatch" style={{backgroundColor: '#FF6600', color: 'white'}}>
        <span>#FF6600</span>
        <span>Warning</span>
      </div>
      <div className="color-swatch" style={{backgroundColor: '#CC0000', color: 'white'}}>
        <span>#CC0000</span>
        <span>Error</span>
      </div>
    </div>
  </div>
  
  <div className="color-group">
    <h4>Neutral Colors</h4>
    <div className="color-swatches">
      <div className="color-swatch" style={{backgroundColor: '#1A1A1A', color: 'white'}}>
        <span>#1A1A1A</span>
        <span>Text Primary</span>
      </div>
      <div className="color-swatch" style={{backgroundColor: '#666666', color: 'white'}}>
        <span>#666666</span>
        <span>Text Secondary</span>
      </div>
      <div className="color-swatch" style={{backgroundColor: '#F5F5F5', color: '#1A1A1A'}}>
        <span>#F5F5F5</span>
        <span>Background</span>
      </div>
    </div>
  </div>
</div>

### Usage Guidelines

- **Primary Blue**: Use for primary actions, links, and key interface elements
- **Success Green**: Use for success states, confirmations, and positive feedback
- **Warning Orange**: Use for warnings and attention-grabbing elements
- **Error Red**: Use for errors, destructive actions, and critical alerts
- **Neutral Grays**: Use for text, borders, and subtle interface elements

## Typography

### Font Families

```css
/* Primary Font - Inter (Clean, modern sans-serif) */
@import url('https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap');

/* Monospace Font - JetBrains Mono (Code and technical content) */
@import url('https://fonts.googleapis.com/css2?family=JetBrains+Mono:wght@400;500;600&display=swap');
```

### Type Scale

<div className="typography-scale">
  <div className="type-sample">
    <h1 className="text-4xl font-bold">Heading 1 - 2.5rem</h1>
    <p className="text-sm text-gray-600">Use for page titles and major headings</p>
  </div>
  
  <div className="type-sample">
    <h2 className="text-3xl font-semibold">Heading 2 - 1.875rem</h2>
    <p className="text-sm text-gray-600">Use for section headings</p>
  </div>
  
  <div className="type-sample">
    <h3 className="text-2xl font-medium">Heading 3 - 1.5rem</h3>
    <p className="text-sm text-gray-600">Use for subsection headings</p>
  </div>
  
  <div className="type-sample">
    <h4 className="text-xl font-medium">Heading 4 - 1.25rem</h4>
    <p className="text-sm text-gray-600">Use for card titles and small headings</p>
  </div>
  
  <div className="type-sample">
    <p className="text-base">Body Text - 1rem</p>
    <p className="text-sm text-gray-600">Use for regular content and paragraphs</p>
  </div>
  
  <div className="type-sample">
    <p className="text-sm">Small Text - 0.875rem</p>
    <p className="text-sm text-gray-600">Use for captions, labels, and secondary information</p>
  </div>
  
  <div className="type-sample">
    <code className="text-sm font-mono">Code Text - 0.875rem</code>
    <p className="text-sm text-gray-600">Use for code snippets and technical content</p>
  </div>
</div>

### Typography Guidelines

- **Hierarchy**: Use consistent heading levels to create clear information hierarchy
- **Readability**: Ensure sufficient contrast between text and background
- **Line Height**: Use 1.5x line height for body text, 1.2x for headings
- **Line Length**: Keep line length between 45-75 characters for optimal readability

## Spacing System

### Spacing Scale

```css
/* Spacing scale based on 8px grid */
:root {
  --space-1: 0.25rem;  /* 4px */
  --space-2: 0.5rem;   /* 8px */
  --space-3: 0.75rem;  /* 12px */
  --space-4: 1rem;     /* 16px */
  --space-5: 1.25rem;  /* 20px */
  --space-6: 1.5rem;   /* 24px */
  --space-8: 2rem;     /* 32px */
  --space-10: 2.5rem;  /* 40px */
  --space-12: 3rem;    /* 48px */
  --space-16: 4rem;    /* 64px */
  --space-20: 5rem;    /* 80px */
  --space-24: 6rem;    /* 96px */
}
```

### Usage Guidelines

- **Consistent Spacing**: Use the spacing scale for all margins and padding
- **8px Grid**: Base all spacing on multiples of 8px for visual consistency
- **Responsive Spacing**: Adjust spacing for different screen sizes
- **Component Spacing**: Use consistent spacing within and between components

## Component Library

### Buttons

<div className="component-showcase">
  <div className="button-group">
    <button className="btn btn-primary">Primary Button</button>
    <button className="btn btn-secondary">Secondary Button</button>
    <button className="btn btn-outline">Outline Button</button>
    <button className="btn btn-ghost">Ghost Button</button>
  </div>
  
  <div className="button-group">
    <button className="btn btn-primary btn-sm">Small</button>
    <button className="btn btn-primary">Medium</button>
    <button className="btn btn-primary btn-lg">Large</button>
  </div>
  
  <div className="button-group">
    <button className="btn btn-primary" disabled>Disabled</button>
    <button className="btn btn-primary">
      <span className="btn-icon">+</span>
      With Icon
    </button>
  </div>
</div>

**Button Specifications**:
- **Height**: 32px (small), 40px (medium), 48px (large)
- **Padding**: 12px horizontal, 8px vertical
- **Border Radius**: 6px
- **Font Weight**: 500
- **States**: Default, Hover, Active, Disabled, Loading

### Form Elements

<div className="component-showcase">
  <div className="form-group">
    <label className="form-label">Input Label</label>
    <input className="form-input" placeholder="Enter text..." />
  </div>
  
  <div className="form-group">
    <label className="form-label">Select Dropdown</label>
    <select className="form-select">
      <option>Option 1</option>
      <option>Option 2</option>
      <option>Option 3</option>
    </select>
  </div>
  
  <div className="form-group">
    <label className="form-label">Textarea</label>
    <textarea className="form-textarea" placeholder="Enter description..."></textarea>
  </div>
  
  <div className="form-group">
    <label className="checkbox-label">
      <input type="checkbox" className="checkbox" />
      <span>Checkbox option</span>
    </label>
  </div>
</div>

**Form Specifications**:
- **Input Height**: 40px
- **Border**: 1px solid #E5E5E5
- **Border Radius**: 6px
- **Focus State**: Blue border with subtle shadow
- **Error State**: Red border with error message

### Cards

<div className="component-showcase">
  <div className="card">
    <div className="card-header">
      <h3 className="card-title">Card Title</h3>
      <p className="card-subtitle">Card subtitle or description</p>
    </div>
    <div className="card-content">
      <p>Card content goes here. This is where you would place the main content of the card.</p>
    </div>
    <div className="card-footer">
      <button className="btn btn-primary btn-sm">Action</button>
    </div>
  </div>
</div>

**Card Specifications**:
- **Border**: 1px solid #E5E5E5
- **Border Radius**: 8px
- **Shadow**: Subtle shadow for depth
- **Padding**: 16px
- **Background**: White

### Navigation

<div className="component-showcase">
  <nav className="nav">
    <div className="nav-brand">
      <img src="/logo.svg" alt="Quantum Platform" className="nav-logo" />
      <span className="nav-title">Quantum Platform</span>
    </div>
    <div className="nav-links">
      <a href="#" className="nav-link active">Dashboard</a>
      <a href="#" className="nav-link">Intents</a>
      <a href="#" className="nav-link">Workflows</a>
      <a href="#" className="nav-link">Settings</a>
    </div>
    <div className="nav-actions">
      <button className="btn btn-ghost btn-sm">Profile</button>
    </div>
  </nav>
</div>

**Navigation Specifications**:
- **Height**: 64px
- **Background**: White with subtle border
- **Links**: 16px font size, 500 weight
- **Active State**: Blue color with subtle background
- **Hover State**: Subtle background color change

## Layout System

### Grid System

```css
/* 12-column grid system */
.grid {
  display: grid;
  grid-template-columns: repeat(12, 1fr);
  gap: 1rem;
}

.col-1 { grid-column: span 1; }
.col-2 { grid-column: span 2; }
.col-3 { grid-column: span 3; }
.col-4 { grid-column: span 4; }
.col-6 { grid-column: span 6; }
.col-8 { grid-column: span 8; }
.col-12 { grid-column: span 12; }

/* Responsive breakpoints */
@media (max-width: 768px) {
  .col-md-12 { grid-column: span 12; }
}
```

### Container System

```css
.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 1rem;
}

.container-sm { max-width: 640px; }
.container-md { max-width: 768px; }
.container-lg { max-width: 1024px; }
.container-xl { max-width: 1200px; }
```

## Accessibility Guidelines

### WCAG 2.1 AA Compliance

1. **Color Contrast**: Minimum 4.5:1 contrast ratio for normal text
2. **Keyboard Navigation**: All interactive elements accessible via keyboard
3. **Screen Reader Support**: Proper ARIA labels and semantic HTML
4. **Focus Indicators**: Clear focus indicators for all interactive elements
5. **Alternative Text**: Descriptive alt text for all images

### Accessibility Checklist

- [ ] All interactive elements have focus indicators
- [ ] Color is not the only way to convey information
- [ ] Text has sufficient contrast ratio
- [ ] Forms have proper labels and error messages
- [ ] Images have descriptive alt text
- [ ] Content is structured with proper heading hierarchy
- [ ] Interactive elements are keyboard accessible

## Responsive Design

### Breakpoints

```css
/* Mobile First Approach */
@media (min-width: 640px) { /* sm */ }
@media (min-width: 768px) { /* md */ }
@media (min-width: 1024px) { /* lg */ }
@media (min-width: 1280px) { /* xl */ }
@media (min-width: 1536px) { /* 2xl */ }
```

### Responsive Guidelines

1. **Mobile First**: Design for mobile devices first, then enhance for larger screens
2. **Touch Targets**: Minimum 44px touch targets for mobile devices
3. **Readable Text**: Ensure text is readable without horizontal scrolling
4. **Flexible Layouts**: Use flexible layouts that adapt to different screen sizes
5. **Performance**: Optimize images and assets for different screen densities

## Animation and Motion

### Animation Principles

1. **Purposeful**: Animations should serve a purpose, not just decoration
2. **Consistent**: Use consistent timing and easing functions
3. **Accessible**: Respect user preferences for reduced motion
4. **Performance**: Optimize animations for smooth 60fps performance

### Animation Specifications

```css
/* Standard timing functions */
:root {
  --timing-fast: 150ms;
  --timing-normal: 250ms;
  --timing-slow: 350ms;
  
  --easing-ease: cubic-bezier(0.4, 0, 0.2, 1);
  --easing-ease-in: cubic-bezier(0.4, 0, 1, 1);
  --easing-ease-out: cubic-bezier(0, 0, 0.2, 1);
  --easing-ease-in-out: cubic-bezier(0.4, 0, 0.2, 1);
}
```

## Implementation

### CSS Framework

The design system is built on top of Tailwind CSS with custom components and utilities.

```css
/* Custom CSS variables */
:root {
  --color-primary: #0066CC;
  --color-primary-dark: #004499;
  --color-primary-light: #3388DD;
  --color-success: #00CC66;
  --color-warning: #FF6600;
  --color-error: #CC0000;
  --color-text-primary: #1A1A1A;
  --color-text-secondary: #666666;
  --color-background: #F5F5F5;
  
  --font-family-sans: 'Inter', sans-serif;
  --font-family-mono: 'JetBrains Mono', monospace;
  
  --border-radius: 6px;
  --border-radius-lg: 8px;
  --shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  --shadow-lg: 0 4px 6px rgba(0, 0, 0, 0.1);
}
```

### Component Implementation

```tsx
// Button component example
interface ButtonProps {
  variant?: 'primary' | 'secondary' | 'outline' | 'ghost';
  size?: 'sm' | 'md' | 'lg';
  disabled?: boolean;
  loading?: boolean;
  children: React.ReactNode;
  onClick?: () => void;
}

export const Button: React.FC<ButtonProps> = ({
  variant = 'primary',
  size = 'md',
  disabled = false,
  loading = false,
  children,
  onClick,
}) => {
  const baseClasses = 'btn';
  const variantClasses = `btn-${variant}`;
  const sizeClasses = `btn-${size}`;
  const stateClasses = disabled ? 'btn-disabled' : '';
  
  return (
    <button
      className={`${baseClasses} ${variantClasses} ${sizeClasses} ${stateClasses}`}
      disabled={disabled || loading}
      onClick={onClick}
    >
      {loading ? <Spinner /> : children}
    </button>
  );
};
```

## Usage Guidelines

### Do's

- ✅ Use consistent spacing and typography
- ✅ Follow the color palette and guidelines
- ✅ Ensure accessibility compliance
- ✅ Test on multiple devices and screen sizes
- ✅ Use semantic HTML elements
- ✅ Provide clear feedback for user actions

### Don'ts

- ❌ Don't use colors outside the defined palette
- ❌ Don't create custom spacing values
- ❌ Don't ignore accessibility requirements
- ❌ Don't use animations that don't serve a purpose
- ❌ Don't create components that don't follow the design system
- ❌ Don't use fonts outside the defined typography scale

## Resources

### Design Tools

- **Figma**: Primary design tool for creating mockups and prototypes
- **Storybook**: Component library documentation and testing
- **Chroma**: Visual regression testing for components

### Development Tools

- **Tailwind CSS**: Utility-first CSS framework
- **TypeScript**: Type-safe component development
- **React**: Component library framework
- **Jest**: Component testing framework

---

*This design system ensures consistency, accessibility, and maintainability across all Quantum Platform interfaces.*
