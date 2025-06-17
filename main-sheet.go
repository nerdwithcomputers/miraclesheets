package main

import (
	// "fmt"

	// "fyne.io/fyne/v2"
	"fyne.io/fyne/v2/container"
	"fyne.io/fyne/v2/widget"
)

var StatBar = container.NewVBox(
	widget.NewLabel(string(10)),
	widget.NewLabel(string(10)),
)
