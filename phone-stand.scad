// License: Creative Commons Attribution-ShareAlike 4.0 International
// License URL: http://creativecommons.org/licenses/by-sa/4.0/

// Customizable phone stand

Width = 60;       // [40:100]
Length = 80;      // [40:100]
Height = 20;      // [20:40]
GapSize = 12.5;   // [8:15]
GapDistance = 20; // [15:30]
GapAngle = 20;    // [15:25]

$fn = $preview ? 32 : 64;

module Base(width, length, height)
{
    difference()
    {
        minkowski()
        {
            translate([ 4, 4, 0 ])
            {
                cube([ width - 8, length - 8, height ]);
            }
            cylinder(r = 4, h = 1);
        }
    }
}

module Cutout(angle, size, width, distance)
{
    rotate(a = angle, v = [ -1, 0, 0 ])
    {
        translate([ -1, -size / 2, -size ])
        {
            cube([ width + 2, size, 100 ]);
        }
    }
}

module PhoneStand(width = Width, length = Length, height = Height, gapSize = GapSize, gapDistance = GapDistance,
                  gapAngle = GapAngle, center = true)
{
    offset = center ? [ -width / 2, -length / 2, 0 ] : [ 0, 0, 0 ];
    translate(offset)
    {
        difference()
        {
            Base(width, length, height);
            translate([ 0, GapDistance, Height ])
            {
                Cutout(gapAngle, gapSize, width, gapDistance);
            }
        }
    }
}

PhoneStand();
