
# Auto added signals
set filterKeyword ".*"

set sigList		[list]
set nfacs		[ gtkwave::getNumFacs ]

# Auto added signals
set	maxDepth 1
for {set i 0} {$i < $nfacs } {incr i} {
    set facname [ gtkwave::getFacName $i ]
	set	splList	[ split $facname . ]
	if { [ llength $splList ] > $maxDepth} {
		set maxDepth [ llength $splList ]
	} 
    lappend sigList	"$facname"
}

for {set i 2} {$i < $maxDepth + 1 } {incr i} {
	puts $i
	foreach	aSig $sigList {
		set	splList	[ split $aSig . ]
		if { [ llength $splList ] == $i } {
			gtkwave::addSignalsFromList $aSig
		}
	}
}
# Add signals
#gtkwave::addSignalsFromList $sigList

# Ditch all signals
gtkwave::/Time/Zoom/Zoom_Best_Fit
gtkwave::setLeftJustifySigs on

#puts	"$uniqueSigs"
