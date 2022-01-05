$camRing = 31.75 / 2;
$neoRing = 23.3;
$neoRingHolder = 1;
$neoRingTh = 1;
$neoHolderTh = 3;
$totalHolderTh = $neoRingTh + $neoHolderTh;
$armLength = 30;
$armWidth = 10;
$armTh = 2.75;
$mountHole = 3.5;
$mountLength = 11;
$mountTh = 2;
$upperRampSize = 12.75;

$fn = 500;

// draw light ring neopixel holder
difference() {
    translate([0, 0, $totalHolderTh / 2])
        cylinder(h = $totalHolderTh, r = $neoRing, center = true);
    cylinder(h = 10, r = $camRing, center = true);
    translate([0, 0, $neoHolderTh/2])
    cylinder(h = $neoHolderTh, r = $neoRing - $neoRingHolder, center = true); 
}

// draw arm
difference() {
	translate([0, $neoRing - 2, $totalHolderTh + ($armLength / 2)])
		cube([$armWidth, $armTh, $armLength], center = true);
}

// draw lower arm ramp
translate([$armWidth / 2, $camRing, $totalHolderTh])
rotate([0, -90, 0])
linear_extrude(height = $armWidth) {
	polygon([
		[0, 0],
		[0, $neoRing - $camRing - $armTh],
		[$neoRing - $camRing - $armTh, $neoRing - $camRing - $armTh] ]
		);
}

// calculate actual size to get extrude angle. use maths
rotate(90)
rotate_extrude(angle = 13)
translate([$neoRing - ($armTh / 2), $totalHolderTh + ($armLength / 2)])
square([$armTh, $armLength], center = true);

rotate(90)
rotate_extrude(angle = -13)
translate([$neoRing - ($armTh / 2), $totalHolderTh + ($armLength / 2)])
square([$armTh, $armLength], center = true);

// draw upper ramp
// -1 to mate ramp with arm - maybe + 1 arm size if needed?
translate([0, $neoRing + $upperRampSize - 1, $totalHolderTh + $armLength])
rotate([0, 90, 180])
linear_extrude(height = $armWidth, center = true) {
	polygon([
		[0, 0],
		[0, $upperRampSize],
		[$upperRampSize, $upperRampSize] ]
		);
}

// draw tripod mount
translate([0,$neoRing + $upperRampSize - $mountTh,$totalHolderTh + $armLength + ($mountLength / 2)])
difference() {
	cube([$armWidth, $mountTh, $mountLength], center = true);
	rotate([90,0,0])
	cylinder(h = $mountTh, r = $mountHole, center = true);
	
}










