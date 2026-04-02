---
name: image-manipulation
description: Resize, convert, compress, and batch-process images using ImageMagick. Use when the user mentions image optimization, format conversion, thumbnail generation, or bulk image operations.
metadata:
  author: your-org
  version: "1.0"
---

# Image Manipulation with ImageMagick

## When to Use This Skill

Use this skill when:
- User wants to resize, crop, or convert images
- User mentions image optimization or compression
- User needs to batch process multiple images
- User asks about ImageMagick commands

## Prerequisites

ImageMagick must be installed:
- macOS: `brew install imagemagick`
- Ubuntu: `sudo apt install imagemagick`
- Windows: Download from imagemagick.org

## Instructions

### Resizing Images

To resize an image while maintaining aspect ratio:

```bash
magick input.jpg -resize 800x600 output.jpg
```

To resize to exact dimensions (may distort):

```bash
magick input.jpg -resize 800x600! output.jpg
```

### Batch Processing

Process all images in a directory:

```bash
for img in *.jpg; do
  magick "$img" -resize 50% "resized_$img"
done
```

### Format Conversion

Convert between formats:

```bash
magick input.png output.jpg
magick input.jpg -quality 85 output.webp
```

## Common Patterns

| Task | Command |
|------|---------|
| Resize to width | `magick in.jpg -resize 800x out.jpg` |
| Resize to height | `magick in.jpg -resize x600 out.jpg` |
| Create thumbnail | `magick in.jpg -thumbnail 150x150^ -gravity center -extent 150x150 thumb.jpg` |
| Compress JPEG | `magick in.jpg -quality 80 out.jpg` |
| Convert to WebP | `magick in.png out.webp` |

## Edge Cases

- **Animated GIFs**: Use `-coalesce` before processing
- **CMYK images**: Convert to RGB first with `-colorspace sRGB`
- **Large batches**: Process in chunks to avoid memory issues****
