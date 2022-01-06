$camRing = 31.75 / 2;
$neoRing = 23.3;
$neoRingHolder = 1;
$neoRingTh = 1;
$neoHolderTh = 2;
$totalHolderTh = $neoRingTh + $neoHolderTh;
$armLength = 30;
$armWidth = 10;
$armTh = 2.75;
$mountHole = 3.5;
$mountLength = 11;
$mountTh = 2;
$upperRampSize = 12.75;
$wireCut = 2;

$fn = 500;

// draw light ring neopixel holder
difference() {
	translate([0, 0, $totalHolderTh / 2])
		cylinder(h = $totalHolderTh, r = $neoRing, center = true);
	cylinder(h = 10, r = $camRing, center = true);
	translate([0, 0, $neoHolderTh/2])
		cylinder(h = $neoHolderTh, r = $neoRing - $neoRingHolder, center = true); 
	// remove holes for wiring in back
	for(i = [1:1:4]){
		rotate([0, 0, 15 + (i * 90)])
		rotate_extrude(angle = 60)
		translate([$neoRing - $neoHolderTh, 0])
			square([$wireCut, $neoRingTh + 20], center = true);
	}
}

// draw curl support
difference() {
	intersection() {
		translate([0, $camRing + (($neoRing - $camRing - $armTh) / 2) + .9, $totalHolderTh])
		rotate([45, 0, 0])
			cylinder(h = 10, r = $armWidth + 20, center = true);
		translate([0, 0, $totalHolderTh + ($armLength / 2)])
		cylinder(h = $armLength, r = $neoRing - $neoRingTh - $wireCut, center = true);
	}
	cylinder(h = 30, r = $camRing, center = true);
}


// draw arm
difference() {
	translate([0, $neoRing - 2, $totalHolderTh + ($armLength / 2)])
		cube([$armWidth, $armTh, $armLength], center = true);
}

// Draw arm curve
intersection() {
	translate([0, 0, $totalHolderTh + ($armLength / 2)])
	cylinder(h = $armLength, r = $neoRing, center = true);
	translate([0, $neoRing, $totalHolderTh + ($armLength / 2)])
	cube([10, 10, $armLength], center = true);
}

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










